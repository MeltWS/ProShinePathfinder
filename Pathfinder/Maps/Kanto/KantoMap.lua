local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

local _ss = require (cpppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local K_SUBWAY = ss.K_SUBWAY

local KantoMap = {}

KantoMap["Berry Tower Kanto"] = {["Route 13_A"] = {1}}
KantoMap["Bike Road Stop"] = {["Route 18_A"] = {0.2, {["items"] = {"Bicycle"}}}, ["Route 18_B"] = {0.2}}
KantoMap["Bills House"] = {["Route 25"] = {1}}
KantoMap["Celadon City"] = {["Route 16_B"] = {1}, ["Celadon Mart 1"] = {1}, ["Pokecenter Celadon"] = {1}, ["Route 7"] = {1}}
KantoMap["Celadon City Subway"] = {["Lavender Town Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Pokecenter Celadon"] = {0.2}, ["Cerulean City Subway"] = {K_SUBWAY}}
KantoMap["Celadon Mart 1"] = {["Celadon Mart 2"] = {1}, ["Celadon City"] = {1}, ["Celadon Mart Elevator"] = {1}}
KantoMap["Celadon Mart 2"] = {["Celadon Mart 1"] = {1}, ["Celadon Mart Elevator"] = {1}, ["Celadon Mart 3"] = {1}}
KantoMap["Celadon Mart 3"] = {["Celadon Mart 2"] = {1}, ["Celadon Mart 4"] = {1}, ["Celadon Mart Elevator"] = {1}}
KantoMap["Celadon Mart 4"] = {["Celadon Mart 5"] = {1}, ["Celadon Mart Elevator"] = {1}, ["Celadon Mart 3"] = {1}}
KantoMap["Celadon Mart 5"] = {["Celadon Mart Elevator"] = {1}, ["Celadon Mart 4"] = {1}, ["Celadon Mart 6"] = {1}}
KantoMap["Celadon Mart 6"] = {["Celadon Mart 5"] = {1}}
KantoMap["Celadon Mart Elevator"] = {["Celadon Mart 2"] = {0.2}, ["Celadon Mart 1"] = {0.2}, ["Celadon Mart 4"] = {0.2}, ["Celadon Mart 3"] = {0.2}, ["Celadon Mart 5"] = {0.2}}
KantoMap["Cerulean City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Pokecenter Cerulean"] = {0.2}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}}
KantoMap["Cerulean City_A"] = {["Pokecenter Cerulean"] = {1}, ["Route 9"] = {1}, ["Route 5_B"] = {1}, ["Route 5_A"] = {1}, ["Route 24_B"] = {1}, ["Cerulean Pokemart"] = {1}, ["Route 4"] = {1}}
KantoMap["Cerulean City_B"] = {["Route 24_A"] = {1, {["abilities"] = {"surf"}}}, ["Route 4"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Cerulean Pokemart"] = {["Cerulean City_A"] = {1}}
KantoMap["Cinnabar Island"] = {["Cinnabar mansion 1_A"] = {1}, ["Cinnabar Lab"] = {1}, ["Pokecenter Cinnabar"] = {1}, ["Cinnabar Pokemart"] = {1}, ["Route 21"] = {1, {["abilities"] = {"surf"}}}, ["Route 20_A"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Cinnabar Lab"] = {["Cinnabar Island"] = {1}}
KantoMap["Cinnabar Pokemart"] = {["Cinnabar Island"] = {1}}
KantoMap["Cinnabar mansion 1_A"] = {["Cinnabar Island"] = {1}, ["Cinnabar mansion 2"] = {1}}
KantoMap["Cinnabar mansion 1_B"] = {["Cinnabar Island"] = {1}, ["Cinnabar mansion B1F_B"] = {1}}
KantoMap["Cinnabar mansion 2"] = {["Cinnabar mansion 1_A"] = {1}, ["Cinnabar mansion 3_B"] = {1}, ["Cinnabar mansion 3_A"] = {1}}
KantoMap["Cinnabar mansion 3_A"] = {["Cinnabar mansion 2"] = {1}}
KantoMap["Cinnabar mansion 3_B"] = {["Cinnabar mansion 2"] = {1}, ["Cinnabar mansion B1F_A"] = {1}}
KantoMap["Cinnabar mansion B1F_A"] = {["Cinnabar mansion B1F_B"] = {0--[[npc maybe]]}}
KantoMap["Cinnabar mansion B1F_B"] = {["Cinnabar mansion 1_B"] = {1}}
KantoMap["Digletts Cave"] = {["Digletts Cave Entrance 2"] = {3}, ["Digletts Cave Entrance 1"] = {3}}
KantoMap["Digletts Cave Entrance 1"] = {["Digletts Cave"] = {0.5}, ["Route 2_B"] = {0.5}}
KantoMap["Digletts Cave Entrance 2"] = {["Route 11"] = {0.5}, ["Digletts Cave"] = {0.5}}
KantoMap["Fisherman House - Vermilion"] = {["Vermilion City_A"] = {1}}
KantoMap["Fuchsia City"] = {["Safari Stop"] = {1}, ["Fuchsia City Stop House"] = {1}, ["Fuchsia House 1"] = {1}, ["Pokecenter Fuchsia"] = {1}, ["Route 15 Stop House"] = {1}, ["Route 18_B"] = {1}}
KantoMap["Fuchsia City Stop House"] = {["Route 19"] = {0.2}, ["Fuchsia City"] = {0.2}}
KantoMap["Fuchsia City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Pokecenter Fuchsia"] = {0.2}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
KantoMap["Fuchsia House 1"] = {["Fuchsia City"] = {1}}
KantoMap["Indigo Plateau"] = {["Indigo Plateau Center Johto"] = {1}, ["Indigo Plateau Center"] = {1}, ["Victory Road Kanto 3F_B"] = {1}}
KantoMap["Indigo Plateau Center"] = {["Indigo Plateau"] = {0.2}, ["Player Bedroom Pallet"] = {0.2}}
KantoMap["Indigo Plateau Center Johto"] = {["Indigo Plateau"] = {1}}
KantoMap["Item Maniac House"] = {["Route 25"] = {1}}
KantoMap["Lavender Town"] = {["Route 10_C"] = {1}, ["Route 12"] = {1}, ["Pokecenter Lavender"] = {1}, ["Pokemon Tower 1F"] = {1}, ["Route 8_A"] = {1}}
KantoMap["Lavender Town Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pokecenter Lavender"] = {0.2}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
KantoMap["Mt. Moon 1F"] = {["Mt. Moon B1F_A"] = {2}, ["Mt. Moon B1F_D"] = {2}, ["Route 3"] = {2}, ["Mt. Moon B1F_C"] = {2}}
KantoMap["Mt. Moon B1F_A"] = {["Mt. Moon B2F_C"] = {1}, ["Mt. Moon 1F"] = {1}}
KantoMap["Mt. Moon B1F_B"] = {["Mt. Moon B2F_A"] = {0.5}, ["Mt. Moon Exit"] = {0.5}}
KantoMap["Mt. Moon B1F_C"] = {["Mt. Moon B2F_B"] = {0.5}, ["Mt. Moon 1F"] = {0.5}}
KantoMap["Mt. Moon B1F_D"] = {["Mt. Moon 1F"] = {1}, ["Mt. Moon B2F_A"] = {1}}
KantoMap["Mt. Moon B2F_A"] = {["Mt. Moon B1F_D"] = {2}, ["Mt. Moon B1F_B"] = {2}}
KantoMap["Mt. Moon B2F_B"] = {["Mt. Moon B1F_C"] = {1}}
KantoMap["Mt. Moon B2F_C"] = {["Mt. Moon B1F_A"] = {1}}
KantoMap["Mt. Moon Exit"] = {["Route 4"] = {0.2}, ["Mt. Moon B1F_B"] = {0.2}}
KantoMap["Mt. Silver 1F_A"] = {["Mt. Silver Lower Mountainside"] = {1--[[, npc battle]]}, ["Mt. Silver Exterior"] = {1}}
KantoMap["Mt. Silver 1F_B"] = {["Mt. Silver 1F_C"] = {1, {["abilities"] = {"rock smash"}}--[[, npc battle]]}, ["Mt. Silver 2F_A"] = {1--[[, npc battle, npc battle]]}, ["Mt. Silver Lower Mountainside"] = {1}}
KantoMap["Mt. Silver 1F_C"] = {["Mt. Silver 1F_B"] = {1, {["abilities"] = {"rock smash"}}}, ["Mt. Silver Expert Belt"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Mt. Silver 1F_E"] = {["Mt. Silver Lower Mountainside"] = {1}}
KantoMap["Mt. Silver 2F_A"] = {["Mt. Silver 1F_B"] = {3}, ["Mt. Silver Upper Mountainside_A"] = {3--[[, "npc battle"}]]}}
KantoMap["Mt. Silver 2F_B"] = {["Mt. Silver Upper Mountainside_A"] = {1}}
KantoMap["Mt. Silver 2F_C"] = {["Mt. Silver Upper Mountainside_A"] = {1}, ["Mt. Silver Upper Mountainside_B"] = {1}}
KantoMap["Mt. Silver 2F_D"] = {["Mt. Silver Upper Mountainside_B"] = {1}}
KantoMap["Mt. Silver 3F"] = {["Mt. Silver Summit"] = {1}, ["Mt. Silver Upper Mountainside_B"] = {1}}
KantoMap["Mt. Silver Expert Belt"] = {["Mt. Silver 1F_C"] = {1}}
KantoMap["Mt. Silver Exterior"] = {["Route 28_B"] = {1}, ["Mt. Silver Pokecenter"] = {1}, ["Route 28_A"] = {1}, ["Mt. Silver 1F_A"] = {1}}
KantoMap["Mt. Silver Lower Mountainside"] = {["Mt. Silver 1F_A"] = {1}, ["Mt. Silver 1F_B"] = {1}, ["Mt. Silver 1F_E"] = {1}}
KantoMap["Mt. Silver Pokecenter"] = {["Mt. Silver Exterior"] = {1}}
KantoMap["Mt. Silver Summit"] = {["Mt. Silver 3F"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_A"] = {["Mt. Silver 2F_C"] = {1}, ["Mt. Silver 2F_A"] = {1}, ["Mt. Silver 2F_B"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_B"] = {["Mt. Silver 2F_C"] = {1}, ["Mt. Silver 3F"] = {1--[[npc talk]]}, ["Mt. Silver 2F_D"] = {1}}
KantoMap["New Bark Town"] = {["Route 27_A"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Pallet Town"] = {["Player House Pallet"] = {1}, ["Route 21"] = {1, {["abilities"] = {"surf"}}}, ["Route 1"] = {1}}
KantoMap["Pewter City"] = {["Pokecenter Pewter"] = {1}, ["Pewter Pokemart"] = {1}, ["Route 2_A"] = {1}, ["Route 3"] = {1}}
KantoMap["Pewter City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pokecenter Pewter"] = {0.2}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}}
KantoMap["Pewter Pokemart"] = {["Pewter City"] = {1}}
KantoMap["Player Bedroom Pallet"] = {["Player House Pallet"] = {1}}
KantoMap["Player House Pallet"] = {["Player Bedroom Pallet"] = {1}, ["Pallet Town"] = {1}}
KantoMap["Pokecenter Celadon"] = {["Celadon City"] = {1}, ["Celadon City Subway"] = {0.2}}
KantoMap["Pokecenter Cerulean"] = {["Cerulean City Subway"] = {0.2}, ["Cerulean City_B"] = {1}}
KantoMap["Pokecenter Cinnabar"] = {["Cinnabar Island"] = {1}}
KantoMap["Pokecenter Fuchsia"] = {["Fuchsia City Subway"] = {0.2}, ["Fuchsia City"] = {1}}
KantoMap["Pokecenter Lavender"] = {["Lavender Town"] = {1}, ["Lavender Town Subway"] = {0.2}}
KantoMap["Pokecenter Pewter"] = {["Pewter City"] = {1}, ["Pewter City Subway"] = {0.2}}
KantoMap["Pokecenter Route 10"] = {["Route 10_A"] = {1}}
KantoMap["Pokecenter Route 3"] = {["Route 3"] = {1}}
KantoMap["Pokecenter Saffron"] = {["Saffron City"] = {1}, ["Saffron City Subway"] = {0.2}}
KantoMap["Pokecenter Vermilion"] = {["Vermilion City_A"] = {1}, ["Vermilion City Subway"] = {0.2}}
KantoMap["Pokecenter Viridian"] = {["Viridian City Subway"] = {0.2}, ["Viridian City"] = {1}}
KantoMap["Pokemon League Reception Gate"] = {["Route 28_A"] = {1}, ["Route 26_A"] = {1}, ["Victory Road Kanto 1F"] = {1}, ["Route 22"] = {1}}
KantoMap["Pokemon Tower 1F"] = {["Lavender Town"] = {1}, ["Pokemon Tower 2F"] = {1}, ["Pokemon Tower B1"] = {1}}
KantoMap["Pokemon Tower 2F"] = {["Pokemon Tower 1F"] = {1}, ["Pokemon Tower 3F"] = {1}}
KantoMap["Pokemon Tower 3F"] = {["Pokemon Tower 4F"] = {1}, ["Pokemon Tower 2F"] = {1}}
KantoMap["Pokemon Tower 4F"] = {["Pokemon Tower 3F"] = {1}, ["Pokemon Tower 5F"] = {1}}
KantoMap["Pokemon Tower 5F"] = {["Pokemon Tower 6F"] = {1}, ["Pokemon Tower 4F"] = {1}}
KantoMap["Pokemon Tower 6F"] = {["Pokemon Tower 5F"] = {1}, ["Pokemon Tower 7F"] = {1}}
KantoMap["Pokemon Tower 7F"] = {["Pokemon Tower 6F"] = {1}}
KantoMap["Pokemon Tower B1"] = {["Pokemon Tower 1F"] = {1}, ["Pokemon Tower B2"] = {1}}
KantoMap["Pokemon Tower B10_A"] = {["Pokemon Tower B9_B"] = {1}, ["Pokemon Tower B9_A"] = {1}}
KantoMap["Pokemon Tower B10_B"] = {["Pokemon Tower B11"] = {1}}
KantoMap["Pokemon Tower B11"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B12"] = {1}}
KantoMap["Pokemon Tower B12"] = {["Pokemon Tower B13"] = {1}}
KantoMap["Pokemon Tower B13"] = {["Pokemon Tower B14"] = {1}}
KantoMap["Pokemon Tower B14"] = {["Pokemon Tower B15"] = {1}}
KantoMap["Pokemon Tower B15"] = {["Pokemon Tower B16"] = {1}}
KantoMap["Pokemon Tower B16"] = {["Pokemon Tower B17_A"] = {1}}
KantoMap["Pokemon Tower B17_A"] = {["Pokemon Tower B17_B"] = {1}}
KantoMap["Pokemon Tower B17_B"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B18"] = {1}}
KantoMap["Pokemon Tower B18"] = {["Pokemon Tower B19_A"] = {1}, ["Pokemon Tower B19_C"] = {1}, ["Pokemon Tower B19_B"] = {1}}
KantoMap["Pokemon Tower B19_A"] = {["Pokemon Tower B18"] = {1}}
KantoMap["Pokemon Tower B19_B"] = {["Pokemon Tower B20_A"] = {1}, ["Pokemon Tower B18"] = {1}, ["Pokemon Tower B20_B"] = {1}}
KantoMap["Pokemon Tower B19_C"] = {["Pokemon Tower B18"] = {1}}
KantoMap["Pokemon Tower B2"] = {["Pokemon Tower B3_A"] = {1}}
KantoMap["Pokemon Tower B20_A"] = {["Pokemon Tower B21"] = {1}}
KantoMap["Pokemon Tower B20_B"] = {["Pokemon Tower B19_B"] = {1}}
KantoMap["Pokemon Tower B21"] = {["Pokemon Tower B23"] = {1}}
KantoMap["Pokemon Tower B22"] = {["Pokemon Tower B24"] = {1}, ["Pokemon Tower B13"] = {1}}
KantoMap["Pokemon Tower B23"] = {["Pokemon Tower B22"] = {1}}
KantoMap["Pokemon Tower B24"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower B29"] = {1}}
KantoMap["Pokemon Tower B29"] = {["Pokemon Tower B1"] = {1}, ["Pokemon Tower Underground"] = {1}}
KantoMap["Pokemon Tower B3_A"] = {["Pokemon Tower B3_B"] = {0}}
KantoMap["Pokemon Tower B3_B"] = {["Pokemon Tower B3_C"] = {0}}
KantoMap["Pokemon Tower B3_C"] = {["Pokemon Tower B4"] = {0}}
KantoMap["Pokemon Tower B4"] = {["Pokemon Tower B6"] = {1}}
KantoMap["Pokemon Tower B6"] = {["Pokemon Tower B7"] = {1}}
KantoMap["Pokemon Tower B7"] = {["Pokemon Tower B8"] = {1}, ["Pokemon Tower B3_B"] = {1}}
KantoMap["Pokemon Tower B8"] = {["Pokemon Tower B9_A"] = {1}}
KantoMap["Pokemon Tower B9_A"] = {["Pokemon Tower B10_A"] = {1}}
KantoMap["Pokemon Tower B9_B"] = {["Pokemon Tower B10_B"] = {1}}
KantoMap["Pokemon Tower Underground"] = {["Pokemon Tower B29"] = {1}}
KantoMap["Power Plant"] = {["Route 10_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Rock Tunnel 1_A"] = {["Rock Tunnel 2_A"] = {0.5}, ["Route 10_A"] = {0.5}}
KantoMap["Rock Tunnel 1_B"] = {["Rock Tunnel 2_B"] = {1.2}, ["Rock Tunnel 2_A"] = {1.2}}
KantoMap["Rock Tunnel 1_C"] = {["Route 10_C"] = {1}, ["Rock Tunnel 2_B"] = {1}}
KantoMap["Rock Tunnel 2_A"] = {["Rock Tunnel 1_B"] = {1.5}, ["Rock Tunnel 1_A"] = {1.5}}
KantoMap["Rock Tunnel 2_B"] = {["Rock Tunnel 1_C"] = {1.5}, ["Rock Tunnel 1_B"] = {1.5}}
KantoMap["Route 1"] = {["Pallet Town"] = {1}, ["Route 1 Stop House"] = {1}}
KantoMap["Route 1 Stop House"] = {["Viridian City"] = {0.2}, ["Route 1"] = {0.2}}
KantoMap["Route 10_A"] = {["Route 9"] = {0.5}, ["Rock Tunnel 1_A"] = {0.5}, ["Route 10_C"] = {1, {["abilities"] = {"dig"}}}, ["Pokecenter Route 10"] = {0.5}}
KantoMap["Route 10_B"] = {["Route 9"] = {1}, ["Power Plant"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 10_C"] = {["Lavender Town"] = {1}, ["Route 10_A"] = {1, {["abilities"] = {"dig"}}}, ["Rock Tunnel 1_C"] = {1}}
KantoMap["Route 11"] = {["Route 2_B"] = {1, {["abilities"] = {"dig"}}}, ["Vermilion City_A"] = {1}, ["Digletts Cave Entrance 2"] = {1}, ["Route 11 Stop House"] = {1}}
KantoMap["Route 11 Stop House"] = {["Route 11"] = {0.2}, ["Route 12"] = {0.2}}
KantoMap["Route 12"] = {["Lavender Town"] = {2}, ["Route 13_A"] = {2}, ["Route 11 Stop House"] = {2}}
KantoMap["Route 13_A"] = {["Berry Tower Kanto"] = {1.5}, ["Route 13_B"] = {0}, ["Route 12"] = {1.5}, ["Route 14_A"] = {1.5}}
KantoMap["Route 13_B"] = {["Route 13_A"] = {0}}
KantoMap["Route 14_A"] = {["Route 13_A"] = {1}, ["Route 14_B"] = {0, {["abilities"] = {"cut"}}}, ["Route 15"] = {1}}
KantoMap["Route 14_B"] = {["Route 14_A"] = {0}}
KantoMap["Route 15"] = {["Route 15 Stop House"] = {1}, ["Route 14_A"] = {1}}
KantoMap["Route 15 Stop House"] = {["Route 15"] = {0.2}, ["Fuchsia City"] = {0.2}}
KantoMap["Route 16 Stop House"] = {["Route 16_B"] = {0.2}, ["Route 16_A"] = {0.2, {["items"] = {"Bicycle"}}}}
KantoMap["Route 16 house"] = {["Route 16_A"] = {1}}
KantoMap["Route 16_A"] = {["Route 16 Stop House"] = {1}, ["Route 16 house"] = {1}, ["Route 17"] = {1}}
KantoMap["Route 16_B"] = {["Route 16 Stop House"] = {0.5}}
KantoMap["Route 17"] = {["Route 18_A"] = {2}, ["Route 16_A"] = {2}}
KantoMap["Route 18_A"] = {["Route 17"] = {0.5}, ["Bike Road Stop"] = {0.5}}
KantoMap["Route 18_B"] = {["Fuchsia City"] = {0.5}, ["Bike Road Stop"] = {0.5}}
KantoMap["Route 19"] = {["Route 20_B"] = {1.5, {["abilities"] = {"surf"}}}, ["Fuchsia City Stop House"] = {1.5, {["abilities"] = {"surf"}}}}
KantoMap["Route 2 Stop"] = {["Viridian Forest"] = {0.2}, ["Route 2_C"] = {0.2}}
KantoMap["Route 2 Stop2"] = {["Route 2_A"] = {0.2}, ["Viridian Forest"] = {0.2}}
KantoMap["Route 2 Stop3"] = {["Route 2_B"] = {0.2}, ["Route 2_D"] = {0.2}}
KantoMap["Route 20_A"] = {["Seafoam 1F_A"] = {1, {["abilities"] = {"surf"}}, ["Cinnabar Island"] = {1.5, {["abilities"] = {"surf"}}}}}
KantoMap["Route 20_B"] = {["Seafoam 1F_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 21"] = {["Cinnabar Island"] = {1, {["abilities"] = {"surf"}}}, ["Pallet Town"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 22"] = {["Viridian City"] = {1}, ["Pokemon League Reception Gate"] = {1}}
KantoMap["Route 24_A"] = {["Route 25"] = {1}, ["Cerulean City_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 24_B"] = {["Route 25"] = {1}, ["Cerulean City_A"] = {1}}
KantoMap["Route 24_C"] = {["Route 25"] = {1}, ["Cerulean City_A"] = {1}}
KantoMap["Route 25"] = {["Route 24_A"] = {1}, ["Route 24_B"] = {1}, ["Item Maniac House"] = {1}, ["Bills House"] = {1}}
KantoMap["Route 26_A"] = {["Route 26_B"] = {0.7}, ["Route 27_B"] = {1.5}, ["Pokemon League Reception Gate"] = {1.5}}
KantoMap["Route 26_B"] = {["Route 27_B"] = {0.3}}
KantoMap["Route 27_A"] = {["New Bark Town"] = {1, {["abilities"] = {"surf"}}}, ["Tohjo Falls"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 27_B"] = {["Tohjo Falls"] = {1, {["abilities"] = {"surf"}}}, ["Route 26_A"] = {1.5, {["abilities"] = {"surf"}}}}
KantoMap["Route 28 House"] = {["Route 28_B"] = {1}}
KantoMap["Route 28_A"] = {["Pokemon League Reception Gate"] = {1}, ["Mt. Silver Exterior"] = {1}}
KantoMap["Route 28_B"] = {["Mt. Silver Exterior"] = {1}, ["Route 28_A"] = {0.2}, ["Route 28 House"] = {1}}
KantoMap["Route 2_A"] = {["Pewter City"] = {1}, ["Route 2 Stop2"] = {1}, ["Route 2_B"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_B"] = {["Route 11"] = {1, {["abilities"] = {"dig"}}}, ["Route 2_A"] = {0, {["abilities"] = {"cut"}}}, ["Route 2 Stop3"] = {1}}
KantoMap["Route 2_C"] = {["Viridian City"] = {1}, ["Route 2_D"] = {1, {["abilities"] = {"cut"}}}, ["Route 2 Stop"] = {1}}
KantoMap["Route 2_D"] = {["Route 2 Stop3"] = {1}, ["Route 2_C"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 3"] = {["Pewter City"] = {1}, ["Mt. Moon 1F"] = {1}, ["Pokecenter Route 3"] = {1}, ["Route 4"] = {1, {["abilities"] = {"dig"}}}}
KantoMap["Route 4"] = {["Route 3"] = {1, {["abilities"] = {"dig"}}}, ["Mt. Moon Exit"] = {1}, ["Cerulean City_B"] = {1, {["abilities"] = {"surf"}}}, ["Cerulean City_A"] = {1}}
KantoMap["Route 5 Stop House"] = {["Saffron City"] = {0.2, {["items"] = {"Marsh Badge"}}, {["items"] = {"Fresh Water"}}}, ["Route 5_B"] = {0.2}}
KantoMap["Route 5_A"] = {["Route 5_B"] = {0.2}}
KantoMap["Route 5_B"] = {["Cerulean City_A"] = {1}, ["Underground House 1"] = {1}, ["Route 5 Stop House"] = {1}}
KantoMap["Route 6"] = {["Vermilion City_A"] = {1}, ["Route 6 Stop House"] = {1}, ["Underground House 2"] = {1}}
KantoMap["Route 6 Stop House"] = {["Saffron City"] = {0.2, {["items"] = {"Marsh Badge"}}, {["items"] = {"Fresh Water"}}}, ["Route 6"] = {0.2}}
KantoMap["Route 7"] = {["Route 7 Stop House"] = {0.5}, ["Celadon City"] = {0.5}, ["Underground House 3"] = {0.5}}
KantoMap["Route 7 Stop House"] = {["Route 7"] = {0.2}, ["Saffron City"] = {0.2, {["items"] = {"Marsh Badge"}}, {["items"] = {"Fresh Water"}}}}
KantoMap["Route 8 Stop House"] = {["Route 8_A"] = {0.2}, ["Saffron City"] = {0.2, {["items"] = {"Marsh Badge"}}, {["items"] = {"Fresh Water"}}}}
KantoMap["Route 8_A"] = {["Lavender Town"] = {1}, ["Route 8_B"] = {1, {["abilities"] = {"cut"}}}, ["Route 8 Stop House"] = {1}, ["Underground House 4"] = {1}}
KantoMap["Route 8_B"] = {["Route 8_A"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 9"] = {["Route 10_B"] = {1}, ["Route 10_A"] = {1}, ["Cerulean City_A"] = {1}}
KantoMap["Safari Area 1"] = {["Safari Entrance_A"] = {1.5}, ["Safari Area 2_A"] = {1.5}}
KantoMap["Safari Area 2_A"] = {["Safari Area 3"] = {1}, ["Safari Area 2_B"] = {0, {["abilities"] = {"surf"}}}, ["Safari Area 1"] = {1}}
KantoMap["Safari Area 2_B"] = {["Safari Area 3"] = {1}, ["Safari Area 2_A"] = {0, {["abilities"] = {"surf"}}}}
KantoMap["Safari Area 3"] = {["Safari Area 2_A"] = {1}, ["Safari Exclusive"] = {1--[[MS]]}, ["Safari Entrance_B"] = {1}}
KantoMap["Safari Effort Wald 1"] = {["Safari Stop"] = {1}, ["Safari Effort Wald 2_A"] = {1}}
KantoMap["Safari Effort Wald 2_A"] = {["Safari Effort Wald 1"] = {1}, ["Safari Effort Wald 2_B"] = {0, {["abilities"] = {"surf"}}}, ["Safari Stop"] = {1}}
KantoMap["Safari Effort Wald 2_B"] = {["Safari Effort Wald 2_A"] = {0, {["abilities"] = {"surf"}}}}
KantoMap["Safari Entrance_A"] = {["Safari Stop"] = {1}, ["Safari Entrance_C"] = {0, {["abilities"] = {"surf"}}}, ["Safari Entrance_B"] = {0, {["abilities"] = {"surf"}}}, ["Safari Area 1"] = {1}}
KantoMap["Safari Entrance_B"] = {["Safari Area 3"] = {1}, ["Safari Entrance_A"] = {0, {["abilities"] = {"surf"}}}, ["Safari Entrance_C"] = {0, {["abilities"] = {"surf"}}}}
KantoMap["Safari Entrance_C"] = {["Safari Entrance_B"] = {0, {["abilities"] = {"surf"}}}, ["Safari Entrance_A"] = {0, {["abilities"] = {"surf"}}}}
KantoMap["Safari Exclusive"] = {["Safari Area 3"] = {1}}
KantoMap["Safari Stop"] = {["Fuchsia City"] = {1}, ["Safari Entrance_A"] = {1}, ["Safari Effort Wald 2_A"] = {1}}
KantoMap["Saffron City"] = {["Route 7 Stop House"] = {1}, ["Route 8 Stop House"] = {1}, ["Route 5 Stop House"] = {1}, ["Saffron Pokemart"] = {1}, ["Saffron City Station_A"] = {1}, ["Route 6 Stop House"] = {1}, ["Pokecenter Saffron"] = {1}}
KantoMap["Saffron City Station Floor 2"] = {["Saffron City Station_B"] = {0.5}}
KantoMap["Saffron City Station_A"] = {["Saffron City Station_B"] = {0.5}, ["Saffron City"] = {0.5}}
KantoMap["Saffron City Station_B"] = {["Saffron City Station Floor 2"] = {1}, ["Saffron City Station_A"] = {0.5}}
KantoMap["Saffron City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Pokecenter Saffron"] = {0.2}}
KantoMap["Saffron Pokemart"] = {["Saffron City"] = {1}}
KantoMap["Seafoam 1F_A"] = {["Seafoam B1F"] = {1}, ["Route 20_A"] = {1}}
KantoMap["Seafoam 1F_B"] = {["Route 20_B"] = {1}, ["Seafoam B1F"] = {1}}
KantoMap["Seafoam B1F"] = {["Seafoam B2F_A"] = {1}, ["Seafoam 1F_B"] = {1}, ["Seafoam B2F_B"] = {1}, ["Seafoam 1F_A"] = {1}, ["Seafoam B2F_D"] = {0.9}}
KantoMap["Seafoam B2F_A"] = {["Seafoam B3F_A"] = {0.5}, ["Seafoam B1F"] = {1}}
KantoMap["Seafoam B2F_B"] = {["Seafoam B2F_D"] = {0.5}, ["Seafoam B1F"] = {1}}
KantoMap["Seafoam B2F_C"] = {["Seafoam B3F_D"] = {1}, ["Seafoam B3F_C"] = {1}}
KantoMap["Seafoam B2F_D"] = {["Seafoam B3F_E"] = {1}, ["Seafoam B1F"] = {1}}
KantoMap["Seafoam B3F_A"] = {["Seafoam B2F_A"] = {0.3}, ["Seafoam B3F_B"] = {0.3, {["abilities"] = {"surf"}}}}
KantoMap["Seafoam B3F_B"] = {["Seafoam B3F_A"] = {0.7, {["abilities"] = {"surf"}}}, ["Seafoam B4F_A"] = {1}}
KantoMap["Seafoam B3F_C"] = {["Seafoam B2F_C"] = {0.2}, ["Seafoam B4F_A"] = {0.2}}
KantoMap["Seafoam B3F_D"] = {["Seafoam B4F_C"] = {0.5}, ["Seafoam B2F_C"] = {0.5}}
KantoMap["Seafoam B3F_E"] = {["Seafoam B4F_B"] = {1}, ["Seafoam B4F_D"] = {1}, ["Seafoam B4F_C"] = {1}, ["Seafoam B2F_D"] = {1}}
KantoMap["Seafoam B4F_A"] = {["Seafoam B3F_C"] = {2, {["abilities"] = {"surf"}}}, ["Seafoam B3F_B"] = {2, {["abilities"] = {"surf"}}}}
KantoMap["Seafoam B4F_B"] = {["Seafoam B3F_E"] = {1}}
KantoMap["Seafoam B4F_C"] = {["Seafoam B3F_D"] = {1.5, {["abilities"] = {"surf"}}}, ["Seafoam B3F_E"] = {1.5, {["abilities"] = {"surf"}}}}
KantoMap["Seafoam B4F_D"] = {["Seafoam B3F_E"] = {1}}
KantoMap["Tohjo Falls"] = {["Route 27_A"] = {1, {["abilities"] = {"surf"}}}, ["Route 27_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Underground House 1"] = {["Underground2"] = {0.2}, ["Route 5_B"] = {0.2}}
KantoMap["Underground House 2"] = {["Underground2"] = {0.2}, ["Route 6"] = {0.2}}
KantoMap["Underground House 3"] = {["Route 7"] = {0.2}, ["Underground1"] = {0.2}}
KantoMap["Underground House 4"] = {["Route 8_A"] = {0.2}, ["Underground1"] = {0.2}}
KantoMap["Underground1"] = {["Underground House 4"] = {1.5}, ["Underground House 3"] = {1.5}}
KantoMap["Underground2"] = {["Underground House 2"] = {0.9}, ["Underground House 1"] = {0.9}}
KantoMap["Vermilion City_A"] = {["Fisherman House - Vermilion"] = {1}, ["Vermilion City_B"] = {0, {["abilities"] = {"cut"}}, {["abilities"] = {"surf"}}}, ["Vermilion Pokemart"] = {1}, ["Route 11"] = {1}, ["Pokecenter Vermilion"] = {1}, ["Route 6"] = {1}}
KantoMap["Vermilion City_B"] = {["Vermilion City_A"] = {0, {["abilities"] = {"cut"}}, {["abilities"] = {"surf"}}}}
KantoMap["Vermilion City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Viridian City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Pokecenter Vermilion"] = {0.2}, ["Cerulean City Subway"] = {K_SUBWAY}}
KantoMap["Vermilion Pokemart"] = {["Vermilion City_A"] = {1}}
KantoMap["Victory Road Kanto 1F"] = {["Victory Road Kanto 2F_A"] = {3}, ["Pokemon League Reception Gate"] = {1.5}}
KantoMap["Victory Road Kanto 2F_A"] = {["Victory Road Kanto 3F_D"] = {1}, ["Victory Road Kanto 3F_A"] = {1}, ["Victory Road Kanto 1F"] = {1}}
KantoMap["Victory Road Kanto 2F_B"] = {["Victory Road Kanto 2F_C"] = {0.3}}
KantoMap["Victory Road Kanto 2F_C"] = {["Victory Road Kanto 3F_B"] = {0.3}}
KantoMap["Victory Road Kanto 2F_D"] = {["Victory Road Kanto 2F_A"] = {1}, ["Victory Road Kanto 3F_C"] = {1}}
KantoMap["Victory Road Kanto 3F_A"] = {["Victory Road Kanto 2F_A"] = {1}, ["Victory Road Kanto 3F_B"] = {0.3}}
KantoMap["Victory Road Kanto 3F_B"] = {["Victory Road Kanto 2F_A"] = {1}, ["Indigo Plateau"] = {1}, ["Victory Road Kanto 2F_C"] = {1}}
KantoMap["Victory Road Kanto 3F_C"] = {["Victory Road Kanto 2F_C"] = {1}, ["Victory Road Kanto 2F_D"] = {1}, ["Victory Road Kanto 2F_B"] = {1}}
KantoMap["Victory Road Kanto 3F_D"] = {["Victory Road Kanto 2F_A"] = {0.5}, ["Victory Road Kanto 2F_D"] = {0.5}}
KantoMap["Viridian City"] = {["Route 1 Stop House"] = {1}, ["Pokecenter Viridian"] = {1}, ["Viridian Pokemart"] = {1}, ["Route 2_C"] = {1}, ["Route 22"] = {1}}
KantoMap["Viridian City Subway"] = {["Celadon City Subway"] = {K_SUBWAY}, ["Cerulean City Subway"] = {K_SUBWAY}, ["Lavender Town Subway"] = {K_SUBWAY}, ["Pokecenter Viridian"] = {0.2}, ["Saffron City Subway"] = {K_SUBWAY}, ["Pewter City Subway"] = {K_SUBWAY}, ["Vermilion City Subway"] = {K_SUBWAY}, ["Fuchsia City Subway"] = {K_SUBWAY}}
KantoMap["Viridian Forest"] = {["Viridian Maze"] = {1}, ["Route 2 Stop"] = {2}, ["Route 2 Stop2"] = {2}}
KantoMap["Viridian Maze"] = {["Viridian Forest"] = {1}}
KantoMap["Viridian Pokemart"] = {["Viridian City"] = {1}}

-- KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return KantoMap
end
