local npcExce = {}

----------------------
------ KANTO ---------
----------------------

npcExce["Indigo Plateau Center"] = {
    ["Player Bedroom Pallet"] = {{13, 23}, {"Yes"}, "Do you want to use my Abra's powers and send you back home?"},
}
npcExce["Saffron City Station_A"] = {
    ["Saffron City Station_B"] = {{9, 9}, {"Yes"}, "Would you like to take the train? It costs $5,000 to go to Goldenrod."}
}
npcExce["Saffron City Station_B"] = {
    ["Saffron City Station_A"] = {{9, 7}, {"Yes"}, "Would you like to return to the lobby?"}
}
npcExce["Safari Stop"] = {
    ["Safari Entrance_A"] = {{7, 4}, {"Yes"}, "It will also cost $5,000 per entry if you plan to enter the EV-hunting area, compared to the standard $5,000 cost. I will teleport you to the area that specializes in HP-, Special Attack- and Defense-EV Pokemon."},
    ["Safari Effort Wald 2_A"] = {{7, 4}, {"I want to enter the EV-hunting area."}, "It will also cost $5,000 per entry if you plan to enter the EV-hunting area, compared to the standard $5,000 cost. I will teleport you to the area that specializes in HP-, Special Attack- and Defense-EV Pokemon."}
}
npcExce["Safari Area 3"] = {
    ["Safari Exclusive"] = {{17, 34}, {"Yes, let me pass"}, "Ah, I see you are a member, you can pass this point if you want."}
}
npcExce["Safari Exclusive"] = {
    ["Safari Area 3"] = {{21, 3}, {"Yes please"}, "Do you wish to leave the safari?"}
}
npcExce["Safari Effort Wald 2_A"] = {
    ["Safari Stop"] = {{8, 28}, {"I'd like to leave the zones, actually."}, "Would you like to be transported to the zone for Speed-, Special Defense- and Attack-EV Pokemon?"},
    ["Safari Effort Wald 1"] = {{8, 28}, {"Yes."}, "Would you like to be transported to the zone for Speed-, Special Defense- and Attack-EV Pokemon?"}
}
npcExce["Safari Effort Wald 1"] = {
    ["Safari Stop"] = {{6, 21}, {"I'd like to leave the zones, actually."}, "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"},
    ["Safari Effort Wald 2_A"] = {{6, 21}, {"Yes."}, "Would you like to be transported to the zone for HP-, Special Attack- and Defense-EV Pokemon?"}
}

----------------------
------ JOHTO ---------
----------------------

npcExce["Goldenrod City Station_A"] = {
    ["Goldenrod City Station_B"] = {{9, 9}, {"Yes"}, "Would you like to take the train? It costs $5,000 to go to Saffron."}
}
npcExce["Goldenrod City Station_B"] = {
    ["Goldenrod City Station_A"] = {{9, 7}, {"Yes"}, "Would you like to return to the Goldenrod lobby?"}
}

----------------------
---- INTER REGION ----
----------------------
npcExce["Goldenrod City Station Floor 2"] = {
    ["Saffron City Floor 2"] = {{14, 10}, {"Yes"}, "Are you sure you would like to board on the ride to Goldenrod City at this moment?"}
}
npcExce["Saffron City Station Floor 2"] = {
    ["Goldenrod City Floor 2"] = {{14, 10}, {"Yes"}, "Are you sure you would like to travel to Goldenrod City"}
}
-- npcExce[""] = {
--     [""] = {{}, {}, ""}
-- }
return npcExce 