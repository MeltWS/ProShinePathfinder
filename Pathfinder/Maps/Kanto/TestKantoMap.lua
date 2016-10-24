return function()

local KantoMap = {}

-- KantoMap["Pewter City"] = {["Route 2_A"] = 1} -- links
-- KantoMap["Route 2 Stop"] = {["Route 2_C"] = 0.2, ["Viridian Forest"] = 0.2}
-- KantoMap["Route 2 Stop2"] = {["Route 2_A"] = 0.2, ["Viridian Forest"] = 0.2}
-- KantoMap["Route 2 Stop3"] = {["Route 2_D"] = 0.2, ["Route 2_B"] = 0.2}
-- KantoMap["Viridian City"] = {["Route 2_C"] = 1} -- links
-- KantoMap["Viridian Forest"] = {["Route 2 Stop"] = 2, ["Route 2 Stop2"] = 2, ["Viridian Maze"] = 1}
-- KantoMap["Viridian Maze"] = {["Viridian Forest"] = 1}
-- KantoMap["Digletts Cave Entrance 1"] = {["Route 2_B"] = 1} -- links
-- KantoMap["Route 2_A"] = {["Pewter City"] = 1, ["Viridian Forest"] = 1, ["Route 2_B"] = 0}
-- KantoMap["Route 2_B"] = {["Route 2_A"] = 0, ["Route 2 Stop3"] = 1}
-- KantoMap["Route 2_C"] = {["Viridian City"] = 1, ["Route 2 Stop"] = 1, ["Route 2_D"] = 1}
-- KantoMap["Route 2_D"] = {["Route 2_C"] = 0, ["Route 2 Stop3"] = 1}


-- KantoMap["New Bark Town"] = {["Route 27_A"] = 1} -- links
-- KantoMap["Tohjo Falls"] = {["Route 27_A"] = 1, ["Route 27_B"] = 1}
-- KantoMap["Route 26"] = {["Route 27_B"] = 1} -- links
-- KantoMap["Route 27_A"] = {["New Bark Town"] = 1, ["Tohjo Falls"] = 1}
-- KantoMap["Route 27_B"] = {["Route 26"] = 1.5, ["Tohjo Falls"] = 1}

KantoMap["Route 3"] = {["Mt. Moon 1F"] = 1--[[, ["Pewter City"] = 1, ["Pokecenter Route 3"] = 1]]}
KantoMap["Route 4"] = {["Mt. Moon Exit"] = 1, ["Cerulean City_A"] = 1, ["Cerulean City_B"] = 1}
KantoMap["Mt. Moon Exit"] = {["Mt. Moon B1F_B"] = 0.2, ["Route 4"] = 0.2}
KantoMap["Mt. Moon 1F"] = {["Mt. Moon B1F_A"] = 2, ["Mt. Moon B1F_C"] = 2, ["Mt. Moon B1F_D"] = 2, ["Route 3"] = 2}
KantoMap["Mt. Moon B1F_A"] = {["Mt. Moon 1F"] = 1, ["Mt. Moon B2F_C"] = 1}
KantoMap["Mt. Moon B1F_B"] = {["Mt. Moon Exit"] = 0.5, ["Mt. Moon B2F_A"] = 0.5}
KantoMap["Mt. Moon B1F_C"] = {["Mt. Moon 1F"] = 0.5, ["Mt. Moon B2F_B"] = 0.5}
KantoMap["Mt. Moon B1F_D"] = {["Mt. Moon B2F_A"] = 1, ["Mt. Moon 1F"] = 1}
KantoMap["Mt. Moon B2F_A"] = {["Mt. Moon B1F_B"] = 2, ["Mt. Moon B1F_D"] = 2}
KantoMap["Mt. Moon B2F_B"] = {["Mt. Moon B1F_C"] = 1}
KantoMap["Mt. Moon B2F_C"] = {["Mt. Moon B1F_A"] = 1}
-- KantoMap["Pokecenter Cerulean"] = {["Cerulean City_B"] = 1, --[[["Cerulean City Subway"] = 1]]}
-- KantoMap["Cerulean City_A"] = {["Route 4"] = 1, ["Pokecenter Cerulean"] = 1, ["Route 24_B"] = 1, ["Route 5_A"] = 1, ["Route 5_B"] = 1, ["Cerulean Pokemart"] = 1, ["Route 9"] = 1}
-- KantoMap["Cerulean City_B"] = {["Route 4"] = 1, ["Route 24_A"] = 1}
-- KantoMap["Route 5_A"] = {["Route 5_B"] = 0.2} -- TODO add Daycare map
-- KantoMap["Route 5_B"] = {["Route 5 Stop House"] = 1, ["Underground House 1"] = 1, ["Cerulean City_A"] = 1}
-- KantoMap["Route 5 Stop House"] = {["Route 5_B"] = 0.2}
-- KantoMap["Underground House 1"] = {["Route 5_B"] = 1}
-- KantoMap["Route 24_A"] = {["Cerulean City_B"] = 1, ["Route 25"] = 1}
-- KantoMap["Route 24_B"] = {["Cerulean City_A"] = 1, ["Route 25"] = 1}
-- KantoMap["Route 24_C"] = {["Cerulean City_A"] = 1, ["Route 25"] = 1}
-- KantoMap["Route 25"] = {["Route 24_A"] = 1, ["Route 24_B"] = 1, ["Bills House"] = 1, ["Item Maniac House"] = 1}
-- KantoMap["Bills House"] = {["Route 25"] = 1}
-- KantoMap["Item Maniac House"] = {["Route 25"] = 1}
-- KantoMap["Cerulean Pokemart"] = {["Cerulean City_A"] = 1}
-- KantoMap["Route 9"] = {["Route 10_A"] = 1, ["Route 10_B"] = 1, ["Cerulean City_A"] = 1}
-- KantoMap["Route 10_A"] = {["Route 9"] = 0.5, ["Pokecenter Route 10"] = 0.5, ["Rock Tunnel 1_A"] = 0.5}
-- KantoMap["Route 10_B"] = {["Route 9"] = 1, ["Power Plant"] = 1}
-- KantoMap["Route 10_C"] = {["Lavender Town"] = 1, ["Rock Tunnel 1_C"] = 1}
-- KantoMap["Pokecenter Route 10"] = {["Route 10_A"] = 1}
-- KantoMap["Power Plant"] = {["Route 10_B"] = 1}
-- KantoMap["Rock Tunnel 1_A"] = {["Route 10_A"] = 0.5, ["Rock Tunnel 2_A"] = 0.5}
-- KantoMap["Rock Tunnel 1_B"] = {["Rock Tunnel 2_A"] = 1.2, ["Rock Tunnel 2_B"] = 1.2}
-- KantoMap["Rock Tunnel 1_C"] = {["Route 10_C"] = 1, ["Rock Tunnel 2_B"] = 1}
-- KantoMap["Rock Tunnel 2_A"] = {["Rock Tunnel 1_A"] = 1.5, ["Rock Tunnel 1_B"] = 1.5}
-- KantoMap["Rock Tunnel 2_B"] = {["Rock Tunnel 1_B"] = 1.5, ["Rock Tunnel 1_C"] = 1.5}
-- KantoMap["Pokecenter Lavender"] = {["Lavender Town"] = 1--[[, ["Lavender Town Subway"] = 1]]}
-- KantoMap["Lavender Town"] = {["Pokecenter Lavender"] = 1, ["Pokemon Tower 1F"] = 1, ["Route 10_C"] = 1--[[, ["Route 12"] = 1]]--[[, ["Route 8"] = 1]]}
-- KantoMap["Pokemon Tower 1F"] = {["Lavender Town"] = 1, ["Pokemon Tower 2F"] = 1, ["Pokemon Tower B1"] = 1}
-- KantoMap["Pokemon Tower 2F"] = {["Pokemon Tower 1F"] = 1, ["Pokemon Tower 3F"] = 1}
-- KantoMap["Pokemon Tower 3F"] = {["Pokemon Tower 2F"] = 1, ["Pokemon Tower 4F"] = 1}
-- KantoMap["Pokemon Tower 4F"] = {["Pokemon Tower 3F"] = 1, ["Pokemon Tower 5F"] = 1}
-- KantoMap["Pokemon Tower 5F"] = {["Pokemon Tower 4F"] = 1, ["Pokemon Tower 6F"] = 1}
-- KantoMap["Pokemon Tower 6F"] = {["Pokemon Tower 5F"] = 1, ["Pokemon Tower 7F"] = 1}
-- KantoMap["Pokemon Tower 7F"] = {["Pokemon Tower 6F"] = 1}
-- KantoMap["Pokemon Tower B1"] = {["Pokemon Tower 1F"] = 1, ["Pokemon Tower B2"] = 1}
-- KantoMap["Pokemon Tower B2"] = {["Pokemon Tower B3_A"] = 1}
-- KantoMap["Pokemon Tower B3_A"] = {["Pokemon Tower B3_B"] = 0}
-- KantoMap["Pokemon Tower B3_B"] = {["Pokemon Tower B3_C"] = 0}
-- KantoMap["Pokemon Tower B3_C"] = {["Pokemon Tower B4"] = 0}
-- KantoMap["Pokemon Tower B4"] = {["Pokemon Tower B6"] = 1}
-- KantoMap["Pokemon Tower B6"] = {["Pokemon Tower B7"] = 1}
-- KantoMap["Pokemon Tower B7"] = {["Pokemon Tower B3_B"] = 1, ["Pokemon Tower B8"] = 1}
-- KantoMap["Pokemon Tower B8"] = {["Pokemon Tower B9_A"] = 1}
-- KantoMap["Pokemon Tower B9_A"] = {["Pokemon Tower B10_A"] = 1}
-- KantoMap["Pokemon Tower B9_B"] = {["Pokemon Tower B10_B"] = 1}
-- KantoMap["Pokemon Tower B10_A"] = {["Pokemon Tower B9_B"] = 1, ["Pokemon Tower B9_A"] = 1}
-- KantoMap["Pokemon Tower B10_B"] = {["Pokemon Tower B11"] = 1}
-- KantoMap["Pokemon Tower B11"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B12"] = 1}
-- KantoMap["Pokemon Tower B12"] = {["Pokemon Tower B13"] = 1}
-- KantoMap["Pokemon Tower B13"] = {["Pokemon Tower B14"] = 1}
-- KantoMap["Pokemon Tower B14"] = {["Pokemon Tower B15"] = 1}
-- KantoMap["Pokemon Tower B15"] = {["Pokemon Tower B16"] = 1}
-- KantoMap["Pokemon Tower B16"] = {["Pokemon Tower B17_A"] = 1}
-- KantoMap["Pokemon Tower B17_A"] = {["Pokemon Tower B17_B"] = 1}
-- KantoMap["Pokemon Tower B17_B"] = {["Pokemon Tower B18"] = 1, ["Pokemon Tower B1"] = 1}
-- KantoMap["Pokemon Tower B18"] = {["Pokemon Tower B19_A"] = 1, ["Pokemon Tower B19_B"] = 1, ["Pokemon Tower B19_C"] = 1}
-- KantoMap["Pokemon Tower B19_A"] = {["Pokemon Tower B18"] = 1}
-- KantoMap["Pokemon Tower B19_B"] = {["Pokemon Tower B18"] = 1, ["Pokemon Tower B20_A"] = 1, ["Pokemon Tower B20_B"] = 1}
-- KantoMap["Pokemon Tower B19_C"] = {["Pokemon Tower B18"] = 1}
-- KantoMap["Pokemon Tower B20_A"] = {["Pokemon Tower B21"] = 1}
-- KantoMap["Pokemon Tower B20_B"] = {["Pokemon Tower B19_B"] = 1}
-- KantoMap["Pokemon Tower B21"] = {["Pokemon Tower B23"] = 1}
-- KantoMap["Pokemon Tower B22"] = {["Pokemon Tower B13"] = 1, ["Pokemon Tower B24"] = 1}
-- KantoMap["Pokemon Tower B23"] = {["Pokemon Tower B22"] = 1}
-- KantoMap["Pokemon Tower B24"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B29"] = 1}
-- KantoMap["Pokemon Tower B29"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower Underground"] = 1}
-- KantoMap["Pokemon Tower Underground"] = {["Pokemon Tower B29"] = 1}

KantoMap["Route 20_A"] = {["Seafoam 1F_A"] = 1}
KantoMap["Route 20_B"] = {["Seafoam 1F_B"] = 1}
KantoMap["Seafoam 1F_A"] = {["Route 20_A"] = 1}
KantoMap["Seafoam 1F_B"] = {["Route 20_B"] = 1}

-- KantoMap[""] = {[""] = 1}


return KantoMap
end
