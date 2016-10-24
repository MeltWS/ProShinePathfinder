local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local Table           = require (cdpath .. "Table")
local Game            = require (cdpath .. "Game")
local lib            = require (cdpath .. "lib")

local discardedNpc = 0

local work = {}

local prevMap            = nil
local digSpots           = nil
local headbuttTrees      = nil
local BerryTrees         = nil
local discoverItems      = nil
local targetIndex        = nil
local targets            = nil
local selectPokeWithMove = nil
local dialogs            = {
    ["You harvested "] = function() end,      -- berries
    ["You have harvested "] = function() end, -- berries
    ["You found "] = function() end,          -- loot item
    ["Obtained "] = function() end,          -- loot item
    ["You've found "] = function() end,      -- loot item
    ["You obtained "] = function() end,       -- loot TM
    ["Select a Pokemon that has Headbutt."] = function() selectPokeWithMove("Headbutt", 155) end,
    ["Select a Pokemon that has Dig."] = function() selectPokeWithMove("Dig", 155) end,
}

selectPokeWithMove = function(move, joy)
    local pokeId = assert(Game.getPokemonNumberWithMove(move, joy), "Work: does not have a Pokemon that can use " .. move)
    pushDialogAnswer(pokeId)
end

local function resetData()
    digSpots      = {}
    headbuttTrees = {}
    BerryTrees    = {}
    discoverItems = {}
    targets       = {}
    targetIndex   = nil
    prevMap       = nil
end

local function getNpcsData(opts)
    if opts then
        if opts.headbutt then
            headbuttTrees = assert(getActiveHeadbuttTrees())
        end
        if opts.dig then
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

-- is working expects parameter opts to contain an array with keys : dig, harvest, discover, headbutt. Bool values.
-- return true if doing an action, false means it's done it's job.
function work.isWorking(map, opts)
    if map ~= prevMap then
        prevMap = map
        getNpcsData(opts)
        initTargets()
    end
    while targets and #targets ~= 0 do
        targetIndex, npc = getClosest(getPlayerX(), getPlayerY(), targets)
        if talkToNpcOnCell(npc.x, npc.y) then
            lib.log1time("Checking NPC index: " .. targetIndex .. " --> x:" .. npc.x .. ", y:" .. npc.y)
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
                f()
            end
        end
    end
end

function onWorkStop()
    log("Work --> Discarded NPC: " .. discardedNpc)
end

registerHook("onStart", onWorkStart)
registerHook("onDialogMessage", onWorkDialogMessage)
registerHook("onStop", onWorkStop)

return work
