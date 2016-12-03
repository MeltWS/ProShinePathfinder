return function()

local npcExce = {}

----------------------
------ KANTO ---------
----------------------

npcExce["Love Island Ferry"] = {
    ["Pokecenter Vermilion"] = {{7, 8}, "Yes", "Ahoy, there! Wanna sail to Vermilion?"}
}
npcExce["Love Island_B"] = {
    ["Private Resort"] = {{21, 24}, "Yes", "This stone seems to be radiating with unknown energy. Do you want to touch it?"}
}
npcExce["Indigo Plateau Center"] = {
    ["Player Bedroom Pallet"] = {{13, 23}, "Yes", "Do you want to use my Abra's powers and send you back home?"},
}
npcExce["Private Resort"] = {
    ["Love Island_B"] = {{23, 43}, "Yes", "This stone seems to be radiating with unknown energy. Do you want to touch it?"}
}
npcExce["Saffron City Station_A"] = {
    ["Saffron City Station_B"] = {{9, 9}, "Yes", "Would you like to take the train? It costs $5,000 to go to Goldenrod."}
}
npcExce["Saffron City Station_B"] = {
    ["Saffron City Station_A"] = {{9, 7}, "Yes", "Would you like to return to the lobby?"}
}
npcExce["Safari Stop"] = {
    ["Safari Entrance_A"] = {{7, 4}, "Yes", "It will also cost $5,000 per entry if you plan to enter the EV-hunting area, compared to the standard $5,000 cost. I will teleport you to the area that specializes in HP-, Special Attack- and Defense-EV Pokemon."},
    ["Safari Effort Wald 2_A"] = {{7, 4}, "I want to enter the EV-hunting area.", "It will also cost $5,000 per entry if you plan to enter the EV-hunting area, compared to the standard $5,000 cost. I will teleport you to the area that specializes in HP-, Special Attack- and Defense-EV Pokemon."}
}
npcExce["Safari Area 3"] = {
    ["Safari Exclusive"] = {{17, 34}, "Yes, let me pass", "Ah, I see you are a member, you can pass this point if you want."}
}
npcExce["Safari Exclusive"] = {
    ["Safari Area 3"] = {{21, 3}, "Yes please", "Do you wish to leave the safari?"}
}
npcExce["Safari Effort Wald 2_A"] = {
    ["Safari Stop"] = {{8, 28}, {"I'd like to leave the zones, actually."}, "Would you like to be transported to the zone for Speed-, Special Defense- and Attack-EV Pokemon?"},
    ["Safari Effort Wald 1"] = {{8, 28}, "Yes.", "Would you like to be transported to the zone for Speed-, Special Defense- and Attack-EV Pokemon?"}
}
npcExce["Safari Effort Wald 1"] = {
    ["Safari Stop"] = {{6, 21}, "I'd like to leave the zones, actually.", "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"},
    ["Safari Effort Wald 2_A"] = {{6, 21}, "Yes.", "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"}
}
npcExce["Vermilion City_B"] = {
    ["One Island Ferry"] = {{38, 60}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{38, 60}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{38, 60}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{38, 60}, "Four Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{38, 60}, "Five Island", "Ahoy there, Where would you like to sail?"},
}

----------------------
------ JOHTO ---------
----------------------

npcExce["Dock Island"] = {
    ["Olivine City"] = {{27, 10}, "Yes", "Hey there, wanna go back in Johto?"},
}
npcExce["Goldenrod City Station_A"] = {
    ["Goldenrod City Station_B"] = {{9, 9}, "Yes", "Would you like to take the train? It costs $5,000 to go to Saffron."}
}
npcExce["Goldenrod City Station_B"] = {
    ["Goldenrod City Station_A"] = {{9, 7}, "Yes", "Would you like to return to the Goldenrod lobby?"}
}
npcExce["Johto Safari Zone Lobby"] = {
    ["Johto Safari Entrance"] = {{21, 6}, "Yes", "Would you like to enter the safari zone for $5,000 today?"},
}

----------------------
------ HOENN ---------
----------------------

npcExce["Cable Car Station 1"] = {
    ["Cable Car Station 2"] = {{10, 6}, "Yes", "Do you want to be taken to the top of Mt. Chimney?"}
}
npcExce["Cable Car Station 2"] = {
    ["Cable Car Station 1"] = {{10, 6}, "Yes", "Do you want to be taken to the bottom of Mt. Chimney?"}
}
npcExce["Leev Town Port"] = {
    ["Lilycove City Harbor"] = {{9, 10}, "Yes", "Hey there, wanna go back to Hoenn?"}
}
npcExce["Moon_A"] = {
    ["Mossdeep City Space Center 2F"] = {{16, 48}, "Teleport back to Earth", "What should I ask Elgyem to do?"}
}
npcExce["Moon B1F_B"] = {
    ["Sootopolis City"] = {{60, 23}, "Yes", "Should I go back to Earth?"}
}
npcExce["Mossdeep City Space Center 2F"] = {
    ["Moon_A"] = {{15, 9}, "Yes", "So, want to go on the Moon for 15,000 Pokedollars? I'll include the oxygen needed for free."}
}
npcExce["Pokecenter Dewford Town"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Ever Grande City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Fallarbor Town"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Fortree City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Lavaridge Town"] = {
    ["Transmat Station"] = {{8, 3}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Lilycove City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Mauville City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Mossdeep City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Oldale Town"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Pacifidlog Town"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Petalburg City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Rustboro City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Slateport"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Sootopolis City"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Pokecenter Verdanturf"] = {
    ["Transmat Station"] = {{8, 4}, "Here you go.", "Can you present to me your registered trainer's ID for authenticatory purposes?"}
}
npcExce["Hoenn Safari Zone Lobby"] = {
    ["Hoenn Safari Zone Area 1"] = {{21, 6}, "Yes", "Would you like to enter the safari zone for $5,000 today?"}
}
npcExce["Rusturf Tunnel_C"] = {
    ["Haunted Site"] = {{26, 15}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 115_A"] = {
    ["Mineral Site_A"] = {{81, 78}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Fiery Path"] = {
    ["Feral Site_A"] = {{14, 32}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 103_C"] = {
    ["Glacial Site"] = {{55, 4}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 119A"] = {
    ["Natural Site"] = {{16, 68}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Route 111 Desert"] = {
    ["Historical Site"] = {{34, 21}, "Yes", "Hello my friend "..getAccountName()..", to help preserve this site we need to charge you in 2,500 Pokedollars, you agree to pay this fee and enter?"}
}
npcExce["Lavaridge Town"] = {
    ["Valley Of Steel Entrance"] = {{18, 34}, "Yes.", "So, would you like to go for 5.000 poke-dollars?"}
}
npcExce["Valley Of Steel Entrance"] = {
    ["Lavaridge Town"] = {{30, 2}, "Yes.", "Would you like to go back to Lavaridge Town?"}
}
npcExce["Dock Island"] = {
    ["Olivine City"] = {{27, 10}, "Yes", "Hey there, wanna go back in Johto?"}
}

----------------------
---- Sevii Islands ----
----------------------

--[[npcExce["One Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy There, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy There, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy There, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy There, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy There, Where would you like to sail?"},
}
npcExce["Two Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy There, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy There, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy There, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy There, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy There, Where would you like to sail?"},
}
npcExce["Three Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy there, Where would you like to sail?"},
}
npcExce["Four Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Five Island Ferry"] = {{7, 8}, "Five Island", "Ahoy there, Where would you like to sail?"},
}
npcExce["Five Island Ferry"] = {
    ["Vermilion City_A"] = {{7, 8}, "Vermilion City", "Ahoy there, Where would you like to sail?"},
    ["One Island Ferry"] = {{7, 8}, "One Island", "Ahoy there, Where would you like to sail?"},
    ["Two Island Ferry"] = {{7, 8}, "Two Island", "Ahoy there, Where would you like to sail?"},
    ["Three Island Ferry"] = {{7, 8}, "Three Island", "Ahoy there, Where would you like to sail?"},
    ["Four Island Ferry"] = {{7, 8}, "Four Island", "Ahoy there, Where would you like to sail?"},
}]]

----------------------
---- Trainers Valley ----
----------------------

npcExce["Trainers Valley Station Floor 2"] = {
    ["Saffron City Station Floor 2"] = {{14, 10}, "Saffron", "Where would you like to go?"},
	["Goldenrod City Station Floor 2"] = {{14, 10}, "Goldenrod", "Where would you like to go?"}
}

----------------------
---- INTER REGION ----
----------------------

npcExce["Goldenrod City Station Floor 2"] = {
    ["Saffron City Station Floor 2"] = {{14, 10}, {"Yes", "Saffron City"}, {"Are you sure you would like to board on the ride to Goldenrod City at this moment?", "Where do you want to go?"}},
    ["Trainers Valley Station Floor 2"] = {{14, 10}, "Trainers Valley", "Where do you want to go?"}
}
npcExce["Saffron City Station Floor 2"] = {
    ["Goldenrod City Station Floor 2"] = {{14, 10}, {"Yes", "Goldenrod City"}, {"Are you sure you would like to travel to Goldenrod City", "Where do you want to go?"}},
    ["Trainers Valley Station Floor 2"] = {{14, 10}, "Trainers Valley", "Where do you want to go?"}
}
npcExce["Olivine City"] = {
    ["Lilycove City Harbor"] = {{17, 47}, "Lilycove City", "Where do you want to go, mate?"},
    ["Dock Island"] = {{17, 47}, "Johto Exclusive Maps", "Where do you want to go, mate?"},
    ["Vulcan Island shore"] = {{19, 45}, "Yes", "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"}
}
npcExce["Vermilion City_A"] = {
    ["Lilycove City Harbor"] = {{40, 68}, "Yes", "The cost for a cruise to Lilycove City is $5,000. Are you sure you want to go to Lilycove City?"},
    ["Love Island Ferry"] = {{53, 62}, "Yes", "Hey there, young trainer. What do you know about looove? Yeah, you hear me, Love, Love, Love, Love! You want to find out more about love? Why don't you show me that you looove Kanto Pokemon? ........ Well, well, you do look like you loooooove Kanto Pokemon. What do you say? Want to sail with me to Love Island? But you need to share $5,000 of your looooove too."},
    ["Vulcan Island shore"] = {{62, 58}, "Yes", "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"}
}
npcExce["Lilycove City Harbor"] = {
    ["Leev Town"] = {{8, 10}, "Leev Town", "Where do you want to go?"},
    ["Vermilion City_A"] = {{8, 10}, "Vermilion City", "Where do you want to go?"},
    ["Olivine City"] = {{8, 10}, "Olivine City", "Where do you want to go?"},
    ["Leev Town Port"] = {{8, 10}, "Leev Town", "Where do you want to go?"},
    ["Vulcan Island shore"] = {{11, 8}, "Yes", "Happy summer Holiday! Do you want to sail with me to Vulcan Island?"}
}

----------------------
---- EVENT REGION ----
----------------------

npcExce["Vulcan Island shore"] = {
    ["Vermilion City_A"] = {{11, 47}, "Yes", "What's up? Do you want to go back to Vermilion City?"},
    ["Olivine City"] = {{11, 47}, "Yes", "What's up? Do you want to go back to Olivine City?"},
    ["Lilycove City Harbor"] = {{11, 47}, "Yes", "What's up? Do you want to go back to Lilycove?"}
}

-- npcExce[""] = {
--     [""] = {{}, , ""}
-- }
return npcExce
end