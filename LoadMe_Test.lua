name = "Pathfinder"
author = "https://github.com/MeltWS"

description = [[This allows you to move simply arround the map]]

local pathFinder = require "Maps_Pathfind" -- requesting table with methods

--[[
------------------
MoveTo(dest) --> Main function for moving to dest
ResetPath() --> reseting the current Path, used in onStop()
SolveDialog --> allow the bot interact with NPC maps

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function onStart()
	pathFinder.EnableDigPath() -- example use of settings
end

function onPathAction()
	pathFinder.MoveTo("Olivine City") -- example use of MoveTo
end

function onBattleAction()
	run()
end

function onDialogMessage(message)
	pathFinder.SolveDialog(message) -- this needs to be there
end

function onStop()
	pathFinder.ResetPath()
end
