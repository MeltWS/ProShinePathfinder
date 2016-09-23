name = "Get Rods"
author = "melt"

description = [[This script will collect every Rods if the bot has enough money, make sure you have access to all maps necessary.]]

local pf = require "Pathfinder/Maps_Pathfind" -- requesting table with methods

local check      = false
local oldRod     = nil
local goodRod    = nil
local superRod   = nil
local money      = nil
local dialogs = {
    ["xx"] = "x",
    ["xxx"] = "x",
    ["xxxx"] = "x"
}

local function initVars()
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

local function getOldRod(map)
    if pf.MoveTo(map) then return end
    return talkToNpcOnCell(0,5)
end

local function getGoodRod(map)
    if pf.MoveTo(map) then return end
    return talkToNpcOnCell(3,6)
end

local function getSuperRod(map)
    if pf.MoveTo(map) then return end
    return talkToNpcOnCell(0,10)
end

function onStart()
    initVars()
    if not isDoable() then
        fatal("Bot does not own enough money (15k Good Rod 75k Super Rod)")
    end
end

function onPathAction()
    if check then
        check = false
        initVars()
    end
    if not oldRod then
        getOldRod("Fisherman House - Vermilion")
    elseif not goodRod then
        getGoodRod("Fuchsia House 1")
    elseif not superRod then
        getSuperRod("Olivine House 1")
    else log("Every rod owned, script terminated.")
    end
end

function onBattleAction()
	run()
end

function onDialogMessage(message)
    check = true
    for k, v in pairs(dialogs) do
        if message == k then
            return pushDialogAnswer(v)
        end
    end
end
