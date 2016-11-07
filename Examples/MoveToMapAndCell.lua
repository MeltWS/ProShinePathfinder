name = "Moving to map and cell"
author = "MeltWS"

description = [[This allows you to move simply arround the map]]

local PathFinder = require "Pathfinder/MoveToApp" -- requesting table with methods

--[[
----- Check out settings in Settings/Static_Settings.lua -------------------------------
------------------
moveTo(dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times.
moveToPC()   --> Move to nearest Pokecenter

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
    enableBikePath()
    disableBikePath()
    enableDigPath()
    disableDigPath()
------------------]]

function moveToMapAndCell(map, dest, x, y)
    local moving = PathFinder.moveTo(map, dest)
    if not moving and (getPlayerX() ~= x or  getPlayerY() ~= y) then
        moving = moveToCell(x, y)
    end
    return moving
end

function onStart()
    PathFinder.disableDigPath() -- example use of settings
end

function onPathAction()
    if not moveToMapAndCell(getMapName(), "Power Plant", 5, 33) then
        log("Destination reached")
    end
end

function onBattleAction()
    run()
end

