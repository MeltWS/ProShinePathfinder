name = "Simple Example"
author = "MeltWS"

description = [[Simple application of the PathFinder, this script moves to a destination from anywhere.]]

-- First you need to get the module loaded in your script :
local PathFinder = require "Pathfinder/MoveToApp"  -- loading the module MoveToApp and getting the functions it sends back in a table: PathFinder.
-- Now to use PathFinder functions you can write PathFinder.functionName().
-- You can require MoveToApp from anywhere above in the hierarchie.

--[[

----- /!\ Check out settings in Pathfind/Settings/static_settings.lua /!\ -------------------------------

-- Most usefull calls :
MoveTo(dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times. dest can be a string or a list of string.
MoveToPC()   --> Move to nearest Pokecenter.
UseNearestPokecenter() --> Go heal your team to the nearest Pokecenter.
UseNearestPokemart(item, amount) --> /!\ experimental, item map is not completed./!\ Go to nearest pokemart buy item, at amount times. Return false when successfully buy item, true when moving.

--> Possible Setting Calls (If for some reason you want to disable some path or enable them manually)
--> Those setting are set on loading dynamically depending on your bot items and Pokemons, so you don't have to worry about them usually.
	- EnableBikePath() -- to use digway shorcuts
	- DisableBikePath()
	- EnableDigPath() -- to use Bike exclusive paths
	- DisableDigPath()

if you need more details see HOWTO
------------------]]

function onStart()
--  PathFinder.DisableDigPath() -- example use of settings, this would prevent the pathfinder from using digway shortcuts, even if you had a pokemon with dig.
end

function onPathAction()
    PathFinder.MoveTo("Indigo Plateau Center") -- example use of MoveTo(dest)
    -- the line above will move the bot to the map "Indigo Plateau Center"
end

function onBattleAction()
    run() -- we use this to not get stuck in battle.
end

