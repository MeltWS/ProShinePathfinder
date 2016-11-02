-- local cpath = select(1, ...) or "" -- callee path
-- local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
-- local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
-- local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

-- local _ss = require (cppdpath .. "Settings/Static_Settings")

-- return function()

-- local ss = _ss()
-- local K_SUBWAY = ss.K_SUBWAY
local K_SUBWAY = "K_SUBWAY"

local KantoMap = {}

KantoMap["Route 2 Stop"] = {["Route 2_C"] = 0.2, ["Viridian Forest"] = 0.2}
KantoMap["Route 2 Stop2"] = {["Route 2_A"] = 0.2, ["Viridian Forest"] = 0.2}
KantoMap["Route 2 Stop3"] = {["Route 2_D"] = 0.2, ["Route 2_B"] = 0.2}
KantoMap["Viridian Forest"] = {["Route 2 Stop"] = 2, ["Route 2 Stop2"] = 2, ["Viridian Maze"] = 1}
KantoMap["Viridian Maze"] = {["Viridian Forest"] = 1}
KantoMap["Digletts Cave Entrance 1"] = {["Route 2_B"] = 0.5, ["Digletts Cave"] = 0.5}
KantoMap["Route 2_A"] = {["Pewter City"] = 1, ["Viridian Forest"] = 1, ["Route 2_B"] = 0--[[cut]]}
KantoMap["Route 2_B"] = {["Route 2_A"] = 0--[[cut]], ["Route 2 Stop3"] = 1, ["Route 11"] = 1--[[dig]]}
KantoMap["Route 2_C"] = {["Viridian City"] = 1, ["Route 2 Stop"] = 1, ["Route 2_D"] = 1--[[cut]]}
KantoMap["Route 2_D"] = {["Route 2_C"] = 0--[[cut]], ["Route 2 Stop3"] = 1}


KantoMap["Tohjo Falls"] = {["Route 27_A"] = 1--[[surf]], ["Route 27_B"] = 1--[[surf]]}
KantoMap["Route 27_A"] = {["New Bark Town"] = 1--[[surf]], ["Tohjo Falls"] = 1--[[surf]]}
KantoMap["Route 27_B"] = {["Route 26_A"] = 1.5--[[surf]], ["Tohjo Falls"] = 1--[[surf]]}

KantoMap["Pokecenter Route 3"] = {["Route 3"] = 1}
KantoMap["Route 3"] = {["Mt. Moon 1F"] = 1, ["Pewter City"] = 1, ["Pokecenter Route 3"] = 1, ["Route 4"] = 1--[[dig]]}
KantoMap["Route 4"] = {["Mt. Moon Exit"] = 1, ["Cerulean City_A"] = 1, ["Cerulean City_B"] = 1--[[surf]], ["Route 3"] = 1--[[dig]]}
KantoMap["Mt. Moon Exit"] = {["Mt. Moon B1F_B"] = 0.2, ["Route 4"] = 0.2}
KantoMap["Mt. Moon 1F"] = {["Mt. Moon B1F_A"] = 2, ["Mt. Moon B1F_C"] = 2, ["Mt. Moon B1F_D"] = 2, ["Route 3"] = 2}
KantoMap["Mt. Moon B1F_A"] = {["Mt. Moon 1F"] = 1, ["Mt. Moon B2F_C"] = 1}
KantoMap["Mt. Moon B1F_B"] = {["Mt. Moon Exit"] = 0.5, ["Mt. Moon B2F_A"] = 0.5}
KantoMap["Mt. Moon B1F_C"] = {["Mt. Moon 1F"] = 0.5, ["Mt. Moon B2F_B"] = 0.5}
KantoMap["Mt. Moon B1F_D"] = {["Mt. Moon B2F_A"] = 1, ["Mt. Moon 1F"] = 1}
KantoMap["Mt. Moon B2F_A"] = {["Mt. Moon B1F_B"] = 2, ["Mt. Moon B1F_D"] = 2}
KantoMap["Mt. Moon B2F_B"] = {["Mt. Moon B1F_C"] = 1}
KantoMap["Mt. Moon B2F_C"] = {["Mt. Moon B1F_A"] = 1}
KantoMap["Pokecenter Cerulean"] = {["Cerulean City_B"] = 1, ["Cerulean City Subway"] = 0.2}
KantoMap["Cerulean City_A"] = {["Route 4"] = 1, ["Pokecenter Cerulean"] = 1, ["Route 24_B"] = 1, ["Route 5_A"] = 1, ["Route 5_B"] = 1, ["Cerulean Pokemart"] = 1, ["Route 9"] = 1}
KantoMap["Cerulean City_B"] = {["Route 4"] = 1--[[surf]], ["Route 24_A"] = 1--[[surf]]}
KantoMap["Route 5_A"] = {["Route 5_B"] = 0.2} -- TODO add Daycare map
KantoMap["Route 5_B"] = {["Route 5 Stop House"] = 1, ["Underground House 1"] = 1, ["Cerulean City_A"] = 1}
KantoMap["Underground House 1"] = {["Route 5_B"] = 0.2, ["Underground2"] = 0.2}
KantoMap["Route 24_A"] = {["Cerulean City_B"] = 1--[[surf]], ["Route 25"] = 1}
KantoMap["Route 24_B"] = {["Cerulean City_A"] = 1, ["Route 25"] = 1}
KantoMap["Route 24_C"] = {["Cerulean City_A"] = 1, ["Route 25"] = 1}
KantoMap["Route 25"] = {["Route 24_A"] = 1, ["Route 24_B"] = 1, ["Bills House"] = 1, ["Item Maniac House"] = 1}
KantoMap["Bills House"] = {["Route 25"] = 1}
KantoMap["Item Maniac House"] = {["Route 25"] = 1}
KantoMap["Cerulean Pokemart"] = {["Cerulean City_A"] = 1}
KantoMap["Route 9"] = {["Route 10_A"] = 1, ["Route 10_B"] = 1, ["Cerulean City_A"] = 1}
KantoMap["Route 10_A"] = {["Route 9"] = 0.5, ["Pokecenter Route 10"] = 0.5, ["Rock Tunnel 1_A"] = 0.5, ["Route 10_C"] = 1--[[dig]]}
KantoMap["Route 10_B"] = {["Route 9"] = 1, ["Power Plant"] = 1--[[surf]]}
KantoMap["Route 10_C"] = {["Lavender Town"] = 1, ["Rock Tunnel 1_C"] = 1, ["Route 10_A"] = 1--[[dig]]}
KantoMap["Pokecenter Route 10"] = {["Route 10_A"] = 1}
KantoMap["Power Plant"] = {["Route 10_B"] = 1--[[surf]]}
KantoMap["Rock Tunnel 1_A"] = {["Route 10_A"] = 0.5, ["Rock Tunnel 2_A"] = 0.5}
KantoMap["Rock Tunnel 1_B"] = {["Rock Tunnel 2_A"] = 1.2, ["Rock Tunnel 2_B"] = 1.2}
KantoMap["Rock Tunnel 1_C"] = {["Route 10_C"] = 1, ["Rock Tunnel 2_B"] = 1}
KantoMap["Rock Tunnel 2_A"] = {["Rock Tunnel 1_A"] = 1.5, ["Rock Tunnel 1_B"] = 1.5}
KantoMap["Rock Tunnel 2_B"] = {["Rock Tunnel 1_B"] = 1.5, ["Rock Tunnel 1_C"] = 1.5}
KantoMap["Pokecenter Lavender"] = {["Lavender Town"] = 1, ["Lavender Town Subway"] = 0.2}
KantoMap["Lavender Town"] = {["Pokecenter Lavender"] = 1, ["Pokemon Tower 1F"] = 1, ["Route 10_C"] = 1, ["Route 12"] = 1, ["Route 8_A"] = 1}
KantoMap["Pokemon Tower 1F"] = {["Lavender Town"] = 1, ["Pokemon Tower 2F"] = 1, ["Pokemon Tower B1"] = 1}
KantoMap["Pokemon Tower 2F"] = {["Pokemon Tower 1F"] = 1, ["Pokemon Tower 3F"] = 1}
KantoMap["Pokemon Tower 3F"] = {["Pokemon Tower 2F"] = 1, ["Pokemon Tower 4F"] = 1}
KantoMap["Pokemon Tower 4F"] = {["Pokemon Tower 3F"] = 1, ["Pokemon Tower 5F"] = 1}
KantoMap["Pokemon Tower 5F"] = {["Pokemon Tower 4F"] = 1, ["Pokemon Tower 6F"] = 1}
KantoMap["Pokemon Tower 6F"] = {["Pokemon Tower 5F"] = 1, ["Pokemon Tower 7F"] = 1}
KantoMap["Pokemon Tower 7F"] = {["Pokemon Tower 6F"] = 1}
KantoMap["Pokemon Tower B1"] = {["Pokemon Tower 1F"] = 1, ["Pokemon Tower B2"] = 1}
KantoMap["Pokemon Tower B2"] = {["Pokemon Tower B3_A"] = 1}
KantoMap["Pokemon Tower B3_A"] = {["Pokemon Tower B3_B"] = 0}
KantoMap["Pokemon Tower B3_B"] = {["Pokemon Tower B3_C"] = 0}
KantoMap["Pokemon Tower B3_C"] = {["Pokemon Tower B4"] = 0}
KantoMap["Pokemon Tower B4"] = {["Pokemon Tower B6"] = 1}
KantoMap["Pokemon Tower B6"] = {["Pokemon Tower B7"] = 1}
KantoMap["Pokemon Tower B7"] = {["Pokemon Tower B3_B"] = 1, ["Pokemon Tower B8"] = 1}
KantoMap["Pokemon Tower B8"] = {["Pokemon Tower B9_A"] = 1}
KantoMap["Pokemon Tower B9_A"] = {["Pokemon Tower B10_A"] = 1}
KantoMap["Pokemon Tower B9_B"] = {["Pokemon Tower B10_B"] = 1}
KantoMap["Pokemon Tower B10_A"] = {["Pokemon Tower B9_B"] = 1, ["Pokemon Tower B9_A"] = 1}
KantoMap["Pokemon Tower B10_B"] = {["Pokemon Tower B11"] = 1}
KantoMap["Pokemon Tower B11"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B12"] = 1}
KantoMap["Pokemon Tower B12"] = {["Pokemon Tower B13"] = 1}
KantoMap["Pokemon Tower B13"] = {["Pokemon Tower B14"] = 1}
KantoMap["Pokemon Tower B14"] = {["Pokemon Tower B15"] = 1}
KantoMap["Pokemon Tower B15"] = {["Pokemon Tower B16"] = 1}
KantoMap["Pokemon Tower B16"] = {["Pokemon Tower B17_A"] = 1}
KantoMap["Pokemon Tower B17_A"] = {["Pokemon Tower B17_B"] = 1}
KantoMap["Pokemon Tower B17_B"] = {["Pokemon Tower B18"] = 1, ["Pokemon Tower B1"] = 1}
KantoMap["Pokemon Tower B18"] = {["Pokemon Tower B19_A"] = 1, ["Pokemon Tower B19_B"] = 1, ["Pokemon Tower B19_C"] = 1}
KantoMap["Pokemon Tower B19_A"] = {["Pokemon Tower B18"] = 1}
KantoMap["Pokemon Tower B19_B"] = {["Pokemon Tower B18"] = 1, ["Pokemon Tower B20_A"] = 1, ["Pokemon Tower B20_B"] = 1}
KantoMap["Pokemon Tower B19_C"] = {["Pokemon Tower B18"] = 1}
KantoMap["Pokemon Tower B20_A"] = {["Pokemon Tower B21"] = 1}
KantoMap["Pokemon Tower B20_B"] = {["Pokemon Tower B19_B"] = 1}
KantoMap["Pokemon Tower B21"] = {["Pokemon Tower B23"] = 1}
KantoMap["Pokemon Tower B22"] = {["Pokemon Tower B13"] = 1, ["Pokemon Tower B24"] = 1}
KantoMap["Pokemon Tower B23"] = {["Pokemon Tower B22"] = 1}
KantoMap["Pokemon Tower B24"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B29"] = 1}
KantoMap["Pokemon Tower B29"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower Underground"] = 1}
KantoMap["Pokemon Tower Underground"] = {["Pokemon Tower B29"] = 1}

KantoMap["Route 20_A"] = {["Seafoam 1F_A"] = 1--[[surf]], ["Cinnabar Island"] = 1.5--[[surf]]}
KantoMap["Route 20_B"] = {["Seafoam 1F_B"] = 1--[[surf]]}
KantoMap["Seafoam 1F_A"] = {["Route 20_A"] = 1, ["Seafoam B1F"] = 1}
KantoMap["Seafoam 1F_B"] = {["Route 20_B"] = 1, ["Seafoam B1F"] = 1}
KantoMap["Seafoam B1F"] = {["Seafoam 1F_A"] = 1, ["Seafoam 1F_B"] = 1, ["Seafoam B2F_A"] = 1, ["Seafoam B2F_D"] = 0.9, ["Seafoam B2F_B"] = 1}
KantoMap["Seafoam B2F_A"] = {["Seafoam B1F"] = 1, ["Seafoam B3F_A"] = 0.5}
KantoMap["Seafoam B2F_B"] = {["Seafoam B1F"] = 1, ["Seafoam B2F_D"] = 0.5}
KantoMap["Seafoam B2F_C"] = {["Seafoam B3F_C"] = 1, ["Seafoam B3F_D"] = 1}
KantoMap["Seafoam B2F_D"] = {["Seafoam B1F"] = 1, ["Seafoam B3F_E"] = 1}
KantoMap["Seafoam B3F_A"] = {["Seafoam B3F_B"] = 0.3--[[surf]], ["Seafoam B2F_A"] = 0.3}
KantoMap["Seafoam B3F_B"] = {["Seafoam B3F_A"] = 0.7--[[surf]], ["Seafoam B4F_A"] = 1}
KantoMap["Seafoam B3F_C"] = {["Seafoam B4F_A"] = 0.2, ["Seafoam B2F_C"] = 0.2}
KantoMap["Seafoam B3F_D"] = {["Seafoam B4F_C"] = 0.5, ["Seafoam B2F_C"] = 0.5}
KantoMap["Seafoam B3F_E"] = {["Seafoam B4F_C"] = 1, ["Seafoam B4F_D"] = 1, ["Seafoam B2F_D"] = 1, ["Seafoam B4F_B"] = 1}
KantoMap["Seafoam B4F_A"] = {["Seafoam B3F_B"] = 2 --[[surf]], ["Seafoam B3F_C"] = 2 --[[surf]]}
KantoMap["Seafoam B4F_C"] = {["Seafoam B3F_D"] = 1.5 --[[surf]], ["Seafoam B3F_E"] = 1.5 --[[surf]]}
KantoMap["Seafoam B4F_D"] = {["Seafoam B3F_E"] = 1}
KantoMap["Seafoam B4F_B"] = {["Seafoam B3F_E"] = 1}

KantoMap["Route 16 Stop House"] = {["Route 16_A"] = 0.2, ["Route 16_B"] = 0.2}
KantoMap["Route 16 house"] = {["Route 16_A"] = 1}
KantoMap["Route 16_A"] = {["Route 16 house"] = 1, ["Route 16 Stop House"] = 1, ["Route 17"] = 1}
KantoMap["Route 16_B"] = {["Route 16 Stop House"] = 0.5}
KantoMap["Route 17"] = {["Route 18_A"] = 2, ["Route 16_A"] = 2}
KantoMap["Route 18_A"] = {["Bike Road Stop"] = 0.5, ["Route 17"] = 0.5}
KantoMap["Route 18_B"] = {["Bike Road Stop"] = 0.5, ["Fuchsia City"] = 0.5}
KantoMap["Bike Road Stop"] = {["Route 18_A"] = 0.2, ["Route 18_B"] = 0.2}

KantoMap["Player Bedroom Pallet"] = {["Player House Pallet"] = 1}
KantoMap["Player House Pallet"] = {["Player Bedroom Pallet"] = 1, ["Pallet Town"] = 1}
KantoMap["Pallet Town"] = {["Route 1"] = 1, ["Route 21"] = 1, ["Player House Pallet"] = 1}

KantoMap["Route 28_A"] = {["Mt. Silver Exterior"] = 1, ["Pokemon League Reception Gate"] = 1}
KantoMap["Route 28_B"] = {["Route 28_A"] = 0.2, ["Route 28 House"] = 1, ["Mt. Silver Exterior"] = 1}
KantoMap["Route 28 House"] = {["Route 28_B"] = 1}
KantoMap["Mt. Silver Exterior"] = {["Route 28_A"] = 1, ["Route 28_B"] = 1, ["Mt. Silver Pokecenter"] = 1, ["Mt. Silver 1F_A"] = 1}
KantoMap["Mt. Silver Pokecenter"] = {["Mt. Silver Exterior"] = 1}

KantoMap["Mt. Silver 1F_A"] = {["Mt. Silver Exterior"] = 1, ["Mt. Silver Lower Mountainside"] = 1--[[npc battle]]}
KantoMap["Mt. Silver 1F_B"] = {["Mt. Silver Lower Mountainside"] = 1, ["Mt. Silver 1F_C"] = 1--[[rock smash, battle]] , ["Mt. Silver 2F_A"] = 1--[[battle, battle]]}
KantoMap["Mt. Silver 1F_C"] = {["Mt. Silver 1F_B"] = 1--[[rock smash]], ["Mt. Silver Expert Belt"] = 1--[[surf]]}
KantoMap["Mt. Silver 1F_E"] = {["Mt. Silver Lower Mountainside"] = 1}

KantoMap["Mt. Silver 2F_A"] = {["Mt. Silver 1F_B"] = 3, ["Mt. Silver Upper Mountainside_A"] = 3--[[battle]]}
KantoMap["Mt. Silver 2F_B"] = {["Mt. Silver Upper Mountainside_A"] = 1}
KantoMap["Mt. Silver 2F_C"] = {["Mt. Silver Upper Mountainside_A"] = 1, ["Mt. Silver Upper Mountainside_B"] = 1}
KantoMap["Mt. Silver 2F_D"] = {["Mt. Silver Upper Mountainside_B"] = 1}

KantoMap["Mt. Silver Upper Mountainside_A"] = {["Mt. Silver 2F_A"] = 1, ["Mt. Silver 2F_B"] = 1, ["Mt. Silver 2F_C"] = 1}
KantoMap["Mt. Silver Upper Mountainside_B"] = {["Mt. Silver 2F_C"] = 1, ["Mt. Silver 2F_D"] = 1, ["Mt. Silver 3F"] = 1--[[npc maybe]]}

KantoMap["Mt. Silver Expert Belt"] = {["Mt. Silver 1F_C"] = 1}
KantoMap["Mt. Silver Lower Mountainside"] = {["Mt. Silver 1F_A"] = 1, ["Mt. Silver 1F_E"] = 1, ["Mt. Silver 1F_B"] = 1}
KantoMap["Mt. Silver 3F"] = {["Mt. Silver Upper Mountainside_B"] = 1, ["Mt. Silver Summit"] = 1}
KantoMap["Mt. Silver Summit"] = {["Mt. Silver 3F"] = 1}

KantoMap["Victory Road Kanto 1F"] = {["Pokemon League Reception Gate"] = 1.5, ["Victory Road Kanto 2F_A"] = 3}
KantoMap["Victory Road Kanto 2F_A"] = {["Victory Road Kanto 3F_A"] = 1, ["Victory Road Kanto 1F"] = 1, ["Victory Road Kanto 3F_D"] = 1}
KantoMap["Victory Road Kanto 2F_B"] = {["Victory Road Kanto 2F_C"] = 0.3}
KantoMap["Victory Road Kanto 2F_C"] = {["Victory Road Kanto 3F_B"] = 0.3}
KantoMap["Victory Road Kanto 2F_D"] = {["Victory Road Kanto 2F_A"] = 1, ["Victory Road Kanto 3F_C"] = 1}
KantoMap["Victory Road Kanto 3F_A"] = {["Victory Road Kanto 2F_A"] = 1, ["Victory Road Kanto 3F_B"] = 0.3}
KantoMap["Victory Road Kanto 3F_B"] = {["Victory Road Kanto 2F_A"] = 1, ["Victory Road Kanto 2F_C"] = 1, ["Indigo Plateau"] = 1}
KantoMap["Victory Road Kanto 3F_C"] = {["Victory Road Kanto 2F_D"] = 1, ["Victory Road Kanto 2F_B"] = 1, ["Victory Road Kanto 2F_C"] = 1}
KantoMap["Victory Road Kanto 3F_D"] = {["Victory Road Kanto 2F_A"] = 0.5, ["Victory Road Kanto 2F_D"] = 0.5}
KantoMap["Indigo Plateau"] = {["Indigo Plateau Center"] = 1, ["Indigo Plateau Center Johto"] = 1, ["Victory Road Kanto 3F_B"] = 1}
KantoMap["Indigo Plateau Center"] = {["Indigo Plateau"] = 0.2, ["Player Bedroom Pallet"] = 0.2}
KantoMap["Indigo Plateau Center Johto"] = {["Indigo Plateau"] = 1}

KantoMap["Route 1"] = {["Pallet Town"] = 1, ["Route 1 Stop House"] = 1}
KantoMap["Route 1 Stop House"] = {["Route 1"] = 0.2, ["Viridian City"] = 0.2}
KantoMap["Viridian City"] = {["Pokecenter Viridian"] = 1, ["Route 1 Stop House"] = 1, ["Route 2_C"] = 1, ["Route 22"] = 1, ["Viridian Pokemart"] = 1}
KantoMap["Pokecenter Viridian"] = {["Viridian City"] = 1, ["Viridian City Subway"] = 0.2}
KantoMap["Route 22"] = {["Pokemon League Reception Gate"] = 1, ["Viridian City"] = 1}
KantoMap["Viridian Pokemart"] = {["Viridian City"] = 1}
KantoMap["Pokemon League Reception Gate"] = {["Victory Road Kanto 1F"] = 1, ["Route 28_A"] = 1, ["Route 22"] = 1, ["Route 26_A"] = 1}
KantoMap["Route 26_A"] = {["Route 26_B"] = 0.7, ["Route 27_B"] = 1.5, ["Pokemon League Reception Gate"] = 1.5}
KantoMap["Route 26_B"] = {["Route 27_B"] = 0.3}
KantoMap["New Bark Town"] = {["Route 27_A"] = 1}
KantoMap["Pewter City"] = {["Pewter Pokemart"] = 1, ["Route 2_A"] = 1, ["Route 3"] = 1, ["Pokecenter Pewter"] = 1}
KantoMap["Pewter Pokemart"] = {["Pewter City"] = 1}
KantoMap["Pokecenter Pewter"] = {["Pewter City"] = 1, ["Pewter City Subway"] = 0.2}


KantoMap["Saffron City"] = {["Pokecenter Saffron"] = 1, ["Route 5 Stop House"] = 1, ["Route 6 Stop House"] = 1, ["Route 7 Stop House"] = 1, ["Route 8 Stop House"] = 1, ["Saffron City Station_A"] = 1, ["Saffron Pokemart"] = 1}
KantoMap["Saffron Pokemart"] = {["Saffron City"] = 1}
KantoMap["Pokecenter Saffron"] = {["Saffron City"] = 1, ["Saffron City Subway"] = 0.2}
KantoMap["Saffron City Station_B"] = {["Saffron City Station_A"] = 0.5, ["Saffron City Station Floor 2"] = 1}
KantoMap["Saffron City Station_A"] = {["Saffron City Station_B"] = 0.5--[[5K]], ["Saffron City"] = 0.5}
KantoMap["Saffron City Station Floor 2"] = {["Saffron City Station_B"] = 0.5}

KantoMap["Route 5 Stop House"] = {["Route 5_B"] = 0.2, ["Saffron City"] = 0.2--[[npc check + badge]]}
KantoMap["Route 6 Stop House"] = {["Route 6"] = 0.2, ["Saffron City"] = 0.2--[[npc check + badge]]}
KantoMap["Route 7 Stop House"] = {["Route 7"] = 0.2, ["Saffron City"] = 0.2--[[npc check + badge]]}
KantoMap["Route 8 Stop House"] = {["Route 8_A"] = 0.2, ["Saffron City"] = 0.2--[[npc check + badge]]}
KantoMap["Route 8_A"] = {["Lavender Town"] = 1, ["Route 8 Stop House"] = 1, ["Underground House 4"] = 1, ["Route 8_B"] = 1--[[cut]]}
KantoMap["Route 8_B"] = {["Route 8_A"] = 1--[[cut]]}
KantoMap["Underground House 4"] = {["Route 8_A"] = 0.2, ["Underground1"] = 0.2}
KantoMap["Underground1"] = {["Underground House 4"] = 1.5, ["Underground House 3"] = 1.5}
KantoMap["Underground House 3"] = {["Route 7"] = 0.2, ["Underground1"] = 0.2}
KantoMap["Route 7"] = {["Celadon City"] = 0.5, ["Route 7 Stop House"] = 0.5, ["Underground House 3"] = 0.5}
KantoMap["Route 6"] = {["Route 6 Stop House"] = 1, ["Underground House 2"] = 1, ["Vermilion City"] = 1}
KantoMap["Underground House 2"] = {["Route 6"] = 0.2, ["Underground2"] = 0.2}
KantoMap["Underground2"] = {["Underground House 2"] = 0.9, ["Underground House 1"] = 0.9}

KantoMap["Pokecenter Celadon"] = {["Celadon City"] = 1, ["Celadon City Subway"] = 0.2}
KantoMap["Celadon City"] = {["Pokecenter Celadon"] = 1, ["Celadon Mart 1"] = 1, ["Route 16_B"] = 1, ["Route 7"] = 1}
KantoMap["Celadon Mart 1"] = {["Celadon City"] = 1, ["Celadon Mart 2"] = 1, ["Celadon Mart Elevator"] = 1}
KantoMap["Celadon Mart 2"] = {["Celadon Mart 1"] = 1, ["Celadon Mart 3"] = 1, ["Celadon Mart Elevator"] = 1}
KantoMap["Celadon Mart 3"] = {["Celadon Mart 2"] = 1, ["Celadon Mart 4"] = 1, ["Celadon Mart Elevator"] = 1}
KantoMap["Celadon Mart 4"] = {["Celadon Mart 3"] = 1, ["Celadon Mart 5"] = 1, ["Celadon Mart Elevator"] = 1}
KantoMap["Celadon Mart 5"] = {["Celadon Mart 4"] = 1, ["Celadon Mart 6"] = 1, ["Celadon Mart Elevator"] = 1}
KantoMap["Celadon Mart 6"] = {["Celadon Mart 5"] = 1}
KantoMap["Celadon Mart Elevator"] = {["Celadon Mart 1"] = 0.2, ["Celadon Mart 2"] = 0.2, ["Celadon Mart 3"] = 0.2, ["Celadon Mart 4"] = 0.2, ["Celadon Mart 5"] = 0.2}

KantoMap["Fuchsia City"] = {["Fuchsia City Stop House"] = 1, ["Pokecenter Fuchsia"] = 1, ["Route 15 Stop House"] = 1, ["Route 18_B"] = 1, ["Safari Stop"] = 1, ["Fuchsia House 1"] = 1}
KantoMap["Fuchsia City Stop House"] = {["Fuchsia City"] = 0.2, ["Route 19"] = 0.2}
KantoMap["Fuchsia House 1"] = {["Fuchsia City"] = 1}
KantoMap["Pokecenter Fuchsia"] = {["Fuchsia City"] = 1, ["Fuchsia City Subway"] = 0.2}
KantoMap["Route 15 Stop House"] = {["Fuchsia City"] = 0.2, ["Route 15"] = 0.2}

KantoMap["Safari Stop"] = {["Fuchsia City"] = 1, ["Safari Effort Wald 2_A"] = 1--[[5k]], ["Safari Entrance_A"] = 1--[[5k]]}
KantoMap["Safari Area 1"] = {["Safari Area 2_A"] = 1.5, ["Safari Entrance_A"] = 1.5}
KantoMap["Safari Area 2_A"] = {["Safari Area 1"] = 1, ["Safari Area 3"] = 1, ["Safari Area 2_B"] = 0--[[surf]]}
KantoMap["Safari Area 2_B"] = {["Safari Area 3"] = 1, ["Safari Area 2_A"] = 0--[[surf]]}
KantoMap["Safari Area 3"] = {["Safari Area 2_A"] = 1, ["Safari Entrance_B"] = 1, ["Safari Exclusive"] = 1--[[MS]]}
KantoMap["Safari Entrance_A"] = {["Safari Area 1"] = 1, ["Safari Stop"] = 1, ["Safari Entrance_B"] = 0--[[surf]], ["Safari Entrance_C"] = 0--[[surf]]}
KantoMap["Safari Entrance_B"] = {["Safari Area 3"] = 1, ["Safari Entrance_A"] = 0--[[surf]], ["Safari Entrance_C"] = 0--[[surf]]}
KantoMap["Safari Entrance_C"] = {["Safari Entrance_A"] = 0--[[surf]], ["Safari Entrance_B"] = 0--[[surf]]}
KantoMap["Safari Exclusive"] = {["Safari Area 3"] = 1}

KantoMap["Safari Effort Wald 2_A"] = {["Safari Effort Wald 1"] = 1, ["Safari Stop"] = 1, ["Safari Effort Wald 2_B"] = 0 --[[surf]]}
KantoMap["Safari Effort Wald 2_B"] = {["Safari Effort Wald 2_A"] = 0--[[surf]]}
KantoMap["Safari Effort Wald 1"] = {["Safari Effort Wald 2_A"] = 1, ["Safari Stop"] = 1}

KantoMap["Route 19"] = {["Fuchsia City Stop House"] = 1--[[surf]], ["Route 20_B"] = 1.5--[[surf]]}
KantoMap["Cinnabar Island"] = {["Cinnabar Lab"] = 1, ["Cinnabar mansion 1_A"] = 1, ["Pokecenter Cinnabar"] = 1, ["Cinnabar Pokemart"] = 1, ["Route 20_A"] = 1, ["Route 21"] = 1}
KantoMap["Cinnabar Lab"] = {["Cinnabar Island"] = 1}
KantoMap["Cinnabar mansion 1_A"] = {["Cinnabar Island"] = 1, ["Cinnabar mansion 2"] = 1}
KantoMap["Cinnabar mansion 1_B"] = {["Cinnabar Island"] = 1, ["Cinnabar mansion B1F_B"] = 1}
KantoMap["Cinnabar mansion 2"] = {["Cinnabar mansion 1_A"] = 1, ["Cinnabar mansion 3_A"] = 1, ["Cinnabar mansion 3_B"] = 1}
KantoMap["Cinnabar mansion 3_A"] = {["Cinnabar mansion 2"] = 1}
KantoMap["Cinnabar mansion 3_B"] = {["Cinnabar mansion 2"] = 1, ["Cinnabar mansion B1F_A"] = 1}
KantoMap["Cinnabar mansion B1F_A"] = {["Cinnabar mansion B1F_B"] = 0--[[npc maybe]]}
KantoMap["Cinnabar mansion B1F_B"] = {["Cinnabar mansion 1_B"] = 1}
KantoMap["Pokecenter Cinnabar"] = {["Cinnabar Island"] = 1}
KantoMap["Cinnabar Pokemart"] = {["Cinnabar Island"] = 1}
KantoMap["Route 21"] = {["Cinnabar Island"] = 1--[[surf]], ["Pallet Town"] = 1--[[surf]]}

KantoMap["Route 12"] = {["Lavender Town"] = 2, ["Route 13_A"] = 2, ["Route 11 Stop House"] = 2}
KantoMap["Route 13_A"] = {["Berry Tower Kanto"] = 1.5, ["Route 12"] = 1.5, ["Route 14_A"] = 1.5, ["Route 13_B"] = 0--[[cut]]}
KantoMap["Route 13_B"] = {["Route 13_A"] = 0}
KantoMap["Berry Tower Kanto"] = {["Route 13_A"] = 1}
KantoMap["Route 14_A"] = {["Route 13_A"] = 1, ["Route 15"] = 1, ["Route 14_B"] = 0--[[cut]]}
KantoMap["Route 14_B"] = {["Route 14_A"] = 0}
KantoMap["Route 15"] = {["Route 14_A"] = 1, ["Route 15 Stop House"] = 1}

KantoMap["Digletts Cave Entrance 2"] = {["Digletts Cave"] = 0.5, ["Route 11"] = 0.5}
KantoMap["Route 11"] = {["Digletts Cave Entrance 2"] = 1, ["Route 11 Stop House"] = 1, ["Vermilion City"] = 1, ["Route 2_B"] = 1--[[dig]]}
KantoMap["Route 11 Stop House"] = {["Route 11"] = 0.2, ["Route 12"] = 0.2}
KantoMap["Digletts Cave"] = {["Digletts Cave Entrance 1"] = 3, ["Digletts Cave Entrance 2"] = 3}
KantoMap["Vermilion City"] = {["Pokecenter Vermilion"] = 1, ["Route 11"] = 1, ["Route 6"] = 1, ["Vermilion Pokemart"] = 1, ["Fisherman House - Vermilion"] = 1}
KantoMap["Vermilion Pokemart"] = {["Vermilion City"] = 1}
KantoMap["Pokecenter Vermilion"] = {["Vermilion City"] = 1, ["Vermilion City Subway"] = 0.2}
KantoMap["Fisherman House - Vermilion"] = {["Vermilion City"] = 1}

--[[gold]]
KantoMap["Pewter City Subway"] = {["Pokecenter Pewter"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Celadon City Subway"] = {["Pokecenter Celadon"] = 0.2, ["Pewter City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Fuchsia City Subway"] = {["Pokecenter Fuchsia"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Saffron City Subway"] = {["Pokecenter Saffron"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Viridian City Subway"] = {["Pokecenter Viridian"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Cerulean City Subway"] = {["Pokecenter Cerulean"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Vermilion City Subway"] = {["Pokecenter Vermilion"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Lavender Town Subway"] = {["Pokecenter Lavender"] = 0.2, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY}

-- KantoMap["test run"] = {}

-- KantoMap[""] = {[""] = 1}

return KantoMap
-- end
