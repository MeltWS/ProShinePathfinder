name = "Anywhere Leveler"
author = "MeltWS"

description = [[Simple yet effective leveler using PathFinder]]

local pf          = require "Pathfinder/Maps_Pathfind" -- requesting table with methods
local mapExp      = "Dragons Den"
local levelGoal   = 98 -- scripts prevents Evolution so be carefull.
local xpTargets   = {1, 3} -- table containing index of pokemon(s) to train.
local holdItem    = "Leftovers" -- support giving an item to the leader, if you don't want to give one, set to nil.
local xpZone      = function() return moveToWater() end -- you can change this depending of your needs, moveToRectangle() or moveToGrass().

local function swapLeaderWithTargetXp()
    for k, v in pairs(xpTargets) do
        if getPokemonHealth(v) > 0 then
            if not getPokemonHeldItem(1) then
                return assert(swapPokemonWithLeader(getPokemonName(v)), "Failed to swap Pokemon ".. v .."  with leader.")
            else return assert(takeItemFromPokemon(1), "Failed to retrieve item from leader")
            end
        end
    end
    return false
end

local function isDone()
    for k, v in pairs(xpTargets) do
        if getPokemonLevel(v) < levelGoal then
            return false
        end
    end
end

local function giveLeaderItem()
    local currentItem = getPokemonHeldItem(1)

    if not holdItem or currentItem == holdItem then
        return false
    elseif currentItem ~= nil then
        return assert(takeItemFromPokemon(1), "Failed to retrieve item from leader.")
    else return assert(giveItemToPokemon(holdItem, 1), "Failed to give item to Pokemon : " .. holdItem .. ", please make sure you have the item, otherwise set the holdItem value to nil.")
    end
end

function onStart()
    if isAutoEvolve() then
        assert(disableAutoEvolve(), "Something wrong with disabling auto evolve.")
    end
end

function onPathAction()
    if isDone() then
        return fatal("level reached")
    elseif getPokemonHealth(1) == 0 then
        if not swapLeaderWithTargetXp() then
            return pf.UseNearestPokecenter()
        end
    elseif not giveLeaderItem() then
        if not pf.MoveTo(mapExp) then
            return xpZone()
        end
    end
end

function onBattleAction()
    if getPokemonHealth(1) > 0 and getMapName() == mapExp then
        return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
    else return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
    end
end

