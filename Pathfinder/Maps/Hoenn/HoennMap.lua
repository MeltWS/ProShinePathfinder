local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

local _ss = require (cpppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local H_SUBWAY = ss.H_SUBWAY

local HoennMap = {}

HoennMap["Cable Car Station 1"] = {["Cable Car Station 2"] = {0.2}, ["Route 112_B"] = {0.2}}
HoennMap["Cable Car Station 2"] = {["Cable Car Station 1"] = {0.2}, ["Mt. Chimney"] = {0.2}}
HoennMap["Cycle Road Stop House 1"] = {["Route 110_B"] = {0.2}, ["Route 110_D"] = {0.2, {["items"] = {"Bicycle"}}}}
HoennMap["Cycle Road Stop House 2"] = {["Route 110_A"] = {0.2}, ["Route 110_D"] = {0.2, {["items"] = {"Bicycle"}}}}
HoennMap["Dewford Town"] = {["Pokecenter Dewford Town"] = {1}, ["Route 106"] = {1}, ["Route 107"] = {1, {["abilities"] = {"surf"}}}}
HoennMap["Ever Grande City_A"] = {["Pokecenter Ever Grande City"] = {1}, ["Ever Grande City_B"] = {1, {["abilities"] = {"dig"}}}, ["Route 128"] = {1, {["abilities"] = {"surf"}}}, ["Victory Road Hoenn 1F_A"] = {1}}
HoennMap["Ever Grande City_B"] = {["Ever Grande City_A"] = {1, {["abilities"] = {"dig"}}}, ["Pokemon League Hoenn"] = {1}, ["Victory Road Hoenn 1F_B"] = {1}}
HoennMap["Fallarbor Town"] = {["Mart Fallarbor Town"] = {1}, ["Pokecenter Fallarbor Town"] = {1}, ["Route 113"] = {1}, ["Route 114"] = {1}}
HoennMap["Fiery Path"] = {["Route 112_A"] = {1.5}, ["Route 112_B"] = {1.5}}
HoennMap["Fortree City"] = {["Fortree Mart"] = {1}, ["Pokecenter Fortree City"] = {1}, ["Route 119A"] = {1}, ["Route 120_A"] = {1}}
HoennMap["Fortree Mart"] = {["Fortree City"] = {1}}
HoennMap["Hoenn Safari Zone Lobby"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Route 121"] = {1}}
HoennMap["Hoenn Safari Zone Area 1"] = {["Hoenn Safari Zone Lobby"] = {1}, ["Hoenn Safari Zone Area 2_A"] = {1}, ["Hoenn Safari Zone Area 2_B"] = {1}, ["Hoenn Safari Zone Area 4"] = {1}, ["Hoenn Safari Zone Area 5"] = {1}}
HoennMap["Hoenn Safari Zone Area 2_A"] = {["Hoenn Safari Zone Area 1"] = {1}}
HoennMap["Hoenn Safari Zone Area 2_B"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 2_A"] = {0.5}}
HoennMap["Hoenn Safari Zone Area 2_C"] = {["Hoenn Safari Zone Area 2_B"] = {0}, ["Hoenn Safari Zone Area 3"] = {0.2}}
HoennMap["Hoenn Safari Zone Area 2_D"] = {["Hoenn Safari Zone Area 2_A"] = {0}, ["Hoenn Safari Zone Area 3"] = {0.2}}
HoennMap["Hoenn Safari Zone Area 3"] = {["Hoenn Safari Zone Area 4"] = {1}, ["Hoenn Safari Zone Area 2_C"] = {1}, ["Hoenn Safari Zone Area 2_D"] = {1}}
HoennMap["Hoenn Safari Zone Area 4"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 3"] = {1}}
HoennMap["Hoenn Safari Zone Area 5"] = {["Hoenn Safari Zone Area 1"] = {1}, ["Hoenn Safari Zone Area 6"] = {1}}
HoennMap["Hoenn Safari Zone Area 6"] = {["Hoenn Safari Zone Area 5"] = {1}}
HoennMap["Jagged Pass_A"] = {["Mt. Chimney"] = {1}, ["Jagged Pass_B"] = {0.5}}
HoennMap["Jagged Pass_B"] = {["Jagged Pass_C"] = {0.5}}
HoennMap["Jagged Pass_C"] = {["Route 112_C"] = {0.5}}
HoennMap["Lavaridge Mart"] = {["Lavaridge Town"] = {1}}
HoennMap["Lavaridge Town"] = {["Lavaridge Mart"] = {1}, ["Pokecenter Lavaridge Town"] = {1}, ["Route 112_C"] = {1}} -- links
HoennMap["Lilycove City"] = {["Lilycove City Harbor"] = {1}, ["Pokecenter Lilycove City"] = {1}, ["Route 121"] = {1}, ["Route 124_A"] = {1, {["abilities"] = {"surf"}}}, ["Lilycove Department Store 1F"] = {1}}
HoennMap["Lilycove City Harbor"] = {["Lilycove City"] = {0.2}}
HoennMap["Lilycove Department Store 1F"] = {["Lilycove City"] = {1}, ["Lilycove Department Store 2F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 2F"] = {["Lilycove Department Store 1F"] = {1}, ["Lilycove Department Store 3F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 3F"] = {["Lilycove Department Store 2F"] = {1}, ["Lilycove Department Store 4F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 4F"] = {["Lilycove Department Store 3F"] = {1}, ["Lilycove Department Store 5F"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store 5F"] = {["Lilycove Department Store 4F"] = {1}, ["Lilycove Department Store Roof"] = {1}, ["Lilycove Department Store Elevator"] = {1}}
HoennMap["Lilycove Department Store Roof"] = {["Lilycove Department Store 5F"] = {1}}
HoennMap["Lilycove Department Store Elevator"] = {["Lilycove Department Store 1F"] = {0.2}, ["Lilycove Department Store 2F"] = {0.2}, ["Lilycove Department Store 3F"] = {0.2}, ["Lilycove Department Store 4F"] = {0.2}, ["Lilycove Department Store 5F"] = {0.2}}
HoennMap["Littleroot Town"] = {["Route 101"] = {1}}
HoennMap["Mart Fallarbor Town"] = {["Fallarbor Town"] = {1}}
HoennMap["Mart Mauville City"] = {["Mauville City"] = {1}}
HoennMap["Mart Oldale Town"] = {["Oldale Town"] = {1}}
HoennMap["Mart Petalburg City"] = {["Petalburg City"] = {1}}
HoennMap["Mart Rustboro City"] = {["Rustboro City_A"] = {1}}
HoennMap["Mart Slateport"] = {["Slateport City"] = {1}}
HoennMap["Mauville City"] = {["Mart Mauville City"] = {1}, ["Mauville City Stop House 1"] = {1}, ["Mauville City Stop House 2"] = {1}, ["Mauville City Stop House 3"] = {1}, ["Mauville City Stop House 4"] = {1}, ["Pokecenter Mauville City"] = {1}}
HoennMap["Mauville City Stop House 1"] = {["Mauville City"] = {0.2}, ["Route 110_A"] = {0.2}}
HoennMap["Mauville City Stop House 2"] = {["Mauville City"] = {0.2}, ["Route 117"] = {0.2}}
HoennMap["Mauville City Stop House 3"] = {["Mauville City"] = {0.2}, ["Route 111 South"] = {0.2}}
HoennMap["Mauville City Stop House 4"] = {["Mauville City"] = {0.2}, ["Route 118_A"] = {0.2}}
HoennMap["Meteor falls 1F 1R_A"] = {["Route 114"] = {1.5}, ["Meteor falls 1F 1R_X"] = {0.7}}
HoennMap["Meteor falls 1F 1R_X"] = {["Meteor falls 1F 1R_A"] = {0.7}, ["Route 115_A"] = {1.5}}
HoennMap["Meteor falls 1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {0.5}, ["Meteor falls 1F 1R_A"] = {1}}
HoennMap["Meteor falls 1F 1R_C"] = {["Meteor falls B1F 1R_A"] = {0.5}}
HoennMap["Meteor falls 1F 1R_D"] = {["Meteor falls B1F 1R_B"] = {0.5}}
HoennMap["Meteor falls B1F 1R_A"] = {["Meteor falls 1F 1R_C"] = {1}, ["Meteor Falls 1F 2R_B"] = {1}, ["Meteor Falls 1F 2R_A"] = {1}}
HoennMap["Meteor falls B1F 1R_B"] = {["Meteor Falls 1F 2R_B"] = {1.5}, ["Meteor Falls B1F 2R"] = {1.5}, ["Meteor falls 1F 1R_D"] = {1.5}}
HoennMap["Meteor Falls 1F 2R_A"] = {["Meteor Falls 1F 2R_B"] = {1}, ["Meteor falls B1F 1R_A"] = {1}}
HoennMap["Meteor Falls 1F 2R_B"] = {["Meteor falls 1F 1R_B"] = {1.5}, ["Meteor falls B1F 1R_A"] = {1}, ["Meteor falls B1F 1R_B"] = {1}}
HoennMap["Meteor Falls B1F 2R"] = {["Meteor falls B1F 1R_B"] = {1}}
HoennMap["Mossdeep City"] = {["Mossdeep Pokemart"] = {1}, ["Pokecenter Mossdeep City"] = {1}, ["Route 124_A"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 125"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 127_A"] = {1.5, {["abilities"] = {"surf"}}}}
HoennMap["Mossdeep Pokemart"] = {["Mossdeep City"] = {1}}
HoennMap["Mt. Chimney"] = {["Cable Car Station 2"] = {1}, ["Jagged Pass_A"] = {1}}
HoennMap["Mt. Pyre 1F"] = {["Route 122"] = {1.5}, ["Mt. Pyre 2F"] = {1.5}}
HoennMap["Mt. Pyre 2F"] = {["Mt. Pyre 1F"] = {1.5}, ["Mt. Pyre 3F"] = {1.5}}
HoennMap["Mt. Pyre 3F"] = {["Mt. Pyre 2F"] = {1.5}, ["Mt. Pyre 4F"] = {1.5}, ["Mt. Pyre Exterior"] = {1.5}}
HoennMap["Mt. Pyre 4F"] = {["Mt. Pyre 3F"] = {1.5}}
HoennMap["Mt. Pyre Exterior"] = {["Mt. Pyre 3F"] = {3}, ["Mt. Pyre Summit"] = {3}}
HoennMap["Mt. Pyre Summit"] = {["Mt. Pyre Exterior"] = {1.5}}
HoennMap["New Mauville"] = {["New Mauville Entrance"] = {1}} -- not fully supported with npc restrictions
HoennMap["New Mauville Entrance"] = {["Route 110_C"] = {1}, ["New Mauville"] = {1}--[[talk to shelly maybe 12, 7]]}
HoennMap["Oldale Town"] = {["Mart Oldale Town"] = {1}, ["Pokecenter Oldale Town"] = {1}, ["Route 101"] = {1}, ["Route 102"] = {1}, ["Route 103_A"] = {1}}
HoennMap["Pacifidlog Town"] = {["Pokecenter Pacifidlog Town"] = {1}, ["Route 131"] = {1}, ["Route 132"] = {1}}
HoennMap["Petalburg City"] = {["Mart Petalburg City"] = {1}, ["Pokecenter Petalburg City"] = {1}, ["Route 102"] = {1}, ["Route 104_B"] = {1}}
HoennMap["Petalburg Woods_A"] = {["Route 104_A"] = {1}, ["Route 104_B"] = {1}, ["Route 104_C"] = {1}, ["Petalburg Woods_B"] = {1, {["abilities"] = {"cut"}}}}
HoennMap["Petalburg Woods_B"] = {["Petalburg Woods_A"] = {1}} -- link inside wood
HoennMap["Pokecenter Dewford Town"] = {["Dewford Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Ever Grande City"] = {["Ever Grande City_A"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Fallarbor Town"] = {["Fallarbor Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Fortree City"] = {["Fortree City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Lavaridge Town"] = {["Lavaridge Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Lilycove City"] = {["Lilycove City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Mauville City"] = {["Mauville City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Mossdeep City"] = {["Mossdeep City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Oldale Town"] = {["Oldale Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Pacifidlog Town"] = {["Pacifidlog Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Petalburg City"] = {["Petalburg City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Rustboro City"] = {["Rustboro City_A"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Slateport"] = {["Slateport City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Sootopolis City"] = {["Sootopolis City"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokecenter Verdanturf"] = {["Verdanturf Town"] = {1}, ["Transmat Station"] = {0.2}}
HoennMap["Pokemon League Hoenn"] = {["Ever Grande City_B"] = {1}}
HoennMap["Route 101"] = {["Littleroot Town"] = {1}, ["Oldale Town"] = {1}}
HoennMap["Route 102"] = {["Oldale Town"] = {1}, ["Petalburg City"] = {1}}
HoennMap["Route 103_A"] = {["Oldale Town"] = {0.5}, ["Route 103_B"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 103_B"] = {["Route 103_C"] = {0, {["abilities"] = {"cut"}}}, ["Route 103_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 103_D"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 110_B"] = {1}}
HoennMap["Route 103_C"] = {["Route 103_B"] = {0, {["abilities"] = {"surf"}}}} -- excavation site
HoennMap["Route 103_D"] = {["Route 103_B"] = {0, {["abilities"] = {"cut"}}}}
HoennMap["Route 104_A"] = {["Petalburg Woods_A"] = {1}, ["Rustboro City_A"] = {1}, ["Rustboro City_B"] = {1.1}}
HoennMap["Route 104_B"] = {["Petalburg Woods_A"] = {1}, ["Route 105"] = {1.5, {["abilities"] = {"surf"}}}, ["Petalburg City"] = {1}}
HoennMap["Route 104_C"] = {["Route 104_B"] = {0.5}}
HoennMap["Route 105"] = {["Route 104_B"] = {3}, ["Route 106"] = {3}}
HoennMap["Route 106"] = {["Dewford Town"] = {1.5}, ["Route 105"] = {1.5, {["abilities"] = {"surf"}}}} -- link cave
HoennMap["Route 107"] = {["Dewford Town"] = {2}, ["Route 108"] = {2}}
HoennMap["Route 108"] = {["Route 107"] = {2}, ["Route 109"] = {2}} -- link abandoned ship
HoennMap["Route 109"] = {["Route 108"] = {2, {["abilities"] = {"surf"}}}, ["Slateport City"] = {2}}
HoennMap["Route 110_A"] = {["Mauville City Stop House 1"] = {1}, ["Cycle Road Stop House 2"] = {1}, ["Route 110_B"] = {2}, ["Route 110_C"] = {1.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 110_B"] = {["Route 103_B"] = {1}, ["Slateport City"] = {1}, ["Cycle Road Stop House 1"] = {1}, ["Route 110_A"] = {2}}
HoennMap["Route 110_C"] = {["Route 110_A"] = {1.5, {["abilities"] = {"surf"}}}, ["New Mauville Entrance"] = {1}}
HoennMap["Route 110_D"] = {["Cycle Road Stop House 1"] = {0.5}, ["Cycle Road Stop House 2"] = {0.5}}
HoennMap["Route 111 Desert"] = {["Route 111 North"] = {1}, ["Route 111 South"] = {1}}
HoennMap["Route 111 North"] = {["Route 111 Desert"] = {1, {["items"] = {"Go-Goggles"}}}, ["Route 112_A"] = {1}, ["Route 113"] = {1}}
HoennMap["Route 111 South"] = {["Mauville City Stop House 3"] = {1.5}, ["Route 111 Desert"] = {1.5, {["items"] = {"Go-Goggles"}}}, ["Route 112_B"] = {1.5}}
HoennMap["Route 112_A"] = {["Fiery Path"] = {1}, ["Route 111 North"] = {1}}
HoennMap["Route 112_B"] = {["Cable Car Station 1"] = {1}, ["Fiery Path"] = {1}, ["Route 111 South"] = {1}}
HoennMap["Route 112_C"] = {["Lavaridge Town"] = {0.5}, ["Jagged Pass_C"] = {0.5}, ["Route 112_B"] = {0.5}}
HoennMap["Route 113"] = {["Fallarbor Town"] = {1.5}, ["Route 111 North"] = {1.5}}
HoennMap["Route 114"] = {["Fallarbor Town"] = {1.5}, ["Meteor falls 1F 1R_A"] = {1.5}}
HoennMap["Route 115_A"] = {["Meteor falls 1F 1R_X"] = {1}, ["Route 115_B"] = {0.5}, ["Route 115_C"] = {1, {["abilities"] = {"surf"}}}}
HoennMap["Route 115_B"] = {["Route 115_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Rustboro City_A"] = {1}}
HoennMap["Route 115_C"] = {["Route 115_A"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 115_B"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 115_E"] = {1.5, {["abilities"] = {"rock climb"}}}, ["Route 115_D"] = {1.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Route 115_D"] = {["Route 115_C"] = {0.5}, ["Meteor falls 1F 1R_C"] = {0.5}}
HoennMap["Route 115_E"] = {["Route 115_C"] = {1}}
HoennMap["Route 116_A"] = {["Rustboro City_A"] = {1}, ["Rusturf Tunnel_A"] = {1}, ["Route 116_C"] = {0.5, {["abilities"] = {"cut"}}}, ["Route 116_B"] = {1, {["abilities"] = {"dig"}}}, ["Verdanturf Town"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Route 116_B"] = {["Rusturf Tunnel_B"] = {1}, ["Route 116_A"] = {1, {["abilities"] = {"dig"}}}, ["Verdanturf Town"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Route 116_C"] = {["Route 116_A"] = {0.5}}
HoennMap["Route 117"] = {["Mauville City Stop House 2"] = {1.5}, ["Verdanturf Town"] = {1.5}}
HoennMap["Route 118_A"] = {["Mauville City Stop House 4"] = {0.5}, ["Route 118_B"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 118_B"] = {["Route 118_A"] = {0.5, {["abilities"] = {"surf"}}}, ["Route 119B"] = {0.5}, ["Route 123_C"] = {0.5}}
HoennMap["Route 119A"] = {["Fortree City"] = {2}, ["Route 119B"] = {2}}
HoennMap["Route 119B"] = {["Route 118_B"] = {2}, ["Route 119A"] = {2}}
HoennMap["Route 120_A"] = {["Fortree City"] = {2}, ["Route 121"] = {2}, ["Route 120_B"] = {2, {["abilities"] = {"surf"}}}}
HoennMap["Route 120_B"] = {["Route 120_A"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Route 121"] = {["Lilycove City"] = {1.5}, ["Route 120_A"] = {1.5}, ["Route 122"] = {1.5, {["abilities"] = {"surf"}}}, ["Hoenn Safari Zone Lobby"] = {1.5}}
HoennMap["Route 122"] = {["Route 121"] = {2, {["abilities"] = {"surf"}}}, ["Route 123_A"] = {2, {["abilities"] = {"surf"}}}, ["Mt. Pyre 1F"] = {2, {["abilities"] = {"surf"}}}}
HoennMap["Route 123_A"] = {["Route 122"] = {1}, ["Route 123_B"] = {1, {["abilities"] = {"cut"}}}, ["Route 123_C"] = {1}}
HoennMap["Route 123_B"] = {["Route 123_C"] = {1}}
HoennMap["Route 123_C"] = {["Route 118_B"] = {1}}
HoennMap["Route 124_A"] = {["Lilycove City"] = {2.5}, ["Mossdeep City"] = {2.5}, ["Route 126_A"] = {2.5}, ["Route 124 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_D"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_E"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 124_B"] = {["Route 124 Underwater_C"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 124 Underwater_D"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 124_C"] = {["Route 124 Underwater_A"] = {1.5}}
HoennMap["Route 124_D"] = {["Route 124 Underwater_A"] = {1.5}}
HoennMap["Route 124 Underwater_A"] = {["Route 124_A"] = {1.5}, ["Route 124_C"] = {1.5}, ["Route 124_D"] = {1.5}}
HoennMap["Route 124 Underwater_B"] = {["Route 124_A"] = {1.5}}
HoennMap["Route 124 Underwater_C"] = {["Route 124_B"] = {1.5}}
HoennMap["Route 124 Underwater_D"] = {["Route 124_B"] = {1.5}, ["Route 124_A"] = {1.5}}
HoennMap["Route 124 Underwater_E"] = {["Route 124_A"] = {1.5}}
HoennMap["Route 125"] = {["Mossdeep City"] = {2}} -- more links
HoennMap["Route 126_A"] = {["Route 124_A"] = {2}, ["Route 126 Underwater_A"] = {2}, ["Route 127_A"] = {2}}
HoennMap["Route 126_B"] = {["Route 126 Underwater_B"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 126_C"] = {["Route 126 Underwater_A"] = {1, {["abilities"] = {"dive"}}}, ["Route 126 Underwater_C"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 126_D"] = {["Route 126 Underwater_C"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 126 Underwater_A"] = {["Route 126_A"] = {2}, ["Route 126_C"] = {2}, ["Sootopolis City Underwater"] = {2}}
HoennMap["Route 126 Underwater_B"] = {["Route 126_B"] = {1}, ["Route 126_A"] = {1}}
HoennMap["Route 126 Underwater_C"] = {["Route 126_C"] = {1}, ["Route 126_D"] = {1}}
HoennMap["Route 127_A"] = {["Mossdeep City"] = {2}, ["Route 126_A"] = {2}, ["Route 128"] = {2}, ["Route 127 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}, ["Route 127 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 127_B"] = {["Route 127 Underwater_B"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 127 Underwater_A"] = {["Route 127_A"] = {2}, ["Route 128 Underwater_A"] = {2}}
HoennMap["Route 127 Underwater_B"] = {["Route 127_A"] = {1}, ["Route 127_B"] = {1}}
HoennMap["Route 128"] = {["Ever Grande City_A"] = {2}, ["Route 127_A"] = {2}, ["Route 129_A"] = {2}, ["Route 128 Underwater_B"] = {2, {["abilities"] = {"dive"}}}, ["Route 128 Underwater_C"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 128 Underwater_A"] = {["Secret Underwater Cavern"] = {2.5}, ["Route 127 Underwater_A"] = {2.5, {["abilities"] = {"dive"}}}}
HoennMap["Route 128 Underwater_B"] = {["Route 128"] = {1}}
HoennMap["Route 128 Underwater_C"] = {["Route 128"] = {1}}
HoennMap["Route 129_A"] = {["Route 128"] = {2}, ["Route 130_A"] = {2}, ["Route 129 Underwater"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 129_B"] = {["Route 129 Underwater"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 129 Underwater"] = {["Route 129_A"] = {1.5}, ["Route 129_B"] = {1.5}, ["Route 130 Underwater_A"] = {1.5}}
HoennMap["Route 130_A"] = {["Route 129_A"] = {2}, ["Route 131"] = {2}, ["Route 130 Underwater_B"] = {2, {["abilities"] = {"dive"}}}}
HoennMap["Route 130_B"] = {["Route 130 Underwater_A"] = {1, {["abilities"] = {"dive"}}}}
HoennMap["Route 130 Underwater_A"] = {["Route 130_B"] = {2}, ["Route 129 Underwater"] = {2}}
HoennMap["Route 130 Underwater_B"] = {["Route 130_A"] = {1}}
HoennMap["Route 131"] = {["Pacifidlog Town"] = {2}, ["Route 130_A"] = {2}, ["Sky Pillar Entrance_A"] = {2}}
HoennMap["Route 132"] = {["Pacifidlog Town"] = {2}, ["Route 133"] = {2}}
HoennMap["Route 133"] = {["Route 132"] = {2}, ["Route 134"] = {2}}
HoennMap["Route 134"] = {["Route 133"] = {2}, ["Slateport City"] = {2}}
HoennMap["Rustboro City_A"] = {["Mart Rustboro City"] = {1}, ["Pokecenter Rustboro City"] = {1}, ["Route 104_A"] = {1}, ["Route 115_B"] = {1}, ["Route 116_A"] = {1}}
HoennMap["Rustboro City_B"] = {["Route 104_A"] = {1}}
HoennMap["Rusturf Tunnel_A"] = {["Route 116_A"] = {1}, ["Rusturf Tunnel_B"] = {0.5, {["abilities"] = {"rock smash"}--[[npc maybe]]}}, ["Rusturf Tunnel_C"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Rusturf Tunnel_B"] = {["Route 116_B"] = {1}, ["Verdanturf Town"] = {1}, ["Rusturf Tunnel_A"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Rusturf Tunnel_C"] = {["Rusturf Tunnel_A"] = {0.5, {["abilities"] = {"rock smash"}}}}
HoennMap["Secret Underwater Cavern"] = {["Route 128 Underwater_A"] = {1}} -- links cavern
HoennMap["Sky Pillar Entrance_A"] = {["Route 131"] = {1}, ["Sky Pillar Entrance Cave 1F"] = {1}}
HoennMap["Sky Pillar Entrance_B"] = {["Sky Pillar Entrance Cave 1F"] = {1}, ["Sky Pillar 1F"] = {1}}
HoennMap["Sky Pillar Entrance Cave 1F"] = {["Sky Pillar Entrance_A"] = {1}, ["Sky Pillar Entrance_B"] = {1}}
HoennMap["Sky Pillar 1F"] = {["Sky Pillar Entrance_B"] = {1}, ["Sky Pillar 2F"] = {1}}
HoennMap["Sky Pillar 2F"] = {["Sky Pillar 1F"] = {1}, ["Sky Pillar 3F"] = {1}}
HoennMap["Sky Pillar 3F"] = {["Sky Pillar 2F"] = {1}, ["Sky Pillar 4F_A"] = {1}, ["Sky Pillar 4F_B"] = {1}}
HoennMap["Sky Pillar 4F_A"] = {["Sky Pillar 3F"] = {1}, ["Sky Pillar 5F"] = {1}}
HoennMap["Sky Pillar 4F_B"] = {["Sky Pillar 3F"] = {1}}
HoennMap["Sky Pillar 5F"] = {["Sky Pillar 4F_A"] = {1}, ["Sky Pillar 6F"] = {1}}
HoennMap["Sky Pillar 6F"] = {["Sky Pillar 5F"] = {1}}
HoennMap["Slateport City"] = {["Mart Slateport"] = {1}, ["Pokecenter Slateport"] = {1}, ["Route 109"] = {1}, ["Route 110_B"] = {1}}
HoennMap["Sootopolis City"] = {["Pokecenter Sootopolis City"] = {1}, ["Sootopolis City Underwater"] = {1, {["abilities"] = {"dive"}}}, ["Sootopolis Mart"] = {1}}
HoennMap["Sootopolis City Underwater"] = {["Route 126 Underwater_A"] = {1}, ["Sootopolis City"] = {1}}
HoennMap["Sootopolis Mart"] = {["Sootopolis City"] = {1}}
HoennMap["Transmat Station"] = {["Pokecenter Verdanturf"] = {H_SUBWAY}, ["Pokecenter Sootopolis City"] = {H_SUBWAY}, ["Pokecenter Slateport"] = {H_SUBWAY}, ["Pokecenter Rustboro City"] = {H_SUBWAY}, ["Pokecenter Petalburg City"] = {H_SUBWAY}, ["Pokecenter Pacifidlog Town"] = {H_SUBWAY}, ["Pokecenter Oldale Town"] = {H_SUBWAY}, ["Pokecenter Mossdeep City"] = {H_SUBWAY}, ["Pokecenter Mauville City"] = {H_SUBWAY}, ["Pokecenter Lilycove City"] = {H_SUBWAY}, ["Pokecenter Lavaridge Town"] = {H_SUBWAY}, ["Pokecenter Fortree City"] = {H_SUBWAY}, ["Pokecenter Fallarbor Town"] = {H_SUBWAY}, ["Pokecenter Ever Grande City"] = {H_SUBWAY}, ["Pokecenter Dewford Town"] = {H_SUBWAY}}
HoennMap["Verdanturf Mart"] = {["Verdanturf Town"] = {1}}
HoennMap["Verdanturf Town"] = {["Pokecenter Verdanturf"] = {1}, ["Route 117"] = {1}, ["Rusturf Tunnel_B"] = {1}, ["Verdanturf Mart"] = {1}, ["Route 116_A"] = {1, {["abilities"] = {"dig"}}}, ["Route 116_B"] = {1, {["abilities"] = {"dig"}}}}
HoennMap["Victory Road Hoenn 1F_A"] = {["Ever Grande City_A"] = {2}, ["Victory Road Hoenn B1F_B"] = {2}, ["Victory Road Hoenn B1F_A"] = {2}}
HoennMap["Victory Road Hoenn 1F_B"] = {["Ever Grande City_B"] = {0.5}, ["Victory Road Hoenn 1F_A"] = {0.5}, ["Victory Road Hoenn B1F_A"] = {0.5}}
HoennMap["Victory Road Hoenn 1F_C"] = {["Victory Road Hoenn B1F_A"] = {1}}
HoennMap["Victory Road Hoenn B1F_A"] = {["Victory Road Hoenn 1F_A"] = {1.5}, ["Victory Road Hoenn 1F_B"] = {1.5}, ["Victory Road Hoenn 1F_C"] = {1.5}, ["Victory Road Hoenn B2F_A"]= {1.5}}
HoennMap["Victory Road Hoenn B1F_B"] = {["Victory Road Hoenn B1F_C"] = {0.5}, ["Victory Road Hoenn 1F_A"] = {0.5}, ["Victory Road Hoenn B2F_E"] = {0.5}}
HoennMap["Victory Road Hoenn B1F_C"] = {["Victory Road Hoenn B2F_B"] = {0.5}}
HoennMap["Victory Road Hoenn B1F_D"] = {["Victory Road Hoenn B2F_A"] = {1}}
HoennMap["Victory Road Hoenn B2F_A"] = {["Victory Road Hoenn B1F_D"] = {2}, ["Victory Road Hoenn B1F_A"] = {2}}
HoennMap["Victory Road Hoenn B2F_B"] = {["Victory Road Hoenn B2F_C"] = {0.5}}
HoennMap["Victory Road Hoenn B2F_C"] = {["Victory Road Hoenn B2F_F"] = {0.5, {["abilities"] = {"surf"}}}}
HoennMap["Victory Road Hoenn B2F_D"] = {["Victory Road Hoenn B2F_C"] = {1}, ["Victory Road Hoenn B2F_A"] = {1}, ["Victory Road Hoenn B2F_F"] = {1}}
HoennMap["Victory Road Hoenn B2F_E"] = {["Victory Road Hoenn B2F_F"] = {0.1, {["abilities"] = {"surf"}}}, ["Victory Road Hoenn B1F_B"] = {0.1}}
HoennMap["Victory Road Hoenn B2F_F"] = {["Victory Road Hoenn B2F_E"] = {0}}

-- HoennMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return HoennMap
end