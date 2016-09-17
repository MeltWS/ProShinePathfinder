name = "Pathfind - Dijkstra Code - By Rympex"
author = "https://github.com/Rympex"

description = [[EDITED PATH FIND, WITH EXCEPTION MAPs]]

local pathFinder = require "Maps_Pathfind" -- requesting table with methods

function onStart()
	pathFinder.DisableDigPath() -- example use of settings
	pathFinder.DisableBikePath()
end

function onPathAction()
	pathFinder.MoveTo("Route 32") -- example use of MoveTo
end

function onBattleAction()
	run()
end

function onDialogMessage(message)
	pathFinder.SolveDialog(message) -- allow the bot interact with NPC maps
end

function onStop()
	pathFinder.ResetPath()
end