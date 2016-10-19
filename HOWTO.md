## Read first
This is a guide on possibilities provided by the PathFinder module, and how to use them.

I strongly advice you [read](https://github.com/MeltWS/ProShinePathfinder/blob/dev/LoadMe_Test.lua) the `LoadMe_Test.lua.` As it is the simplest application of the module you can make.  
The Settings are located in `Pathfinder/Settings/static_Settings.lua`, You should read and modify them if you want.  
How to enable Dig / Headbutt / Discoving Items ? [Read the settings file](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Settings/static_Settings.lua).

The only module you need to require is `MoveToApp`. The module return a table of functions.  
How to load the module: `Pathfinder = require "Pathfinder/MoveToApp"`

The following assume you understand the lua module system and understand how to use functions from a module.

## Module functions list :
```lua
MoveTo(map)
MoveToPC()
UseNearestPokecenter()
UseNearestPokemart(item, amount) /!\ items map not fully completed /!\
EnableBikePath()
DisableBikePath()
EnableDigPath()
DisableDigPath()
```

## Detailed informations :
### - Moving to a map
```lua
MoveTo(map)
```
The function expects a parameter map containing a string or list of string. All strings must be the names of a known map ( case sensitive ).
You can see the list of maps supported inside the `Maps` folder. [Kanto](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Kanto/KantoMap.lua), [Johto](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Johto/JohtoMap.lua), [Hoenn](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Hoenn/HoennMap.lua)
if it receive a list of maps it will go to the closest one.  
Return `true` if moving and `false` when destination is reached.  
Examples use of MoveTo(map) :
```lua
MoveTo("Viridian City") -> will move to Viridian City.
MoveTo({"Viridian City", "Ecruteak City"}) -> will move to the closest map found.
```  
### - Moving to a Pokecenter
```lua
MoveToPC()
```
This function request `MoveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
return `true` when moving, `false` when in a Pokecenter.  
Example use of MoveToPC() :
```lua
if accessBox then -- if we need to access a Pokecenter in our script
  if not MoveToPC() then -- move to the closest Pokecenter
    log("Pokecenter reached") -- if MoveToPC() returns false we're in a Pokecenter
  end
end
```
### - Using the closest Pokecenter
```lua
UseNearestPokecenter()
```
The function request `MoveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
When in a Pokecenter the function will talk to the nurse and heal your team.  
return `true` when moving, `false` when in a Pokecenter.  
This function moves to the closest Pokecenter and use it.  
Return value will always be `true`. you should be using your own verification to know when to use it.  
Example use of UseNearestPokecenter() :
```lua
if needHeal then -- if we need to heal in our script
  UseNearestPokecenter()
end
```
### - Using the closest Pokemart /!\ [items map not completed](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Items/Items.lua) /!\
```lua
UseNearestPokemart(item, amount)
```
The function moves to the closest Pokemart and buy the item `item` the number of item bought is `amount`.
see the `item map` for a list of item supported
Return `true` if moving, `false` on performing a buy, or if the buy can't be performed.
Example use of UseNearestPokemart() :
```lua
if not UseNearestPokemart("Pokeball", 5) then -- we ask the pathfinder to go buy 5 pokeballs.
  fatal("Pathfinder job's over") -- we stop when the function return false.
end
```
### - Possibily to disable or enable path in a script.
The pathfinder checks on loading if you have the requierments to Bike exclusive maps, and Digways shortcuts. And load a map relative to the result.
You can use functions to request the map to be reupdated accordingly.
```lua
EnableBikePath() -- allow the bot to take Bike exclusive Path
DisableBikePath() -- disable Bike paths
EnableDigPath() -- allow the bot to use digway shortcuts ( require a Pokemon with dig and 155 happiness )
DisableDigPath() -- disable dig path
```
Examples:
```lua
-- Our script start without the Bicycle, so the paths exclusive to bike are disabled.
...
if hasItem("Bicycle") then
  EnableBikePath() -- we enable Bike exclusive path since we now have a Bicycle.
end
...
```  
```lua
... -- we started the script without a pokemon with dig.
... -- we teach a pokemon Dig.
if hasPokemonWithMove("Dig", 155) then -- we assume a function that makes sure a pokemon has Dig and Happiness at least 155.
  EnableDigPath() --  we enable Dig shortcuts since we now have a Pokemon that can use Dig.
end
...
```
