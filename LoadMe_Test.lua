name = "Pathfind - Dijkstra Code - By Rympex"
author = "https://github.com/Rympex"

description = [[EDITED PATH FIND, WITH EXCEPTION MAPs]]

local pathFinder = require "Maps_Pathfind"
local a = 1

function onStart()
	-- pathFinder.initSettings() -- reset settings on start, optional
	-- pathFinder.EnableDigPath()
	-- pathFinder.DisableDigPath()
end

function onPathAction()
	pathFinder.MoveTo("Petalburg City")
	end
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