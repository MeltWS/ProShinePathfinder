local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local lib            = require (cdpath .. "Lib/lib")
local Table          = require (cdpath .. "Lib/Table")
local Work           = require (cdpath .. "Lib/Work")
local _ss            = require (cdpath .. "Settings/static_Settings")
local ss             = nil
local workOpts       = {}
local aStar          = require (cdpath .. "Lib/lua-astar/AStar")
-- local _GlobalMap     = require (cdpath .. "Maps/GlobalMap")
local _GlobalMap     = require (cdpath .. "Maps/Kanto/TestKantoMap")
local GlobalMap      = {}
local Digways        = require (cdpath .. "Maps/Digways/DigwaysMap")
local SubMaps        = require (cdpath .. "Maps/MapExceptions/SubstituteMaps")
local MapExceptions  = require (cdpath .. "Maps_Exceptions")
local DescMaps       = MapExceptions.DescMaps
local ExceRouteEdit  = MapExceptions.ExceRouteEdit
local PathSolution   = {}
local destStore      = ""
local Outlet         = nil
local Settings       = nil

-----------------------------------
----- A* NECESSARY  FUNCTIONS -----
-----------------------------------

-- return a table of node, linked to the node n
local function expand(n)
    assert(type(GlobalMap[n]) == "table", "Received node \"" .. n .. "\" doesn't exist in the map.")
    return Table.getKeys(GlobalMap[n])
end

-- Take 2 nodes return dist
local function cost(from, to)
    return GlobalMap[from][to]
end

-- return estimated cost of goal, 0 is dijkstra
local function heuristic(n)
    return 0
end

-- return true if destination is reached
local function goal(targets)
    return function(current)
        return lib.inTable(targets, current)
    end
end

-- call simplification
local simpleAStar = aStar(expand)(cost)(heuristic)

---------------------------
--- EXCEPTION  HANDLING ---
---------------------------

-- CHECK EXCEPTION MAP1 MAP2 SUBWAY MAPS ( KANTO AND JOHTO CASE )
local function CheckSubwayExce(map1, map2)
    return string.find(map1, "Subway") and string.find(map2, "Subway")
end

local function exceptionExist(n1, n2)
    return DescMaps[n1] and DescMaps[n1][n2]
end

-- CHECK EXCEPTION MAP1 TO MAP2    - IF FOUND CALL RESOLUTION EXCEPTION
local function CheckException(n1, n2)
    if exceptionExist(n1, n2) then
        return assert(moveToCell(table.unpack(DescMaps[n1][n2])), "Pathfinder --> Error: Exception invalid for:" .. n1 .. " -> " .. n2)
    end
    if CheckSubwayExce(n1, n2) then
        MapExceptions.SolvSubExce(n1, n2)
        return true
    end
end

local function isSameMap(n1, n2)
    return n1 and n1:gsub("_%u$", "") == n2:gsub("_%u$", "")
end

-- Search for case with 2 sub of the same map in a row, and remove the 2nd one.
-- A -> B1 -> B2 -> C becomes A -> B1 -> C if no exception exist
local function EditPathGenerated()
    local n1 = nil
    local ePath = {}
    for i, n2 in ipairs(PathSolution) do
        if not isSameMap(n1, n2) or exceptionExist(n1, n2) then
            table.insert(ePath, n2)
        end
        n1 = n2
    end
    PathSolution = ePath
end

-- return the node coresponding to the current player pos.
local function getPlayerNode()
    local map = getMapName()
    if SubMaps[map] then
        for subMap, locs in pairs(SubMaps[map]) do
            for _, rect in ipairs(locs) do
                if lib.inRectangle(table.unpack(rect)) then
                    return subMap
                end
            end
        end
    error("Pathfinder --> sub map could not be defined, map: " .. map .. "  x: " .. getPlayerX() .. "  y: " .. getPlayerY())
    end
    return map
end

-- Create a new list with destination maps, and replace map that have submaps
local function getDestNodes(dest)
    local destNodes = {}
    if type(dest) == "string" then
        dest = {dest}
    end
    for _, map in pairs(dest) do
        if SubMaps[map] then  -- if the map has sub maps
            for submap, _ in pairs(SubMaps[map]) do
                table.insert(destNodes, submap)
            end
        else
            table.insert(destNodes, map)
        end
    end
    return destNodes
end

---------------------
-- DISCOVERING OUTLET
---------------------

--SET OUTLET
local function SetOutlet(currentMap)
    if not currentMap then
        Outlet = nil
        return
    end
    local outletMap = Digways[currentMap].outletMap
    Outlet = {}
    Outlet.map = outletMap
    Outlet.found = false
    if outletMap == currentMap then -- if the outlet is on the same map
        if Digways[currentMap].inRectangle() then -- if the outlet is the other digway on the same map
            Digways[currentMap], Digways[currentMap .. "_2"] = Digways[currentMap .. "_2"], Digways[currentMap]-- swap digways arround for currentMap
        end
        Outlet.inRectangle = Digways[currentMap].inRectangle
    else
        Outlet.inRectangle = function() return true end
    end
end

-- CHECK IF LOC MATCHING OUTLET / BOT
local function OutletFound(current)
    if Outlet then
        return current == Outlet.map and Outlet.inRectangle()
    else
        return false
    end
end

-- DISCOVER OUTLET IF POSSIBLE
local function checkOutlet(current)
    if OutletFound(current) then
        return assert(talkToNpcOnCell(Digways[current].x, Digways[current].y), "Pathfinder -> could not discover outlet, map: " .. current .. " x:" .. x .. " y:" .. y)
    end
    return false
end

---------------------------
--- FUNCTION FOR MOVETO ---
---------------------------

-- RESET PATH ON STOP
local function ResetPath()
    destStore = ""
end

local function MovingApply(toMap)
    lib.log1time("Maps Remains: " .. #PathSolution .. "  Moving To: --> " .. toMap)
    if CheckException(getPlayerNode(), toMap) then
        return true
    else
        toMap = toMap:gsub("_%u$", "") -- remove split map tags
        if moveToMap(toMap) then
            return true
        else
            ResetPath()
            lib.log1time("Error in Path - Reset and Recalc")
            swapPokemon(getTeamSize(), getTeamSize() - 1)
            return true
        end
    end
end

local function MoveWithCalcPath()
    if #PathSolution > 0 then
        if PathSolution[1] == getPlayerNode() then
            table.remove(PathSolution, 1)
            if #PathSolution > 0 then
                return MovingApply(PathSolution[1])
            end
            return false
        else
            return MovingApply(PathSolution[1])
        end
    end
    return false
end

---------------------------
-------- SETTINGS ---------
---------------------------

local function setLink(n1, n2, dist)
    GlobalMap[n1][n2] = dist
end

local function unsetLink(n1, n2)
    GlobalMap[n1][n2] = nil
end

-- MODIF NODEMAP ACCORDING TO SETTINGS
local function ApplySettings()
    -- BIKE PATHS
    if Settings.bike then
        setLink("Route 18", "Route 17", 1)
        setLink("Route 17", "Route 18", 1)
    else
        unsetLink("Route 18", "Route 17")
        unsetLink("Route 17", "Route 18")
    end
    -- DIG PATHS
    if Settings.dig then
        MapExceptions.EnableDigPath()
        -- Kanto
        setLink("Route 11", "Route 2", 1)
        setLink("Route 2", "Route 11", 1)
        setLink("Route 4", "Route 3", 1)
        setLink("Route 3", "Route 4", 1)
        -- Johto
        setLink("Route 31", "Route 45", 1)
        setLink("Route 45", "Route 31", 1)
        setLink("Route 33", "Route 32", 1)
        setLink("Route 32", "Route 33", 1)
        setLink("Blackthorn City", "Route 44", 1)
        setLink("Route 44", "Blackthorn City", 1)
    else
        MapExceptions.DisableDigPath()
        -- Kanto
        unsetLink("Route 11", "Route 2")
        unsetLink("Route 2", "Route 11")
        unsetLink("Route 4", "Route 3")
        unsetLink("Route 3", "Route 4")
        -- Johto
        unsetLink("Route 31", "Route 45")
        unsetLink("Route 45", "Route 31")
        unsetLink("Route 33", "Route 32")
        unsetLink("Route 32", "Route 33")
        unsetLink("Blackthorn City", "Route 44")
        unsetLink("Route 44", "Blackthorn City")
    end
end

-- INIT SETTINGS WITH CURRENT INVENTORY AND TEAM
local function initSettings()
    Settings = {}
    Settings.bike = hasItem(ss.MOUNT)
    Settings.dig = lib.getPokemonNumberWithMove("Dig", 155)
    if Settings.dig == 0 then Settings.dig = false end
    -- ApplySettings()
end

-- MOVETO DEST
local function MoveTo(dest)
    local map = getMapName()
    dest = getDestNodes(dest)
    if lib.useMount(ss.MOUNT) then
        return true
    elseif Outlet and checkOutlet(map) then
        return true
    elseif Work.isWorking(map, workOpts) then
        return true
    elseif destStore == table.concat(dest, "|") then
        return MoveWithCalcPath()
    else
        PathSolution = simpleAStar(goal(dest))(getPlayerNode())
        assert(PathSolution, "Path Not Found ERROR")
        destStore = table.concat(dest, "|")
        EditPathGenerated()
        log("Path: " .. table.concat(PathSolution,"->"))
        return MoveWithCalcPath()
    end
    return false
end

-- SETTINGS CALLS
local function EnableBikePath()
    Settings.bike = true
    log("BIKE PATH ENABLED")
    ApplySettings()
end

local function DisableBikePath()
    Settings.bike = false
    log("BIKE PATH DISABLED")
    ApplySettings()
end

local function EnableDigPath()
    Settings.dig = true
    log("DIG PATH ENABLED")
    ApplySettings()
end

local function DisableDigPath()
    Settings.dig = false
    log("DIG PATH DISABLED")
    ApplySettings()
end

local self = {
ResetPath = ResetPath,
EnableDigPath = EnableDigPath,
DisableDigPath = DisableDigPath,
SetOutlet = SetOutlet,
OutletFound = OutletFound
}

local function onPathfinderDialogMessage(message)
    MapExceptions.SolveDialog(message, self)
end

local function onPathfinderStart()
    GlobalMap = assert(_GlobalMap(), "Error : failed to laod map")
    ss        = assert(_ss(), "Error : failed to load settings")
    initSettings()
    workOpts.dig = ss.DIG
    workOpts.harvest = ss.HARVEST
    workOpts.headbutt = ss.HEADBUTT
    workOpts.discover = ss.DISCOVER
end

local function onPathfinderStop()
    ResetPath()
end

registerHook("onStart", onPathfinderStart)
registerHook("onDialogMessage", onPathfinderDialogMessage)
registerHook("onStop", onPathfinderStop)

-- RETURN TABLE FOR USER
return {
    MoveTo = MoveTo,
    EnableBikePath = EnableBikePath,
    DisableBikePath = DisableBikePath,
    EnableDigPath = EnableDigPath,
    DisableDigPath = DisableDigPath,
}
