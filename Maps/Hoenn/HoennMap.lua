
local hoenn = {}

hoenn["Lilycove City Harbor"] = {"Lilycove City=1"}
hoenn["Lilycove City"] = {"Route 121=1", "Pokecenter Lilycove City=1", "Route 124=1"}
hoenn["Route 121"] = {"Route 120=1", "Route 122=1", "Lilycove City=1"}
hoenn["Route 120"] = {"Route 121=1", "Fortree City=1"}
hoenn["Fortree City"] = {"Route 119A=1", "Route 120=1", "Pokecenter Fortree City=1", "Fortree Mart=1"}
hoenn["Route 119A"] = {"Fortree City=1", "Route 119B=1"}
hoenn["Route 119B"] = {"Route 119A=1", "Route 118=1"}
hoenn["Route 118"] = {"Route 119B=1", "Route 123=1", "Mauville City Stop House 4=1"}
hoenn["Route 123"] = {"Route 118=1"} -- path blocked to 122
hoenn["Route 122"] = {"Route 123=1", "Route 121=1"} -- missing mt.pyre
hoenn["Mauville City Stop House 4"] = {"Route 118=1", "Mauville City=1"}
hoenn["Mauville City"] = {"Pokecenter Mauville City=1", "Mart Mauville City=1", "Mauville City Stop House 4=1", "Mauville City Stop House 3=1", "Mauville City Stop House 2=1", "Mauville City Stop House 1=1"} -- unfinished paths
hoenn["Mauville City Stop House 1"] = {"Mauville City=1", "Route 110=1"}
hoenn["Route 110"] = {"Mauville City Stop House 1=1", "Slateport City=1", "Route 103=1"}
hoenn["Slateport City"] = {"Route 110=1", "Pokecenter Slateport=1", "Mart Slateport=1", "Route 109=1"} -- Cannot go back to route 134
hoenn["Route 109"] = {"Slateport City=1", "Route 108=1"} -- boat shortcut
hoenn["Route 108"] = {"Route 109=1", "Route 107=1"}
hoenn["Route 107"] = {"Route 108=1", "Dewford Town=1"}
hoenn["Dewford Town"] = {"Route 107=1", "Pokecenter Dewford Town=1", "Route 106=1"} -- boat shortcut
hoenn["Route 106"] = {"Dewford Town=1", "Route 105=1"}
hoenn["Route 105"] = {"Route 106=1", "Route 104=1"}
hoenn["Route 104"] = {"Route 105=1", "Petalburg City=2", "Petalburg Woods=1", "Rustboro City=2"} -- boat shortcut
hoenn["Petalburg Woods"] = {"Route 104=1"}
hoenn["Petalburg City"] = {"Route 104=1", "Route 102=1", "Mart Petalburg City=1", "Pokecenter Petalburg City=1"}
hoenn["Route 102"] = {"Petalburg City=1", "Oldale Town=1"}
hoenn["Oldale Town"] = {"Route 102=1", "Route 103=1", "Mart Oldale Town=1", "Pokecenter Oldale Town=1", "Route 101=1"}
hoenn["Route 103"] = {"Oldale Town=1", "Route 110=1"}
hoenn["Route 101"] = {"Oldale Town=1", "Littleroot Town=1"}
hoenn["Littleroot Town"] = {"Route 101=1"}
hoenn["Rustboro City"] = {"Route 104=1", "Mart Rustboro City=1", "Pokecenter Rustboro City=1", "Route 115=1", "Route 116=1"}
hoenn["Route 116"] = {"Rustboro City=1", "Rusturf Tunnel=1"} -- digway
hoenn["Rusturf Tunnel"] = {"Route 116=1", "Verdanturf Town=1"}
hoenn["Verdanturf Town"] = {"Rusturf Tunnel=1", "Verdanturf Mart=1", "Route 117=1", "Pokecenter Verdanturf=1"}
hoenn["Route 117"] = {"Verdanturf Town=1", "Mauville City Stop House 2=1"}
hoenn["Mauville City Stop House 2"] = {"Mauville City=1", "Route 117=1"}
hoenn["Mauville City Stop House 3"] = {"Mauville City=1", "Route 111 South=1"}
hoenn["Route 111 South"] = {"Mauville City Stop House 3=1", "Route 111 Desert=1", "Route 112=1"}
hoenn["Route 112"] = {"Route 111 South=2", "Lavaridge Town=3", "Fiery Path=1", "Cable Car Station 1=2", "Route 111 North=2"}
hoenn["Cable Car Station 1"] = {"Route 112=1", "Cable Car Station 2=1"}
hoenn["Cable Car Station 2"] = {"Cable Car Station 1=1", "Mt. Chimney=1"}
hoenn["Mt. Chimney"] = {"Cable Car Station 2=1", "Jagged Pass=1"}
hoenn["Jagged Pass"] = {"Mt. Chimney=1", "Route 112=1"}
hoenn["Lavaridge Town"] = {"Route 112=1", "Lavaridge Mart=1", "Pokecenter Lavaridge Town=1"}
hoenn["Fiery Path"] = {"Route 112=1"}
hoenn["Route 111 North"] = {"Route 112=1", "Route 111 Desert=1", "Route 113=1"}
hoenn["Route 111 Desert"] = {"Route 111 North=1", "Route 111 South=1"}
hoenn["Route 113"] = {"Route 111 North=1", "Fallabor Town=1"}
hoenn["Fallabor Town"] = {"Route 113=1", "Pokecenter Fallabor Town=1", "Route 114=1", "Mart Fallabor Town=1"}
hoenn["Route 114"] = {"Fallabor Town=1", "Meteor falls 1F 1R=1"}
hoenn["Meteor falls 1F 1R"] = {"Route 114=1", "Route 115=1"}
hoenn["Route 115"] = {"Meteor falls 1F 1R=1", "Rustboro City=1"}
hoenn["Route 124"] = {"Lilycove City=1", "Mossdeep City=1", "Route 126=1"}
hoenn["Route 126"] = {"Route 124=1", "Route 127=1", "Route 126 Underwater=1"}
hoenn["Route 127"] = {"Route 126=1", "Route 128=1", "Mossdeep City=1"}
hoenn["Route 128"] = {"Route 127=1", "Ever Grande City=1", "Route 129=1"}
hoenn["Ever Grande City"] = {"Route 128=1", "Pokecenter Ever Grande City=1", "Victory Road Hoenn 1F=1", "Pokemon League Hoenn=1"} -- digway
hoenn["Victory Road Hoenn 1F"] = {"Ever Grande City=1", "Victory Road Hoenn B1F=1"}
hoenn["Victory Road Hoenn B1F"] = {"Victory Road Hoenn 1F=1"}
hoenn["Pokemon League Hoenn"] = {"Ever Grande City=1"}
hoenn["Mossdeep City"] = {"Route 124=1", "Pokecenter Mossdeep City=1", "Mossdeep Pokemart=1", "Route 127=1", "Route 125=1"}
hoenn["Route 125"] = {"Mossdeep City=1"}
hoenn["Sootopolis City"] = {"Pokecenter Sootopolis City=1", "Sootopolis Mart=1", "Sootopolis City Underwater=1"}
hoenn["Sootopolis City Underwater"] = {"Sootopolis City=1", "Route 126 Underwater=1"}
hoenn["Route 126 Underwater"] = {"Sootopolis City Underwater=1", "Route 126=1"}
hoenn["Route 129"] = {"Route 128=1", "Route 130=1"}
hoenn["Route 130"] = {"Route 129=1", "Route 131=1"}
hoenn["Route 131"] = {"Route 130=1", "Sky Pillar Entrance=1", "Pacifidlog Town=1"}
hoenn["Sky Pillar Entrance"] = {"Route 131=1"} -- Sky Pillar not handled
hoenn["Pacifidlog Town"] = {"Route 131=1", "Pokecenter Pacifidlog Town=1", "Route 132=1"}
hoenn["Route 132"] = {"Pacifidlog Town=1", "Route 133=1"}
hoenn["Route 133"] = {"Route 132=1", "Route 134=1"}
hoenn["Route 134"] = {"Route 133=1", "Slateport City=1"} -- exception 
-- Pokecenters
hoenn["Pokecenter Lilycove City"] = {"Lilycove City=1"}
hoenn["Pokecenter Fortree City"] = {"Fortree City=1"}
hoenn["Pokecenter Mauville City"] = {"Mauville City=1"}
hoenn["Pokecenter Slateport"] = {"Slateport City=1"}
hoenn["Pokecenter Dewford Town"] = {"Dewford Town=1"}
hoenn["Pokecenter Petalburg City"] = {"Petalburg City=1"}
hoenn["Pokecenter Oldale Town"] = {"Oldale Town=1"}
hoenn["Pokecenter Rustboro City"] = {"Rustboro City=1"}
hoenn["Pokecenter Verdanturf"] = {"Verdanturf Town=1"}
hoenn["Pokecenter Lavaridge Town"] = {"Lavaridge Town=1"}
hoenn["Pokecenter Fallabor Town"] = {"Fallabor Town=1"}
hoenn["Pokecenter Ever Grande City"] = {"Ever Grande City=1"}
hoenn["Pokecenter Mossdeep City"] = {"Mossdeep City=1"}
hoenn["Pokecenter Sootopolis City"] = {"Sootopolis City=1"}
hoenn["Pokecenter Pacifidlog Town"] = {"Pacifidlog Town=1"}
-- Pokemarts
hoenn["Fortree Mart"] = {"Fortree City=1"}
hoenn["Mart Mauville City"] = {"Mauville City=1"}
hoenn["Mart Slateport"] = {"Slateport City=1"}
hoenn["Mart Petalburg City"] = {"Petalburg City=1"}
hoenn["Mart Oldale Town"] = {"Oldale Town=1"}
hoenn["Mart Rustboro City"] = {"Rustboro City=1"}
hoenn["Verdanturf Mart"] = {"Verdanturf Town=1"}
hoenn["Lavaridge Mart"] = {"Lavaridge Town=1"}
hoenn["Mart Fallabor Town"] = {"Fallabor Town=1"}
hoenn["Mossdeep Pokemart"] = {"Mossdeep City=1"}
hoenn["Sootopolis Mart"] = {"Sootopolis City=1"}

return hoenn