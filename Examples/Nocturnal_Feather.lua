name = "Nocturnal Feather Farm"
author = "Melt"

description = [[Farm Nocturnal Feathers, it assumes you have a pokemon with "Covet"]]

local PathFinder = require "Pathfinder/MoveToApp" -- requesting table with methods
local map        = nil

function inRectangle(UpperX, UpperY, LowerX, LowerY)
    local ActX = getPlayerX()
    local ActY = getPlayerY()
    if (ActX >= UpperX and ActX <= LowerX) and (ActY >= UpperY and ActY <= LowerY) then
        return true
    else
        return false
    end
end

local function needPC()
    if getPokemonHealth(1) == 0 or getRemainingPowerPoints(1, "Covet") == 0 then
        log(getRemainingPowerPoints(1, "Covet"))
        return true
    else return false
    end
end

function onStart()
    for i=1, getTeamSize() do
        if hasMove(i, "Covet") then
            if i > 1 then
                return swapPokemonWithLeader(getPokemonName(i))
            else return
            end
        end
    end
    fatal("You need a Pokemon with Covet")
end


function onPathAction()
    map = getMapName()
    if not isNight() then fatal("Feather are only found at night time") end
    if needPC() then
        return PathFinder.useNearestPokecenter()
    elseif map == "Route 16 Stop House" then
        moveToCell(20,6)
    elseif not PathFinder.moveTo(map, "Route 16") then
        if inRectangle(70,3,91,21) then
            moveToGrass()
        else
            moveToMap("Route 16 Stop House")
        end
    end
end

function onBattleAction()
    if getOpponentName() ~= "Pidgeotto" or needPC() then
        return run() or sendAnyPokemon() or attack()
    else return useMove("Covet") or attack() or run() or sendAnyPokemon()
    end
end
