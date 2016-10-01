

####RELATIVE MODULE PATH BRANCH
>This branch support relative module path, this allows the user to
have his main script outside of the pathfinder folder.
This helps easier integration of the pathfinder as a submodule.
The current Moonsharp does not support this feature of lua,
you need to replace those in your proshine by the one provided
in this repository.

---
##Pathfinder for Proshine
This script allows you to use simple, MoveTo ("MapName") instead of using 1000 elseif.

#####Features

* All 3 Main regions 99% Supported, dig path supported one two first regions, support discovering a digway if it can't go threw.

* Dig and bike path can be set via settings dynamically.

* Subway support for all Regionms.

* Support train for Kanto / Johto, and Boat for Hoenn / Kanto / Johto.

* Please read the `LoadMe_Test.lua` for all infos on how to use, you can also read scripts in `Example folder`

#####Know issues :

* The bot will not consider not having surf or cut, or rock blast make sure you have what you need.
* Need to add an error log if the moveToMap() fails ( Route 2 to viridian if not having cut etc... )

## Contributors:

### lua-astar
*https://github.com/Shakadak/lua-astar*

A simple implementation of the A* pathfinding algorithm

The `aStar` function expect a few more arguments than most other implementations available anywhere.
I therefore invite you to read `example.lua`

### Original Project
*https://github.com/Rympex/Pathfinding-Dijkstra*
