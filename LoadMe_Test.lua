name = "PathFinder"
author = "https://github.com/MeltWS"

description = [[This allows you to move simply arround the map]]

-- You can require Maps_Pathfind from anywhere above in the hierarchie
PathFinder = require "Pathfinder/Maps_Pathfind"  -- requesting table with methods

--[[
----- Check out settings in Pathfind/Settings/static_settings.lua -------------------------------
------------------
MoveTo(dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times.
MoveToPC()   --> Move to nearest Pokecenter.
UseNearestPokecenter() --> Go heal your team to the nearest Pokecenter.

--> Possible Setting Calls (Bike and Dig are set depending of Bot item/pokemons)
	EnableBikePath()
	DisableBikePath()
	EnableDigPath()
	DisableDigPath()
------------------]]

function onStart()
--  PathFinder.DisableDigPath() -- example use of settings
end

function onPathAction()
    PathFinder.MoveTo("Indigo Plateau Center") -- example use of MoveTo(dest)
end

function onBattleAction()
    run()
end

