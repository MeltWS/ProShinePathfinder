## Read first
Last updated for v2.0  
This is a guide on possibilities provided by the PathFinder module, and how to use them.

I strongly advice you [read](https://github.com/MeltWS/ProShinePathfinder/blob/dev/LoadMe_Test.lua) the `LoadMe_Test.lua.` As it is the simplest application of the module you can make.  
The Settings are located in `Pathfinder/Settings/Static_Settings.lua`, You should read and modify them if you want.  
How to enable Dig / Headbutt / Discoving Items ? [Read the settings file](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Settings/Static_Settings.lua).

The only module you need to require is `moveToApp`. The module return a table of functions.  
How to load the module: `Pathfinder = require "Pathfinder/MoveToApp"`

The following assume you understand the lua module system and understand how to use functions from a module.

## Module functions list :
```lua
moveTo(currentMap, dest)
moveToMapCell(currentMap, dest, x, y) -- use this for submaps
moveToPC(currentMap)
useNearestPokecenter(currentMap)
useNearestPokemart(currentMap, item, amount) -- /!\ items map not fully completed /!\
enableDigPath()
disableDigPath()
isDigPathEnabled()
```

## Detailed informations :
### - Moving to a map
```lua
moveTo(currentMap, dest)
```
The function expects two parameters:  
`currentMap` contains the map the player is in, you can get it with `getPlayerMap()`.  
`dest` contains a string or list of string. All strings must be the names of a known map ( case sensitive ).  
You can see the list of maps supported inside the `Maps` folder. [Kanto](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Kanto/KantoMap.lua), [Johto](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Johto/JohtoMap.lua), [Hoenn](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Hoenn/HoennMap.lua)  
if it receive a list of maps it will go to the closest one.  
Return `true` if moving and `false` when destination is reached.  
Examples use of moveTo(currentMap, map) :
```lua
-- we assume currentMap contains the name of the map the player is in.
moveTo(currentMap, "Viridian City") -> will move to Viridian City.
moveTo(currentMap, {"Viridian City", "Ecruteak City"}) -> will move to the closest map found.
```  
### - Moving to a specific cell on a map
```lua
moveToMapCell(currentMap, dest, x, y)
```
The function expects four parameters:  
`currentMap` contains the map the player is in, you can get it with `getPlayerMap()`  
`dest` contains a string that is the name of a known map ( case sensitive ).  
`x` and `y` coordinates on the map.  
This function is mainly usefull if you are trying to move in a map that exist in different place in the game. Simply use coordinates and the Pathfinder will find the correct submap.  
```lua
-- we assume currentMap contains the name of the map the player is in.
moveToMapCell(currentMap, "Route 2", 28, 35) -> will move to 28, 35 in Route 2.
```  
### - Moving to a Pokecenter
```lua
moveToPC(currentMap)
```
The function expects a parameter `currentMap` containing the name of the map the player is in.  
This function request `moveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
return `true` when moving, `false` when in a Pokecenter.  
Example use of moveToPC() :
```lua
if accessBox then -- if we need to access a Pokecenter in our script
  if not moveToPC(currentMap) then -- move to the closest Pokecenter
    log("Pokecenter reached") -- if moveToPC(currentMap) returns false we're in a Pokecenter
  end
end
```
### - Using the closest Pokecenter
```lua
useNearestPokecenter(currentMap)
```
The function expects a parameter `currentMap` containing the name of the map the player is in.  
The function request `moveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
When in a Pokecenter the function will talk to the nurse and heal your team.  
return `true` when moving, `false` when in a Pokecenter.  
This function moves to the closest Pokecenter and use it.  
Return value will always be `true`. you should be using your own verification to know when to use it.  
Example use of useNearestPokecenter() :
```lua
if needHeal then -- if we need to heal in our script
  useNearestPokecenter(currentMap)
end
```
### - Using the closest Pokemart /!\ [items map not completed](https://github.com/MeltWS/ProShinePathfinder/blob/dev/Pathfinder/Maps/Items/Items.lua) /!\
```lua
useNearestPokemart(currentMap, item, amount)
```
The function expects 3 parameters:  
`currentMap` contains the name of the map the player is in.  
`item` contains the item to buy.  
`amount` the number of items to buy.  
The function moves to the closest Pokemart and buy the item `item` the number of item bought is `amount`.  
see the `item map` for a list of item supported  
Return `true` if moving, `false` on performing a buy, or if the buy can't be performed.  
Example use of useNearestPokemart() :
```lua
if not useNearestPokemart(currentMap, "Pokeball", 5) then -- we ask the pathfinder to go buy 5 pokeballs.
  fatal("Pathfinder job's over") -- we stop when the function return false.
end
```
### - Possibily to disable or enable path in a script.
If you do not want to use the digways (shortcuts) and want to rather cross caves, you can disable digways.
```lua
enableDigPath() -- allow the bot to use digway shortcuts ( you need a Pokemon with dig and 155 happiness )
disableDigPath() -- disable dig path
```
## Notes
The `Pathfinder` will verify your team abilities to move such as `cut`, `surf` etc everytime you ask for a new destination.  
The `work` module is the handler for headbutt, harvest etc. It will verify abilities everytime it enters a new map.  
