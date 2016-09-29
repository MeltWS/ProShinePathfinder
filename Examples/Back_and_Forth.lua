name = "Back and Forth"
author = "Melt"

description = [[Example moving back and forth between two pokecenters]]

local PathFinder = require "Pathfinder/Maps_Pathfind" -- requesting table with methods
local dest = nil
--[[
----- Check out settings in static_settings.lua -------------------------------
------------------
MoveTo(dest) --> Main function for moving to dest. true if destination is not reached, false when done. Need to be called multiple times.
MoveToPC()   --> Move to nearest Pokecenter
ResetPath() --> reseting the current Path, used in onStop()
SolveDialog(message, PathFinder) --> allow the bot interact with NPC maps

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function onPathAction()
	if dest then
		if PathFinder.MoveTo(dest) then
			return
		else
			dest = nil
			log("destination reached.")
		end
	end
	if getMapName() == "Pokecenter Oldale Town" then
		log("Moving to Ever Grande City")
		dest = "Pokecenter Ever Grande City"
	elseif getMapName() == "Pokecenter Ever Grande City" then
		log("Moving to Pokecenter Oldale Town")
		dest = "Pokecenter Oldale Town"
	else dest = "Pokecenter Ever Grande City" log("Moving to Pokecenter Ever Grande City")
	end
	move = PathFinder.MoveTo(dest)
end

function onBattleAction()
	run()
end
