local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local Array           = require (cdpath .. "Array")
local Game            = require (cdpath .. "Game")
local Lib             = require (cdpath .. "Lib")
local Table           = require (cdpath .. "Table")
local Settings        = require (cppdpath .. "Settings/WorkSettings")

local work = {}

local digIndex           = nil
local headbuttIndex      = nil
local currentMap         = nil
local digSpots           = nil
local headbuttTrees      = nil
local BerryTrees         = nil
local discoverItems      = nil
local targets            = nil
local selectPokeWithMove = nil
local npcTypes           = nil
local npcTypesList       = nil
local dialogs            = {
    ["Select a Pokemon that has Headbutt."] = function() pushDialogAnswer(headbuttIndex) end,
    ["Select a Pokemon that has Dig."] = function() pushDialogAnswer(digIndex) end,
}
local uncollectableItems = {
    ["Route 32"] = {{10, 95}},
    ["Route 104 House"] = true
}

local function resetData()
    digSpots      = {}
    headbuttTrees = {}
    BerryTrees    = {}
    discoverItems = {}
    targets       = {}
    currentMap    = nil
end

-- true if elem[data] is a key of t
local function hasKey(t, data)
    return function(elem)
        return t[elem[data]] ~= nil
    end
end

local function getTargets(opts)
    local npcs = getNpcData()
    local tKeep = {npcTypes.abandonnedPkm--[[, npcTypes.pokeStop]], npcTypes.test}
    if opts.headbutt and headbuttIndex then
        tKeep[#tKeep + 1] = npcTypes.headbutt
    end
    if opts.dig and digIndex then
        tKeep[#tKeep + 1] = npcTypes.dig
    end
    if opts.harvest then
        tKeep[#tKeep + 1] = npcTypes.berries
    end
    if opts.discover then
        tKeep[#tKeep + 1] = npcTypes.items
    end
    tKeep = Table.join(tKeep)
    npcs = Array.filter(hasKey(tKeep, "type"))(npcs)
    return npcs
end


local function getClosest(x, y, targets)
    local closest     = nil
    local target      = nil
    local iTarget     = nil
    for i, t in ipairs(targets) do
            local dist = Game.getDistance(x, y, t.x, t.y)
            if not closest or dist < closest then
                closest = dist
                target  = t
                iTarget = i
            end
    end
    return iTarget, target
end

-- some items are not collectables.
local function isBlacklisted(target)
    if uncollectableItems[currentMap] == true then
        return true
    elseif type(uncollectableItems[currentMap]) == "table" then
        for _, loc in ipairs(uncollectableItems[currentMap]) do
            if loc[1] == target.x and loc[2] == target.y then
                return true
            end
        end
    end
    return false
end

-- is working expects parameter opts to contain an array with keys : dig, harvest, discover, headbutt, headbuttIndex, digIndex. Bool values.
-- return true if doing an action, false means it's done it's job.
function work.isWorking(map, opts)
    if map ~= currentMap and opts then
        currentMap = map
        headbuttIndex = Game.getPokemonNumberWithMove("Headbutt", 155)
        digIndex = Game.getPokemonNumberWithMove("Dig")
        targets = getTargets(opts)
    end
    while targets and #targets ~= 0 do
        local targetIndex, currentTarget = getClosest(getPlayerX(), getPlayerY(), targets)
        assert(targets[targetIndex], "Work --> getClosest returned inexisting target Index:" .. targetIndex)
        if not isBlacklisted(currentTarget) and isNpcOnCell(currentTarget.x, currentTarget.y) and talkToNpcOnCell(currentTarget.x, currentTarget.y) then
            Lib.log1time("Work: Checking " .. npcTypesList[currentTarget.type] .. " on cell X: " .. currentTarget.x .. ", Y:" .. currentTarget.y .. ".")
            return true
        end
        assert(table.remove(targets, targetIndex), "Work --> Failed to remove index: " .. targetIndex)
    end
    return false
end

function onWorkStart()
    resetData()
    npcTypes = Settings.getNpcTypes()
    assert(type(npcTypes) == "table", "Work --> Failed to npc type list.")
    npcTypesList = Table.join(npcTypes)
end

function onWorkDialogMessage(message)
    if targets then
        for check, f in pairs(dialogs) do
            if string.find(message, check) then
                f()
            end
        end
    end
end

registerHook("onStart", onWorkStart)
registerHook("onDialogMessage", onWorkDialogMessage)

return work
