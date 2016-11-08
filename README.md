##Pathfinder for Proshine v2.0.0
This script provides a module to move from a map A to a map B using the shortest path.  
The Objective of this project is to provide a tool to simplify scripting in proshine. So you don't have to use an elseif per map you're crossing.  
It also provides advanced functionality, settings, and more...  

[For explanation on how to use the API read HOWTO](https://github.com/MeltWS/ProShinePathfinder/blob/master/HOWTO.md).  
[If you want to know how the map system work or how to add maps](https://github.com/MeltWS/ProShinePathfinder/blob/master/ADDINGMAPS.md).  
Use `LoadMe_Test.lua` to test the module, I recommand you [read](https://github.com/MeltWS/ProShinePathfinder/blob/master/LoadMe_Test.lua) it as well.  
You should also read and modify the setting file located in `Settings/Static_Settings.lua` to your needs.  

#####Features

* Move to the requested map or go to the closest in a list of Map given. Supports most of the maps of the 3 main regions.
* move to a specific cell on a map.
* checking for possible paths.
* Move to the closest Pokecenter.
* Use the closest Pokecenter.
* Use the closest Pokemart to buy the requiered items. (testing, item map need to be completed.)
* Uses Bike or Mount.
* Uses digways as shortcut if has a Pokemon that can use dig.
* Discover digways if it can't use it.
* Subway support for the 3 main regions.
* Train and boat support from one Region to another.
* Headbutt trees, on the way.
* Dig digspots on the way.
* Discover all items on the way.
* Harvest berries on the way. ( currently need more testing )
* Settings for every features above.
* Custom Settings per Bot.
* Provides Examples such as a script to get the 3 rods in the game, or a script to level anywhere.

#####Know issues :

* X map does not work! Not everything is currently implemented, I welcome help if you want to implement maps, make pull request on github.
* Planning on dig and headbutt scripts. ( all you have to do it tell it where to go.)
* Planning on adding excavations support ( I don't have any account with access at the moment. )

## Contributors:

### Map helpers
- Crazy3001
- vladslav

### lua-astar
*https://github.com/Shakadak/lua-astar*  
A simple implementation of the A* pathfinding algorithm  
The `aStar` function expect a few more arguments than most other implementations available anywhere.  
I therefore invite you to read `example.lua`  

### Original Project
*https://github.com/Rympex/Pathfinding-Dijkstra*
