local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Maybe                 = require (cppdpath .. "Lib/Maybe")
local npcExceptions         = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local elevators             = require (cppdpath .. "Maps/MapExceptions/Elevators")
local digways               = require (cppdpath .. "Maps/MapExceptions/Digways")

local digUndiscovered       = "I better not venture in"
local transmatDialogReached = "You are detectedly already in the lobby of Pokecenter"
local useDigway             = "Do you want to attempt to use it?"
local subwayDialogCheck     = "Where would you like to go? Takes only $2500."
local subwayDialogAnswers   = {["Viridian City Subway"] = 1, ["Pewter City Subway"] = 2, ["Cerulean City Subway"] = 3, ["Vermilion City Subway"] = 4, ["Lavender Town Subway"] = 5, ["Celadon City Subway"] = 6, ["Fuchsia City Subway"] = 7, ["Saffron City Subway"] = 8, ["Azalea Town Subway"] = 1, ["Blackthorn City Subway"] = 2, ["Cherrygrove City Subway"] = 3, ["Ecruteak City Subway"] = 4, ["Goldenrod City Subway"] = 5, ["Mahogany Town Subway"] = 6, ["Olivine City Subway"] = 7, ["Violet City Subway"] = 8}

local function solveNpc(message, n1, n2)
    local npcExce = npcExceptions[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(npcExce[2] and npcExce[3], "PathFinder --> npc dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if message == npcExce[3] then
        for _, push in pairs(npcExce[2]) do
            pushDialogAnswer(push)
            pushLog = pushLog .. " " .. push
        end
        log(pushLog)
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
    log(pushLog .. " " .. digIndex)
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
        log("Pathfinder: Pushing dialog: 2 (Not using the digway just discovered.)")
        return true
    end
    return false
end

-- answer is the destination node, we make sure the option is available, if not we ask more options.
local function solveSubway(message, n1, n2)
    local subwayAnswerOffered = 4
    local answer = subwayDialogAnswers[n2]
    if answer > subwayDialogAnswers[n1] then
        answer = answer - 1
    end
    if answer > subwayAnswerOffered then
        pushDialogAnswer("More Options")
    end
    return pushDialogAnswer(n2)
end

-- local function solveTransmat(message)
--     if string.find(message, transmatDialogReached) then
--         TransmatReached = true
--         pushDialogAnswer(2)
--         return true
--     end
--     return false
-- end

local function solveDialog(message, pf)
    local n1 = pf.from
    local n2 = pf.toMap
    if pf.exceptionExist(npcExceptions, n1, n2) then
        return solveNpc(message, n1, n2)
    elseif message == useDigway and pf.exceptionExist(digways, n1, n2) and pf.isDigPathEnabled() then
        return solveDigway(n1, n2, pf.abilitiesIndex.dig)
    elseif solveOutlet(message, pf) then
        return
    elseif pf.exceptionExist(elevators, n1, n2) then
        return solveElevator(message, n1, n2)
    elseif message == subwayDialogCheck and pf.isSubwayPath(n1, n2) then
        return solveSubway(message, n1, n2)
    -- elseif solveTransmat(message) then
    --     return
    end
end

return { solveDialog = solveDialog }