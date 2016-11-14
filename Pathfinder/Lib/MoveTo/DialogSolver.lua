local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Maybe                 = require (cppdpath .. "Lib/Maybe")
local Lib                   = require (cppdpath .. "Lib/Lib")
local npcExceptions         = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local elevators             = require (cppdpath .. "Maps/MapExceptions/Elevators")
local digways               = require (cppdpath .. "Maps/MapExceptions/Digways")
local transmats             = require (cppdpath .. "Maps/MapExceptions/Transmats")


local digUndiscovered       = "I better not venture in"
local useTransmat           = "What destination's Pokemon Center would you like to be transmitted to? It will cost $2,500 Pokedollars per travel."
local transmatDialogReached = {"You are detectedly already in the lobby of Pokecenter", "You have been transported to the transmat-station lobby of Pokecenter "}
local transmatDialogPage    = nil
local useDigway             = {"Do you want to attempt to use it?", "Do you want to attempt to use it? It leads to one of these outlets."}
local useDive               = {"These look like deeper waters. Do you want to Dive here?", "Do you want to Dive here?", "Do you want to go to the surface?"}
local subwayDialogCheck     = "Where would you like to go? Takes only $2500."
local subwayDialogAnswers   = {["Viridian City Subway"] = 1, ["Pewter City Subway"] = 2, ["Cerulean City Subway"] = 3, ["Vermilion City Subway"] = 4, ["Lavender Town Subway"] = 5, ["Celadon City Subway"] = 6, ["Fuchsia City Subway"] = 7, ["Saffron City Subway"] = 8, ["Azalea Town Subway"] = 1, ["Blackthorn City Subway"] = 2, ["Cherrygrove City Subway"] = 3, ["Ecruteak City Subway"] = 4, ["Goldenrod City Subway"] = 5, ["Mahogany Town Subway"] = 6, ["Olivine City Subway"] = 7, ["Violet City Subway"] = 8}

local function solveNpc(message, n1, n2)
    local npcExce = npcExceptions[n1][n2]
    assert(npcExce[2] and npcExce[3], "PathFinder --> npc dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if message == npcExce[3] then
        pushDialogAnswer(npcExce[2])
        log("Pathfinder: Pushing dialog: " .. npcExce[2])
    end
end

local function solveElevator(message, n1, n2)
    local exce = elevators[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(exce[2] and exce[3] and exce[4] and Maybe.isJust(exce[5] and exce[6]), "PathFinder --> elevator dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if message == exce[3] then
        for _, push in pairs(exce[2]) do
            pushDialogAnswer(push)
            pushLog = pushLog .. " " .. push
        end
        log(pushLog)
    elseif message == exce[4] then
        exce[5] = true
    end
end

local function solveDigway(n1, n2, digIndex)
    local exce = digways[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(exce[1] and exce[2], "PathFinder --> digway exception is missing some data. " .. n1 .. " -> " .. n2)
    for _, push in pairs(exce[2]) do
        pushDialogAnswer(push)
        pushLog = pushLog .. " " .. push
    end
    pushDialogAnswer(digIndex)
    Lib.log1time(pushLog .. " " .. digIndex)
end

local function solveDive(diveIndex)
    pushDialogAnswer(1)
    pushDialogAnswer(diveIndex)
    log("Pathfinder: Pushing dialog: 1 " .. diveIndex)
end

local function solveOutlet(message, pf)
    if string.find(message, digUndiscovered) then
        pf.disableDigPath()
        pf.setOutlet()
        pf.resetPath()
        return true
    elseif pf.outletInNode() then -- outlet discovered
        pf.unsetOutlet()
        pf.enableDigPath()
        pushDialogAnswer(2)
        log("Pathfinder: Pushing dialog: 2 (Not using the digway just discovered).")
        return true
    end
    return false
end

-- answer is the destination node, we make sure the option is available, if not we ask more options.
local function solveSubway(message, n1, n2)
    local pushLog = "Pathfinder: Pushing dialog: "
    local subwayAnswerOffered = 4
    local answer = subwayDialogAnswers[n2]
    if answer > subwayDialogAnswers[n1] then
        answer = answer - 1
    end
    if answer > subwayAnswerOffered then
        pushDialogAnswer("More Options")
        pushLog = pushLog .. "More Options, "
    end
    pushDialogAnswer(n2)
    Lib.log1time(pushLog .. n2 .. ".")
end

local function solveTransmat(n2)
    n2 = n2:gsub("Pokecenter ", "")
    assert(transmats[n2], "PathFinder --> Transmat exception does not exist for destination: " .. n2)
    transmatDialogPage = transmatDialogPage or transmats[n2][1]
    if transmatDialogPage > 1 then
        transmatDialogPage = transmatDialogPage - 1
        log("Pathfinder: Pushing dialog: More")
        pushDialogAnswer("More")
    else
        log("Pathfinder: Pushing dialog: " .. n2)
        pushDialogAnswer(n2)
        transmatDialogPage = nil
    end
end

-- set true if we arrive at destination
local function solveTransmatReached(message, n2)
    n2 = n2:gsub("Pokecenter ", "")
    assert(string.find(message, n2, 1, true), "Pathfinder --> Incorrect transmat destination reached, was expecting: Pokecenter " .. n2 .. ".\n Dialog message: " .. message)
    transmats[n2][2] = true
end

local function isTransmatReached(message, dialogs)
    for i, check in ipairs(dialogs) do
        if string.find(message, check, 1, true) then
            if i == 1 then
                pushDialogAnswer("No.")
                log("Pathfinder: Pushing dialog: No. (Not using transmat since we're already there).")
            end
            return true
        end
    end
    return false
end

local function solveDialog(message, pf)
    local n1 = pf.from
    local n2 = pf.toMap
    if pf.exceptionExist(npcExceptions, n1, n2) then
        return solveNpc(message, n1, n2)
    elseif Table.inTable(useDigway, message) and pf.exceptionExist(digways, n1, n2) and pf.isDigPathEnabled() then
        return solveDigway(n1, n2, pf.abilitiesIndex.dig)
    elseif Table.inTable(useDive, message) then
        return solveDive(pf.abilitiesIndex.dive)
    elseif solveOutlet(message, pf) then
        return
    elseif pf.exceptionExist(elevators, n1, n2) then
        return solveElevator(message, n1, n2)
    elseif message == subwayDialogCheck and pf.isSubwayPath(n1, n2) then
        return solveSubway(message, n1, n2)
    elseif message == useTransmat then
        return solveTransmat(n2)
    elseif isTransmatReached(message, transmatDialogReached) then
        return solveTransmatReached(message, n2)
    end
end

return { solveDialog = solveDialog }