## - The map system
The map system is located in `Pathfinder/Maps`, there are two big sections, as well as the maps for pokecenters and items used by API calls like moveToPC():
- The maps for the algorithm, such as the Regions maps. They represent Nodes and Links, a node is a Map and links are the possible Maps accessible from it.
- The Exceptions maps, inside `MapExceptions`.

`GlobalMap` and `LinkMap` are used to link the main regions maps together.

### - Understanding the need for exceptions:

Sometime, maps have the same name as in the game, but you can only access a part of them because of your team, items or simply because they are not at the same locations  
For example: there could be water in the middle of a map, then you need to have `surf` to be able to cross that part.  
Another example would be `Route 2`: there are parts before and after the forest, some part you can only access with `cut`.  
In these cases the maps need to be subdivided for the algorithm to make no mistakes.  
Example: If we are on the top side of `route 2` then the closest Pokecenter would be in `Pewter City`, if we are on the bottom side then it is in `Viridian City`.  
If there is something that could prevent you from traversing a link from the current map, you should make exceptions.  
There are exceptions aswell if moving to a link require talking to a NPC.

### - Adding map without exceptions:

Take a look at the region maps from [Kanto](https://github.com/MeltWS/ProShinePathfinder/blob/master/Pathfinder/Maps/Kanto/KantoMap.lua) as an example:
```lua
KantoMap["node"] = {["link1"] = {distance1}, ["link2"] = {distance2}}
```
The node is the name of the Map  
We can have as many links as we need, they MUST be names of other nodes in the map, they MUST have a number distance.  
Example :
```lua
KantoMap["Player Bedroom Pallet"] = {["Player House Pallet"] = {1}}
```
  
Sometimes you can have restrictions on a link, for example if you need surf.  
`-- KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}`  
The `restrictionType`s must either be `abilities` or `items`, there can be multiple restrictions. The account must fulfill every `restriction` paired to `restrictionType` in order to make the link traversable  
Example:
```lua
KantoMap["Pallet Town"] = {["Player House Pallet"] = {1}, ["Route 21"] = {1, {["abilities"] = {"surf"}}}, ["Route 1"] = {1}}
```
Here the link will only be usable if the player has `surf`

### - Exceptions handling:

#### Substitutes Maps

If the map must be subdivided, we need to know which part is which, so we define substitute maps with rectangles. See the file `MapExceptions/SubstituteMaps`.  
```lua
    ["In Game Map Name"] = {
        ["SubMap_X] = {{x1, y1, x2, y2}, {x1, y1, x2, y2}} -- location of the submap
        ["SubMap_Y] = {{x1, y1, x2, y2}} -- location of the submap
    },
    ["Route 2"] = {
        ["Route 2_A"] = {{7, 0, 28, 31}, {7, 33, 11, 42}}, -- top / pewter side
        ["Route 2_B"] = {{19, 32, 42, 89}}, -- top right / digletts side
        ["Route 2_C"] = {{7, 96, 25, 130}}, -- down right / bottom of stop house 3
        ["Route 2_D"] = {{26, 96, 42, 127}} -- bottom / viridian side
        },
```
There can be as many rectangles as you need to, the rectangles MUST cover the whole submap area.  
Adding all sumap rectangles MUST cover the whole map Area.  
Route 2 is subdivided ii four submaps.  
  
We also need to define links, as for any other maps:  
```lua
KantoMap["Route 2_A"] = {["Pewter City"] = {1}, ["Viridian Forest"] = {1}, ["Route 2_B"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_B"] = {["Route 11"] = {1, {["abilities"] = {"dig"}}}, ["Route 2_A"] = {0, {["abilities"] = {"cut"}}}, ["Route 2 Stop3"] = {1}}
KantoMap["Route 2_C"] = {["Viridian City"] = {1}, ["Route 2_D"] = {1, {["abilities"] = {"cut"}}}, ["Route 2 Stop"] = {1}}
KantoMap["Route 2_D"] = {["Route 2 Stop3"] = {1}, ["Route 2_C"] = {0, {["abilities"] = {"cut"}}}}
```
Here we have distances of 0 because we do not want the algorithm to weight the path between submap, it could have been 0.2 or something else as well.  
Note that each submap have it's own links and restrictions.  
  
Sometimes, after subdividing Maps the script will need to know which specific cell to go on, because a map can link to multiple submaps with the same parent map, and Proshine won't understand moveToMap(Route 2_B). And if we use moveToMap("Route 2") it will go to the closest submap, which we do not always want. Therefore we need linkExceptions:  
located in `LinkExceptions`  
```lua
linkExce["node"] = {
    ["destNode"] = {x, y} -- the cell which teleports to destNode from node.
}
linkExce["Route 2 Stop3"] = {
    ["Route 2_B"] = {3, 2}, -- top
    ["Route 2_D"] = {3, 12} -- down
}
```
The pathfinder will know which cell to go to access submaps `B` and `D` from `Route 2 Stop3`.

#### Npc Exceptions
If moving from a map A to a map B requires talking to a NPC you must fill the data inside `NpcExceptions`  
```lua
npcExce["node"] = {
    ["destNode"] = {{npcX, npcY}, dialogAnswer, "dialogCheck"}
}
npcExce["Lilycove City Harbor"] = {
    ["Vermilion City_A"] = {{8, 10}, "Vermilion City", "Where do you want to go?"},
    ["Olivine City"] = {{8, 10}, "Olivine City", "Where do you want to go?"}
}
```
The dialogs must be the full sentences.
