local lib = require "Pathfinder/Lib/lib"
local aStar = require "Pathfinder/Lib/lua-astar/AStar"
local GlobalMap = require "Pathfinder/Maps/GlobalMap"
local Digways = require "Pathfinder/Maps/DigwaysMap"
local MapExceptions = require "Pathfinder/Maps_Exceptions"
local DescMaps = MapExceptions.DescMaps
local ExceRouteEdit = MapExceptions.ExceRouteEdit
local PathSolution = {}
local PathDestStore = ""
local Outlet = nil

-----------------------------------
----- A* NECESSARY  FUNCTIONS -----
-----------------------------------

-- return keys from table
local function getKeys(tab)
	local keys = {}
	for k, v in pairs(tab) do
		table.insert(keys, k)
	end
	return keys
end

-- return a table of node, linked to the node n
local function expand(n)
	return getKeys(GlobalMap[n])
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
local function goal(dest)
	return function(node)
		if dest == "Pokecenter" then
			return string.find(node, dest) or node == "Indigo Plateau Center"
		else
			return node == dest
		end
	end
end

-- call simplification
local simpleAStar = aStar(expand)(cost)(heuristic)

---------------------------
--- EXCEPTION  HANDLING ---
---------------------------

-- CALL FUNCTION ON EXCEPTION TABLE
local function SolvingException(EMap)
	for index, value in pairs(DescMaps) do
		if index == EMap then
			MapExceptions.SetPathSolution(PathSolution)
			for val, func in pairs(DescMaps[index]) do
				if DescMaps[index][val]() == false then
					return
				end
			end
		end
	end
end

-- CHECK EXCEPTION MAP1 MAP2 SUBWAY MAPS ( KANTO AND JOHTO CASE )
local function CheckSubwayExce(map1, map2)
	return string.find(map1, "Subway") and string.find(map2, "Subway")
end

-- CHECK EXCEPTION MAP1 TO MAP2    - IF FOUND CALL RESOLUTION EXCEPTION
local function CheckException(map1, map2)
	local EMap = map1 .. "_to_" .. map2
	for index, value in pairs(DescMaps) do
		if index == EMap then
			SolvingException(EMap)
			return true
		end
	end
	if CheckSubwayExce(map1, map2) then
		MapExceptions.SolvSubExce(map1, map2)
		return true
	end
end

-- FUNCTION NO BULTIN FOR ADD VALUE ON A TABLE
local function replacepath(startpos, endpos, namexc)
	local temppath = {}
	for posS=1,(startpos-1) do
		table.insert(temppath,PathSolution[posS])
	end
	for posex, val in pairs(ExceRouteEdit[namexc][1]) do
		table.insert(temppath,ExceRouteEdit[namexc][2][posex])
	end
	for posE=1,(lib.tablelength(PathSolution) - endpos) do
		table.insert(temppath,PathSolution[(endpos + posE)])
	end
	PathSolution = temppath
end

-- EDIT PATH FOR NO EDIT BASIC MAP TABLE
local function EditPathGenerated()
	local found = false
	for val, zone in pairs(PathSolution) do -- for every val in array path
		for valx, exce in pairs(ExceRouteEdit) do -- for every val in exception, based on path, compare
			if zone == ExceRouteEdit[valx][1][1] then -- if 1 of element is a start of exception- get table length exception
				found = true
				for stat, element in pairs(ExceRouteEdit[valx][1]) do
					local posp = val - 1
					if not (element == PathSolution[(posp + stat)]) then
						found = false
					end
				end
				if found == true then
					local exclng = tonumber(val - 1 + lib.tablelength(ExceRouteEdit[valx][1]))
					replacepath(val, exclng, valx)
					return
				end
			end
		end
	end
end

-- DISCOVERING OUTLET

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
			lib.swap(Digways[currentMap], Digways[currentMap .. "_2"]) -- swap digways arround for currentMap
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
		talkToNpcOnCell(Digways[current].x, Digways[current].y)
		-- Outlet.found = true
		return true
	end
	return false
end

---------------------------
--- FUNCTION FOR MOVETO ---
---------------------------

-- RESET PATH ON STOP
local function ResetPath()
	PathDestStore = ""
end

local function MovingApply(ToMap)
	if lib.useBike() then
		return true
	elseif CheckException(getMapName(), PathSolution[1]) then
		return true
	else
		lib.log1time("Maps Remains: " .. lib.tablelength(PathSolution) .. "  Moving To: --> " .. PathSolution[1])
		if moveToMap(ToMap) then
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
	if lib.tablelength(PathSolution) > 0 then
		if PathSolution[1] == getMapName() then
			table.remove(PathSolution, 1)
			if lib.tablelength(PathSolution) > 0 then
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

local Settings = nil

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
	Settings.bike = hasItem("Bicycle")
	Settings.dig = lib.getPokemonNumberWithMove("Dig", 155)
	if Settings.dig == 0 then Settings.dig = false end
	ApplySettings()
end

-- MOVETO DEST
local function MoveTo(Destination)
	local map = getMapName()

	lib.ifNotThen(Settings, initSettings)
	if Outlet and checkOutlet(map) then
		return true
	elseif PathDestStore == Destination then
		return MoveWithCalcPath()
	else
		PathSolution = simpleAStar(goal(Destination))(map)
		if not PathSolution then
			return fatal("Path Not Found ERROR")
		end
		PathDestStore = Destination
		EditPathGenerated()
		log("Path: " .. table.concat(PathSolution,"->"))
		return MoveWithCalcPath()
	end
	return false
end

-- SETTINGS CALLS
local function EnableBikePath()
	lib.ifNotThen(Settings, initSettings)
	Settings.bike = true
	log("BIKE PATH ENABLED")
	ApplySettings()
end

local function DisableBikePath()
	lib.ifNotThen(Settings, initSettings)
	Settings.bike = false
	log("BIKE PATH DISABLED")
	ApplySettings()
end

local function EnableDigPath()
	lib.ifNotThen(Settings, initSettings)
	Settings.dig = true
	log("DIG PATH ENABLED")
	ApplySettings()
end

local function DisableDigPath()
	lib.ifNotThen(Settings, initSettings)
	Settings.dig = false
	log("DIG PATH DISABLED")
	ApplySettings()
end

-- move to nearest PC
local function MoveToPC()
	return MoveTo("Pokecenter")
end

local function UseNearestPokecenter()
    map = getMapName()
	if string.find(map, "Pokecenter") then
		return assert(usePokecenter(), "usePokecenter() failed")
    elseif map == "Indigo Plateau Center" then
        return assert(talkToNpcOnCell(4, 22), "Failed to talk to Nurse on Cell 4/22")
	else return MoveToPC()
	end
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

local function onPathfinderStop()
	ResetPath()
end

registerHook("onDialogMessage", onPathfinderDialogMessage)
registerHook("onStop", onPathfinderStop)

-- RETURN TABLE FOR USER
return {
	MoveTo = MoveTo,
	MoveToPC = MoveToPC,
	UseNearestPokecenter = UseNearestPokecenter,
	EnableBikePath = EnableBikePath,
	DisableBikePath = DisableBikePath,
	EnableDigPath = EnableDigPath,
	DisableDigPath = DisableDigPath,
}