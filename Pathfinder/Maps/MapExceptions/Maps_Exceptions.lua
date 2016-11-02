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

-- DIG PATH EXCEPTION EDIT
local function enableDigPath()
    -- Johto
    DescMaps["Route 42_to_Mahogany Town"] = {function() if playerInRectangle(1,14,18,26) then Mode_SpeakWithNPC("Route 42","Do you want to attempt to use it?",{1,Lib.getPokemonNumberWithMove("Dig", 155)},15,14,15,13) else moveToMap("Mahogany Town") end end} -- enabling digway route 42 from left to right side
    DescMaps["Route 42_to_Ecruteak Stop House 2"] = {function() if playerInRectangle(66,14,95,21) then Mode_SpeakWithNPC("Route 42","Do you want to attempt to use it?",{1,Lib.getPokemonNumberWithMove("Dig", 155)},77,14,77,13) else moveToMap("Ecruteak Stop House 2") end end} -- enabling digway route 42 from right to left side
end

local function disableDigPath()
    -- Johto
    DescMaps["Route 42_to_Mahogany Town"] = {function() Mode_MoveToCell("Route 42", 3,14,18,26,17,13) end, function() Mode_MoveToCell("Route 42", 19,0,95,28,95,17) end}
    DescMaps["Route 42_to_Ecruteak Stop House 2"] = nil

end



-- KANTO --

-- TABLE- PATHEDIT FORCE

-- TRAIN STATION TO JOHTO
DescMaps["Saffron City Station Floor 2_to_Goldenrod City Station Floor 2"] = {function() Mode_SpeakWithNPC("Saffron City Station Floor 2","Where do you want to go?",{1},14,11,14,10) end}

-- JOHTO --

-- TABLE- PATHEDIT FORCE
-- ExceRouteEdit[""] = {{""},{""}}
-- MOVE TO CELL --
--ROUTE 42 to Ecruteak or Mahogany.
DescMaps["Mt. Mortar 1F_to_Mahogany Town"] = {function() Mode_MoveToCell("Mt. Mortar 1F", 56,36,67,45,65,46) end, function() Mode_MoveToCell("Mt. Mortar 1F", 53,36,56,36,65,46) end, function() Mode_MoveToCell("Mt. Mortar 1F", 21,35,31,45,34,35) end, function() Mode_MoveToCell("Mt. Mortar 1F", 32,36,34,36,34,35) end, function() if isSurfing() then Mode_MoveToCell("Mt. Mortar 1F", 33,32,54,48,43,49) else Mode_MoveToCell("Mt. Mortar 1F", 40,42,45,48,43,49) end end}
DescMaps["Mt. Mortar Lower Cave_to_Mahogany Town"] = {function() Mode_MoveToCell("Mt. Mortar Lower Cave", 10,0,66,57,47,57) end}

--Route 47 to Cliff Edge Gate or Route 48 or Cliff Cave B1F
DescMaps["Route 47_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,89,74) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,89,74) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,89,74) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,89,74) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,66,70,68,69,65) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,69,65) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,69,65) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,69,65) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,69,65) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Route 47_to_Route 48"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,68,71) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,68,71) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,68,71) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,68,71) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,66,70,68,33,0) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,33,0) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,33,0) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,33,0) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,33,0) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Route 47_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,68,71) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,68,71) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,68,71) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,68,71) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,68,70,68,69,65) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,69,65) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,69,65) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,69,65) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,69,65) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Cliff Cave 1F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,17,18) end}
DescMaps["Cliff Cave 1F_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,21,15) end}
DescMaps["Cliff Cave 1F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,14,13) end}
DescMaps["Cliff Cave 2F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,18,22) end}
DescMaps["Cliff Cave 2F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,13,13) end}
DescMaps["Cliff Cave 2F_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,13,13) end}
DescMaps["Cliff Cave B1F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave B1F", 12,12,17,20,15,13) end}
DescMaps["Cliff Cave B1F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave B1F", 12,12,17,20,15,13) end}

--Route 43
DescMaps["Route 43_to_Lake of Rage"] = {function() Mode_MoveToCell("Route 43", 0,0,40,63,21,0) end}

--Union Cave
DescMaps["Union Cave 1F_to_Union Cave B1F"] = {function() Mode_MoveToCell("Union Cave 1F", 18,30,44,83,19,31) end, function() Mode_MoveToCell("Union Cave 1F", 18,15,24,17,23,16) end}
DescMaps["Union Cave 1F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave 1F", 18,30,44,83,19,31) end, function() Mode_MoveToCell("Union Cave 1F", 18,15,24,17,19,18) end}
DescMaps["Union Cave B1F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave B1F", 15,15,44,49,16,24) end}
DescMaps["Union Cave B1F_to_Union Cave 1F"] = {function() Mode_MoveToCell("Union Cave B1F", 15,15,44,49,43,48) end}
DescMaps["Union Cave B2F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave B2F", 18,20,28,29,18,20) end}

--Ice Path
DescMaps["Ice Path 1F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path 1F", 50,21,58,45,57,46) end, function() Mode_MoveToCell("Ice Path 1F", 10,15,49,61,57,15) end, function() Mode_MoveToCell("Ice Path 1F", 51,13,58,20,57,15) end}
DescMaps["Ice Path 1F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path 1F", 50,21,58,45,57,28) end, function() Mode_MoveToCell("Ice Path 1F", 10,15,49,61,12,62) end, function() Mode_MoveToCell("Ice Path 1F", 51,13,58,20,12,62) end}
DescMaps["Ice Path B1F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B1F", 13,12,40,29,21,25) end, function() Mode_MoveToCell("Ice Path B1F", 17,41,41,50,18,44) end}
DescMaps["Ice Path B1F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B1F", 13,12,40,29,16,28) end, function() Mode_MoveToCell("Ice Path B1F", 17,41,41,50,40,42) end}
DescMaps["Ice Path B2F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B2F", 12,13,35,30,23,22) end, function() Mode_MoveToCell("Ice Path B2F", 49,9,65,30,50,27) end}
DescMaps["Ice Path B2F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B2F", 12,13,35,30,33,17) end, function() Mode_MoveToCell("Ice Path B2F", 49,9,65,30,57,11) end}
DescMaps["Ice Path B3F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B3F", 11,8,34,19,32,17) end}
DescMaps["Ice Path B3F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B3F", 11,8,34,19,13,16) end}

-- SPEAK WITH NPC --
-- DIGWAYS
DescMaps["Route 31_to_Route 45"] = {function() Mode_DigWay("Route 31", 53,11,53,10) end}
DescMaps["Route 45_to_Route 31"] = {function() Mode_DigWay("Route 45", 14,6,14,5) end}
DescMaps["Route 32_to_Route 33"] = {function() Mode_DigWay("Route 32", 11,143,10,143) end}
DescMaps["Route 33_to_Route 32"] = {function() Mode_DigWay("Route 33", 14,14,14,13) end}
DescMaps["Blackthorn City_to_Route 44"] = {function() Mode_DigWay("Blackthorn City", 49,17,49,16) end}
DescMaps["Route 44_to_Blackthorn City"] = {function() Mode_DigWay("Route 44", 73,10,73,9) end}

-- TRAIN STATION TO KANTO
DescMaps["Goldenrod City Station_to_Goldenrod City"] = {function() if playerInRectangle(0,0,13,7) then Mode_SpeakWithNPC("Goldenrod City Station","Would you like to return",{1},9,6,9,7) else moveToMap("Goldenrod City") end end}
DescMaps["Goldenrod City Station_to_Goldenrod City Station Floor 2"] = {function() if playerInRectangle(0,0,13,7) then moveToMap("Goldenrod City Station Floor 2") else Mode_SpeakWithNPC("Goldenrod City Station","Would you like to take the train?",{1},9,10,9,9) end end}
DescMaps["Goldenrod City Station Floor 2_to_Saffron City Station Floor 2"] = {function() Mode_SpeakWithNPC("Goldenrod City Station Floor 2","Where do you want to go?",{1},14,11,14,10) end}


-- DescMaps["Safari Effort Wald 1_to_Safari Stop"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 1","Hello. How may I help you?",{3,1},6,22,6,21) end}

-- HOENN --

-- TABLE-- PATHEDIT FORCE
ExceRouteEdit["23"] = {{"Petalburg Woods", "Route 104", "Rustboro City"},{"Petalburg Woods", "Rustboro City"}}
ExceRouteEdit["24"] = {{"Petalburg Woods", "Route 104", "Petalburg City"},{"Petalburg Woods", "Petalburg City"}}
ExceRouteEdit["25"] = {{"Petalburg Woods", "Route 104", "Route 105"},{"Petalburg Woods", "Route 105"}}
-- ExceRouteEdit[""] = {{""},{""}}

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

--DescMaps[" "] = {function() Mode_MoveToCell(" ", ,,,,,) end}
--DescMaps[" "] = {function() Mode_SpeakWithNPC("","",{},,,,) end}

return {
    ExceRouteEdit = ExceRouteEdit,
    DescMaps = DescMaps2,
    SetPathSolution = SetPathSolution,
    enableDigPath = enableDigPath,
    disableDigPath = disableDigPath,
    SolvSubExce = SolvSubExce,
    SolveDialog = SolveDialog
}
