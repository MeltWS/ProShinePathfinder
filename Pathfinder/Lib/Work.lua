local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local Table           = require (cdpath .. "Table")
local Game            = require (cdpath .. "Game")
local Lib            = require (cdpath .. "Lib")

local discardedNpc = 0

local work = {}

local digIndex           = nil
local headbuttIndex      = nil
local prevMap            = nil
local digSpots           = nil
local headbuttTrees      = nil
local BerryTrees         = nil
local discoverItems      = nil
local targetIndex        = nil
local targets            = nil
local selectPokeWithMove = nil
local currentTarget      = nil
local dialogs            = {
    ["You harvested "] = function() end,      -- berries
    ["You have harvested "] = function() end, -- berries
    ["You found "] = function() end,          -- loot item
    ["Obtained "] = function() end,          -- loot item
    ["You've found "] = function() end,      -- loot item
    ["You obtained "] = function() end,       -- loot TM
    ["Select a Pokemon that has Headbutt."] = function() pushDialogAnswer(headbuttIndex) end,
    ["Select a Pokemon that has Dig."] = function() pushDialogAnswer(digIndex) end,
}

local function resetData()
    digSpots      = {}
    headbuttTrees = {}
    BerryTrees    = {}
    discoverItems = {}
    targets       = {}
    targetIndex   = nil
    currentTarget        = nil
    prevMap       = nil
end

local function getNpcsData(opts)
    if opts then
        if opts.headbutt and opts.headbuttIndex then
            headbuttTrees = assert(getActiveHeadbuttTrees())
        end
        if opts.dig and opts.digIndex then
            digSpots = assert(getActiveDigSpots())
        end
        if opts.harvest then
            BerryTrees = assert(getActiveBerryTrees())
        end
        if opts.discover then
            discoverItems = assert(getDiscoverableItems())
        end
    end
end

local function initTargets()
    local NpcTables = {digSpots, headbuttTrees, BerryTrees, discoverItems}
    for _, v in pairs(NpcTables) do
        targets = Table.concat(targets, v)
    end
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

-- is working expects parameter opts to contain an array with keys : dig, harvest, discover, headbutt, headbuttIndex, digIndex. Bool values.
-- return true if doing an action, false means it's done it's job.
function work.isWorking(map, opts)
    if map ~= prevMap then
        prevMap = map
        headbuttIndex = Game.getPokemonNumberWithMove("Headbutt", 155)
        digIndex = Game.getPokemonNumberWithMove("Dig")
        getNpcsData(opts)
        initTargets()
    end
    while targets and #targets ~= 0 do
        if not currentTarget then
            targetIndex, currentTarget = getClosest(getPlayerX(), getPlayerY(), targets)
        end
        if talkToNpcOnCell(currentTarget.x, currentTarget.y) then
            Lib.log1time("Work: Checking npc index: " .. targetIndex .. " --> x:" .. currentTarget.x .. ", y:" .. currentTarget.y)
            return true
        else discardedNpc = discardedNpc + 1
        end
        table.remove(targets, targetIndex)
    end
    return false
end

function onWorkStart()
    resetData()
end

function onWorkDialogMessage(message)
    if targets then
        for check, f in pairs(dialogs) do
            if string.find(message, check) then
                table.remove(targets, targetIndex)
                currentTarget = nil
                f()
            end
        end
    end
end

registerHook("onStart", onWorkStart)
registerHook("onDialogMessage", onWorkDialogMessage)

return work
