-- TRANSMAT EXCEPTION
local function Mode_Transmat(destPC, Dialogs)
    local npcX = 4
    local npcY = 4
    local cellX = 4
    local cellY = 5

    if "Transmat Station" == getMapName()  then
        if TransmatReached then
            if getPlayerX() == 9 and getPlayerY() == 9 then
                TransmatReached = false
                return moveToCell(9,10)
            else moveToCell(9,9)
            end
        else
            Lib.log1time("Exception Resolution:  [ Transmat Station To " .. PathSolution[1] .." ]  SpeakWithNPC  X:4 Y:4 ")
            if (getPlayerX() == cellX) and (getPlayerY() == cellY) and isNpcOnCell(npcX, npcY) then
                DialogCheck  = "What destination's Pokemon Center would you like to be transmitted to? It will cost $2,500 Pokedollars per travel."
                DialogChoose = Dialogs
                talkToNpcOnCell(npcX, npcY)
            else moveToCell(cellX,cellY)
            end
        end
    else
        return false
    end
end

-- HOENN --

-- MOVE TO CELL --
-- Route 104 and Petalburg Woods
DescMaps["Route 104_to_Rustboro City"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,36,79) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,40,0) end}
DescMaps["Route 104_to_Route 105"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,47,148) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,23,51) end}
DescMaps["Route 104_to_Petalburg City"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,78,110) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,23,51) end}
DescMaps["Petalburg Woods_to_Rustboro City"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,22,0) end}
DescMaps["Petalburg Woods_to_Route 105"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,51,60) end}
DescMaps["Petalburg Woods_to_Petalburg City"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,51,60) end}
-- Route 116
DescMaps["Route 116_to_Rusturf Tunnel"] = {function() Mode_MoveToCell("Route 116", 0,10,79,29,62,19) end, function() Mode_MoveToCell("Route 116", 85,10,119,31,87,22) end}
-- Rusturf Tunnel
DescMaps["Rusturf Tunnel_to_Verdanturf Town"] = {function() Mode_MoveToCell("Rusturf Tunnel", 9,5,38,32,35,26) end}
DescMaps["Rusturf Tunnel_to_Route 116"] = {function() Mode_MoveToCell("Rusturf Tunnel", 9,5,38,32,11,19) end}
-- Route 112 and Fiery Path
DescMaps["Route 112_to_Route 111 South"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,45,58) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,45,58) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,45,58) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Route 111 North"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,8,43) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,8,43) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,8,43) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,45,11) end}
DescMaps["Route 112_to_Lavaridge Town"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,0,59) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Jagged Pass"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,11,55) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Cable Car Station 1"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,29,33) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Fiery Path_to_Route 111 South"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Route 111 North"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,38,8) end}
DescMaps["Fiery Path_to_Lavaridge Town"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Jagged Pass"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Cable Car Station 1"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Cable Car Station 2_to_Lavaridge Town"] = {function() Mode_MoveToCell("Cable Car Station 2", 0,6,11,9,3,9) end}
DescMaps["Cable Car Station 2_to_Jagged Pass"] = {function() Mode_MoveToCell("Cable Car Station 2", 0,6,11,9,3,9) end}
DescMaps["Mt. Chimney_to_Lavaridge Town"] = {function() Mode_MoveToCell("Mt. Chimney", 11,0,56,50,32,50) end}
DescMaps["Mt. Chimney_to_Jagged Pass"] = {function() Mode_MoveToCell("Mt. Chimney", 11,0,56,50,32,50) end}
DescMaps["Jagged Pass_to_Lavaridge Town"] = {function() Mode_MoveToCell("Jagged Pass", 0,0,40,110,21,110) end}
-- Victory Road HOENN
DescMaps["Ever Grande City_to_Route 128"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,30,34) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,0,103) end}
DescMaps["Ever Grande City_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,31,9) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,27,56) end}
DescMaps["Ever Grande City_to_Pokecenter Ever Grande City"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,30,34) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,45,64) end}
DescMaps["Victory Road Hoenn 1F_to_Route 128"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,21,55) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,21,55) end}
DescMaps["Victory Road Hoenn 1F_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,9,17) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,46,10) end}
DescMaps["Victory Road Hoenn 1F_to_Pokecenter Ever Grande City"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,21,55) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,21,55) end}
DescMaps["Victory Road Hoenn B1F_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Victory Road Hoenn B1F", 4,4,58,80,46,7) end}
-- Route 134
DescMaps["Route 134_to_Route 133"] = {function() Mode_MoveToCell("Route 134", 16,2,55,30,55,2) end, function() Mode_MoveToCell("Route 134", 0,2,15,30,0,6) end}
-- SKY PILLAR --
DescMaps["Sky Pillar Entrance_to_Sky Pillar 1F"] = {function() Mode_MoveToCell("Sky Pillar Entrance", 13,30,37,48,26,32) end, function() Mode_MoveToCell("Sky Pillar Entrance", 25,7,36,26,27,6) end}
DescMaps["Sky Pillar Entrance Cave 1F_to_Sky Pillar Entrance"] = {function() Mode_MoveToCell("Sky Pillar Entrance Cave 1F", 5,2,18,16,17,6) end}
DescMaps["Sky Pillar 3F_to_Sky Pillar 4F"] = {function() Mode_MoveToCell("Sky Pillar 3F", 1,5,14,11,3,6) end}
DescMaps["Sky Pillar Entrance_to_Route 131"] = {function() Mode_MoveToCell("Sky Pillar Entrance", 25,7,36,26,35,23) end, function() Mode_MoveToCell("Sky Pillar Entrance", 13,30,37,49,26,49) end}
DescMaps["Sky Pillar Entrance Cave 1F_to_Route 131"] = {function() Mode_MoveToCell("Sky Pillar Entrance Cave 1F", 5,2,18,18,7,17) end}
-- SAFARI HOENN
DescMaps["Hoenn Safari Zone Lobby_to_Hoenn Safari Zone Area 1"] = {function() Mode_SpeakWithNPC("Hoenn Safari Zone Lobby","Hello! Welcome to the Hoenn Safari zone!",{1},21,7,21,6) end}

-- SPEAK WITH NPC --
-- Cable Car Station
DescMaps["Cable Car Station 1_to_Cable Car Station 2"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 1_to_Lavaridge Town"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 1_to_Jagged Pass"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 2_to_Cable Car Station 1"] = {function() Mode_SpeakWithNPC("Cable Car Station 2","Do you want to be taken to the bottom",{1},10,7,10,6) end}

-- DIVE
DescMaps["Route 126_to_Route 126 Underwater"] = {function() Mode_Dive("Route 126", "Do you want to Dive here?", 15,71) end}
DescMaps["Route 126 Underwater_to_Route 126"] = {function() if getMapName() == "Route 126 Underwater" then moveToCell(15,71) end end}
DescMaps["Sootopolis City_to_Sootopolis City Underwater"] = {function() Mode_Dive("Sootopolis City", "Do you want to Dive here?", 50,91) end}
DescMaps["Sootopolis City Underwater_to_Sootopolis City"] = {function() Mode_Dive("Sootopolis City Underwater", "Do you want to go to the surface?", 17,11) end}

-- PC TO TRANSMAT
DescMaps["Pokecenter Verdanturf_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Verdanturf","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Sootopolis_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Sootopolis","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Slateport_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Slateport","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Rustboro City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Rustboro City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Petalburg City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Petalburg City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Pacifidlog Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Pacifidlog Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Oldale Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Oldale Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Mossdeep City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Mossdeep City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Mauville City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Mauville City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Lilycove City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Lilycove City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Lavaridge Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Lavaridge Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Fortree City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Fortree City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Fallarbor Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Fallarbor Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Ever Grande City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Ever Grande City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Dewford Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Dewford Town","Can you present to me your registered",{1},8,5,8,4) end}

--TRANSMAT TO PC
DescMaps["Transmat Station_to_Pokecenter Verdanturf"] = {function() Mode_Transmat("Pokecenter Verdanturf", {6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Sootopolis"] = {function() Mode_Transmat("Pokecenter Sootopolis", {6,6,4}) end}
DescMaps["Transmat Station_to_Pokecenter Slateport"] = {function() Mode_Transmat("Pokecenter Slateport", {5}) end}
DescMaps["Transmat Station_to_Pokecenter Rustboro City"] = {function() Mode_Transmat("Pokecenter Rustboro City", {3}) end}
DescMaps["Transmat Station_to_Pokecenter Petalburg City"] = {function() Mode_Transmat("Pokecenter Petalburg City", {2}) end}
DescMaps["Transmat Station_to_Pokecenter Pacifidlog Town"] = {function() Mode_Transmat("Pokecenter Pacifidlog Town", {6,6,6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Oldale Town"] = {function() Mode_Transmat("Pokecenter Oldale Town", {1}) end}
DescMaps["Transmat Station_to_Pokecenter Mossdeep City"] = {function() Mode_Transmat("Pokecenter Mossdeep City", {6,6,3}) end}
DescMaps["Transmat Station_to_Pokecenter Mauville City"] = {function() Mode_Transmat("Pokecenter Mauville City", {6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Lilycove City"] = {function() Mode_Transmat("Pokecenter Lilycove City", {6,6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Lavaridge Town"] = {function() Mode_Transmat("Pokecenter Lavaridge Town", {6,4}) end}
DescMaps["Transmat Station_to_Pokecenter Fortree City"] = {function() Mode_Transmat("Pokecenter Fortree City", {6,6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Fallarbor Town"] = {function() Mode_Transmat("Pokecenter Fallarbor Town", {6,3}) end}
DescMaps["Transmat Station_to_Pokecenter Ever Grande City"] = {function() Mode_Transmat("Pokecenter Ever Grande City", {6,6,6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Dewford Town"] = {function() Mode_Transmat("Pokecenter Dewford Town", {4}) end}

-- IN BETWEEN REGIONS --
-- BOAT PATHS  --
DescMaps["Olivine City_to_Lilycove City Harbor"] = {function() Mode_SpeakWithNPC("Olivine City","Where do you want to go, mate?",{2,1},17,46,17,47) end}
DescMaps["Vermilion City_to_Lilycove City Harbor"] = {function() Mode_SpeakWithNPC("Vermilion City","you want to go to Lilycove City?",{1},40,67,40,68) end}
DescMaps["Lilycove City Harbor_to_Olivine City"] = {function() Mode_SpeakWithNPC("Lilycove City Harbor","Where do you want to go?",{3,1},8,9,8,10) end}
DescMaps["Lilycove City Harbor_to_Vermilion City"] = {function() Mode_SpeakWithNPC("Lilycove City Harbor","Where do you want to go?",{2,1},8,9,8,10) end}


