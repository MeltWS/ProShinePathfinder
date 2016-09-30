local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local ss = require (cppdpath .. "Settings/static_Settings")
local H_SUBWAY = ss.H_SUBWAY
local HoennMap = {}

HoennMap["Cable Car Station 1"] = {["Cable Car Station 2"] = 1, ["Route 112"] = 1}
HoennMap["Cable Car Station 2"] = {["Cable Car Station 1"] = 1, ["Mt. Chimney"] = 1}
HoennMap["Dewford Town"] = {["Pokecenter Dewford Town"] = 1, ["Route 106"] = 1, ["Route 107"] = 1}
HoennMap["Ever Grande City"] = {["Pokecenter Ever Grande City"] = 1, ["Pokemon League Hoenn"] = 1, ["Route 128"] = 1, ["Victory Road Hoenn 1F"] = 1}
HoennMap["Fallabor Town"] = {["Mart Fallabor Town"] = 1, ["Pokecenter Fallabor Town"] = 1, ["Route 113"] = 1, ["Route 114"] = 1}
HoennMap["Fiery Path"] = {["Route 112"] = 1}
HoennMap["Fortree City"] = {["Fortree Mart"] = 1, ["Pokecenter Fortree City"] = 1, ["Route 119A"] = 1, ["Route 120"] = 1}
HoennMap["Fortree Mart"] = {["Fortree City"] = 1}
HoennMap["Jagged Pass"] = {["Mt. Chimney"] = 1, ["Route 112"] = 1}
HoennMap["Lavaridge Mart"] = {["Lavaridge Town"] = 1}
HoennMap["Lavaridge Town"] = {["Lavaridge Mart"] = 1, ["Pokecenter Lavaridge Town"] = 1, ["Route 112"] = 1}
HoennMap["Lilycove City"] = {["Lilycove City Harbor"] = 1, ["Pokecenter Lilycove City"] = 1, ["Route 121"] = 1, ["Route 124"] = 1}
HoennMap["Lilycove City Harbor"] = {["Lilycove City"] = 1}
HoennMap["Littleroot Town"] = {["Route 101"] = 1}
HoennMap["Mart Fallabor Town"] = {["Fallabor Town"] = 1}
HoennMap["Mart Mauville City"] = {["Mauville City"] = 1}
HoennMap["Mart Oldale Town"] = {["Oldale Town"] = 1}
HoennMap["Mart Petalburg City"] = {["Petalburg City"] = 1}
HoennMap["Mart Rustboro City"] = {["Rustboro City"] = 1}
HoennMap["Mart Slateport"] = {["Slateport City"] = 1}
HoennMap["Mauville City"] = {["Mart Mauville City"] = 1, ["Mauville City Stop House 1"] = 1, ["Mauville City Stop House 2"] = 1, ["Mauville City Stop House 3"] = 1, ["Mauville City Stop House 4"] = 1, ["Pokecenter Mauville City"] = 1}
HoennMap["Mauville City Stop House 1"] = {["Mauville City"] = 1, ["Route 110"] = 1}
HoennMap["Mauville City Stop House 2"] = {["Mauville City"] = 1, ["Route 117"] = 1}
HoennMap["Mauville City Stop House 3"] = {["Mauville City"] = 1, ["Route 111 South"] = 1}
HoennMap["Mauville City Stop House 4"] = {["Mauville City"] = 1, ["Route 118"] = 1}
HoennMap["Meteor falls 1F 1R"] = {["Route 114"] = 1, ["Route 115"] = 1}
HoennMap["Mossdeep City"] = {["Mossdeep Pokemart"] = 1, ["Pokecenter Mossdeep City"] = 1, ["Route 124"] = 1, ["Route 125"] = 1, ["Route 127"] = 1}
HoennMap["Mossdeep Pokemart"] = {["Mossdeep City"] = 1}
HoennMap["Mt. Chimney"] = {["Cable Car Station 2"] = 1, ["Jagged Pass"] = 1}
HoennMap["Oldale Town"] = {["Mart Oldale Town"] = 1, ["Pokecenter Oldale Town"] = 1, ["Route 101"] = 1, ["Route 102"] = 1, ["Route 103"] = 1}
HoennMap["Pacifidlog Town"] = {["Pokecenter Pacifidlog Town"] = 1, ["Route 131"] = 1, ["Route 132"] = 1}
HoennMap["Petalburg City"] = {["Mart Petalburg City"] = 1, ["Pokecenter Petalburg City"] = 1, ["Route 102"] = 1, ["Route 104"] = 1}
HoennMap["Petalburg Woods"] = {["Route 104"] = 1}
HoennMap["Pokecenter Dewford Town"] = {["Dewford Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Ever Grande City"] = {["Ever Grande City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Fallabor Town"] = {["Fallabor Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Fortree City"] = {["Fortree City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Lavaridge Town"] = {["Lavaridge Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Lilycove City"] = {["Lilycove City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Mauville City"] = {["Mauville City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Mossdeep City"] = {["Mossdeep City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Oldale Town"] = {["Oldale Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Pacifidlog Town"] = {["Pacifidlog Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Petalburg City"] = {["Petalburg City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Rustboro City"] = {["Rustboro City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Slateport"] = {["Slateport City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Sootopolis City"] = {["Sootopolis City"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokecenter Verdanturf"] = {["Verdanturf Town"] = 1, ["Transmat Station"] = 1}
HoennMap["Pokemon League Hoenn"] = {["Ever Grande City"] = 1}
HoennMap["Route 101"] = {["Littleroot Town"] = 1, ["Oldale Town"] = 1}
HoennMap["Route 102"] = {["Oldale Town"] = 1, ["Petalburg City"] = 1}
HoennMap["Route 103"] = {["Oldale Town"] = 1, ["Route 110"] = 1}
HoennMap["Route 104"] = {["Petalburg City"] = 2, ["Petalburg Woods"] = 1, ["Route 105"] = 1, ["Rustboro City"] = 2}
HoennMap["Route 105"] = {["Route 104"] = 2, ["Route 106"] = 2}
HoennMap["Route 106"] = {["Dewford Town"] = 2, ["Route 105"] = 2}
HoennMap["Route 107"] = {["Dewford Town"] = 2, ["Route 108"] = 2}
HoennMap["Route 108"] = {["Route 107"] = 2, ["Route 109"] = 2}
HoennMap["Route 109"] = {["Route 108"] = 2, ["Slateport City"] = 1}
HoennMap["Route 110"] = {["Mauville City Stop House 1"] = 1, ["Route 103"] = 1, ["Slateport City"] = 1}
HoennMap["Route 111 Desert"] = {["Route 111 North"] = 1, ["Route 111 South"] = 1}
HoennMap["Route 111 North"] = {["Route 111 Desert"] = 1, ["Route 112"] = 1, ["Route 113"] = 1}
HoennMap["Route 111 South"] = {["Mauville City Stop House 3"] = 1, ["Route 111 Desert"] = 1, ["Route 112"] = 1}
HoennMap["Route 112"] = {["Cable Car Station 1"] = 2, ["Fiery Path"] = 1, ["Lavaridge Town"] = 3, ["Route 111 North"] = 2, ["Route 111 South"] = 2}
HoennMap["Route 113"] = {["Fallabor Town"] = 1, ["Route 111 North"] = 1}
HoennMap["Route 114"] = {["Fallabor Town"] = 1, ["Meteor falls 1F 1R"] = 1}
HoennMap["Route 115"] = {["Meteor falls 1F 1R"] = 1, ["Rustboro City"] = 1}
HoennMap["Route 116"] = {["Rustboro City"] = 1, ["Rusturf Tunnel"] = 1}
HoennMap["Route 117"] = {["Mauville City Stop House 2"] = 1, ["Verdanturf Town"] = 1}
HoennMap["Route 118"] = {["Mauville City Stop House 4"] = 1, ["Route 119B"] = 1, ["Route 123"] = 1}
HoennMap["Route 119A"] = {["Fortree City"] = 1, ["Route 119B"] = 1}
HoennMap["Route 119B"] = {["Route 118"] = 1, ["Route 119A"] = 1}
HoennMap["Route 120"] = {["Fortree City"] = 1, ["Route 121"] = 1}
HoennMap["Route 121"] = {["Lilycove City"] = 1, ["Route 120"] = 1, ["Route 122"] = 1}
HoennMap["Route 122"] = {["Route 121"] = 1, ["Route 123"] = 1}
HoennMap["Route 123"] = {["Route 118"] = 1}
HoennMap["Route 124"] = {["Lilycove City"] = 2, ["Mossdeep City"] = 2, ["Route 126"] = 2}
HoennMap["Route 125"] = {["Mossdeep City"] = 2}
HoennMap["Route 126"] = {["Route 124"] = 2, ["Route 126 Underwater"] = 1, ["Route 127"] = 2}
HoennMap["Route 126 Underwater"] = {["Route 126"] = 2, ["Sootopolis City Underwater"] = 2}
HoennMap["Route 127"] = {["Mossdeep City"] = 2, ["Route 126"] = 2, ["Route 128"] = 2}
HoennMap["Route 128"] = {["Ever Grande City"] = 2, ["Route 127"] = 2, ["Route 129"] = 2}
HoennMap["Route 129"] = {["Route 128"] = 2, ["Route 130"] = 2}
HoennMap["Route 130"] = {["Route 129"] = 2, ["Route 131"] = 2}
HoennMap["Route 131"] = {["Pacifidlog Town"] = 1, ["Route 130"] = 1, ["Sky Pillar Entrance"] = 1}
HoennMap["Route 132"] = {["Pacifidlog Town"] = 1, ["Route 133"] = 1}
HoennMap["Route 133"] = {["Route 132"] = 1, ["Route 134"] = 1}
HoennMap["Route 134"] = {["Route 133"] = 1, ["Slateport City"] = 1}
HoennMap["Rustboro City"] = {["Mart Rustboro City"] = 1, ["Pokecenter Rustboro City"] = 1, ["Route 104"] = 1, ["Route 115"] = 1, ["Route 116"] = 1}
HoennMap["Rusturf Tunnel"] = {["Route 116"] = 1, ["Verdanturf Town"] = 1}
HoennMap["Sky Pillar Entrance"] = {["Route 131"] = 1}
HoennMap["Slateport City"] = {["Mart Slateport"] = 1, ["Pokecenter Slateport"] = 1, ["Route 109"] = 1, ["Route 110"] = 1}
HoennMap["Sootopolis City"] = {["Pokecenter Sootopolis City"] = 1, ["Sootopolis City Underwater"] = 1, ["Sootopolis Mart"] = 1}
HoennMap["Sootopolis City Underwater"] = {["Route 126 Underwater"] = 1, ["Sootopolis City"] = 1}
HoennMap["Sootopolis Mart"] = {["Sootopolis City"] = 1}
HoennMap["Transmat Station"] = {["Pokecenter Verdanturf"] = H_SUBWAY, ["Pokecenter Sootopolis City"] = H_SUBWAY, ["Pokecenter Slateport"] = H_SUBWAY, ["Pokecenter Rustboro City"] = H_SUBWAY, ["Pokecenter Petalburg City"] = H_SUBWAY, ["Pokecenter Pacifidlog Town"] = H_SUBWAY, ["Pokecenter Oldale Town"] = H_SUBWAY, ["Pokecenter Mossdeep City"] = H_SUBWAY, ["Pokecenter Mauville City"] = H_SUBWAY, ["Pokecenter Lilycove City"] = H_SUBWAY, ["Pokecenter Lavaridge Town"] = H_SUBWAY, ["Pokecenter Fortree City"] = H_SUBWAY, ["Pokecenter Fallabor Town"] = H_SUBWAY, ["Pokecenter Ever Grande City"] = H_SUBWAY, ["Pokecenter Dewford Town"] = H_SUBWAY}
HoennMap["Verdanturf Mart"] = {["Verdanturf Town"] = 1}
HoennMap["Verdanturf Town"] = {["Pokecenter Verdanturf"] = 1, ["Route 117"] = 1, ["Rusturf Tunnel"] = 1, ["Verdanturf Mart"] = 1}
HoennMap["Victory Road Hoenn 1F"] = {["Ever Grande City"] = 1, ["Victory Road Hoenn B1F"] = 1}
HoennMap["Victory Road Hoenn B1F"] = {["Victory Road Hoenn 1F"] = 1}

return HoennMap
