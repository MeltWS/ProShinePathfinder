name = "Nocturnal Feather Farm"
author = "Melt"

description = [[Farm Nocturnal Feathers, it assumes you have a pokemon with "Covet"]]

local PathFinder = require "Maps_Pathfind" -- requesting table with methods

local function needPC()
	if getPokemonHealth(1) == 0 or getRemainingPowerPoints(1, "Covet") == 0 then
		log(getRemainingPowerPoints(1, "Covet"))
		return true
	else return false
	end 
end

local function goHeal()
	if string.find(getMapName(), "Pokecenter") then
		return usePokecenter()
	else return PathFinder.MoveToPC()
	end
end

local function onStart()
	for i=1, getTeamSize() do
		if hasMove(i, "Covet") then
			if i > 1 then
				return swapPokemonWithLeader(getPokemonName(i))
			else return
			end
		end
	end
	fatal("You need a Pokemon with Covet")
end


local function onPathAction()
	if not isNight() then fatal("Feather are only found at night time") end
	if needPC() then
		return goHeal()
	elseif getMapName() ~= "Route 16" then
		return PathFinder.MoveTo("Route 16")
	else return moveToGrass()
	end
end

local function onBattleAction()
	if getOpponentName() ~= "Pidgeotto" or needPC() then
		return run() or sendAnyPokemon() or attack()
	else return useMove("Covet") or attack() or run() or sendAnyPokemon()
	end
end