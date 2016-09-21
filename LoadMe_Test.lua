name = "PathFinder"
author = "https://github.com/MeltWS"

description = [[This allows you to move simply arround the map]]

local PathFinder = require "Maps_Pathfind" -- requesting table with methods

--[[
----- Check out settings in static_settings.lua -------------------------------
------------------
MoveTo(dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times.
MoveToPC()   --> Move to nearest Pokecenter
ResetPath() --> reseting the current Path, used in onStop()
SolveDialog(message, PathFinder) --> allow the bot interact with NPC maps

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function onStart()
	 PathFinder.DisableDigPath() -- example use of settings
end

function onPathAction()
	PathFinder.MoveTo("Saffron City") -- example use of MoveTo(dest)
	-- PathFinder.MoveToPC()
end

function onBattleAction()
	run()
end

function onDialogMessage(message)
	PathFinder.SolveDialog(message, PathFinder) -- this needs to be there
end

function onStop()
	PathFinder.ResetPath()
end
