name = "Moving to map and cell"
author = "MeltWS"

description = [[This allows you to move simply arround the map]]

local PathFinder = require "Pathfinder/Maps_Pathfind" -- requesting table with methods

--[[
----- Check out settings in Pathfind/Settings/static_settings.lua -------------------------------
------------------
MoveTo(dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times.
MoveToPC()   --> Move to nearest Pokecenter

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function moveToMapAndCell(mapname, x, y)
    local moving = PathFinder.MoveTo(mapname)
    if not moving and (getPlayerX() ~= x or  getPlayerY() ~= y) then
        moving = moveToCell(x, y)
    end
    return moving
end

function onStart()
	PathFinder.DisableDigPath() -- example use of settings
end

function onPathAction()
	if not moveToMapAndCell("Power Plant", 5, 33) then
		log("Destination reached")
	end
end

function onBattleAction()
	run()
end

