name = "Pathfinder"
author = "https://github.com/MeltWS"

description = [[This allows you to move simply arround the map]]

local PathFinder = require "Maps_Pathfind" -- requesting table with methods

--[[
------------------
MoveTo(dest) --> Main function for moving to dest
MoveToPC()   --> Move to nearest Pokecenter
ResetPath() --> reseting the current Path, used in onStop()
SolveDialog --> allow the bot interact with NPC maps

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function onStart()
	PathFinder.EnableDigPath() -- example use of settings
end

function onPathAction()
	PathFinder.MoveTo("Lavender Town") -- example use of MoveTo
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
