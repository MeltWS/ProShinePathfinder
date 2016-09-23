name = "Get Rods"
author = "melt"

description = [[This script will collect every Rods if the bot has enough money, make sure you have access to all maps necessary.]]

local pf = require "Pathfinder/Maps_Pathfind" -- requesting table with methods

local oldRod     = nil
local goodRod    = nil
local superRod   = nil
local money      = nil
local dialogs = {
    ["Would you like to buy a Good Rod for 15000?"] = function() pushDialogAnswer("Yes") end,
    ["Only yours for a one time payment of $75000, so what do you say?"] = function() pushDialogAnswer("Yes") end,
    ["You have Recieved an Old Rod"] = function() oldRod = true end,
    ["You have Recieved a Good Rod"] = function() goodRod = true end,
    ["Thanks, you won't be disappointed!!!"] = function() superRod = true end,
}

local function Init()
    oldRod = hasItem("Old Rod")
    goodRod = hasItem("Good Rod")
    superRod = hasItem("Super Rod")
    money = getMoney()
end

local function isDoable()
    if not GoodRod then
        money = money - 15000
    end
    if not SuperRod then
        money = money - 75000
    end
    return money > 0
end

local function getRod(map, npcX, npcY)
    if pf.MoveTo(map) then return end
    return talkToNpcOnCell(npcX,npcY)
end

function onStart()
    Init()
    if not isDoable() then
        fatal("Bot does not own enough money (15k Good Rod 75k Super Rod)")
    end
end

function onPathAction()
    if not oldRod then
        getRod("Fisherman House - Vermilion", 0, 6)
    elseif not goodRod then
        getRod("Fuchsia House 1", 3, 6)
    elseif not superRod then
        getRod("Olivine House 1", 0, 10)
    else log("Every rod owned, script terminated.")
    end
end

function onBattleAction()
	run()
end

function onDialogMessage(message)
    for k, _ in pairs(dialogs) do
        if message == k then
            k()
        end
    end
end
