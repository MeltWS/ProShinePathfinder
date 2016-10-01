local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local ss = require (cppdpath .. "Settings/static_Settings")
local K_SUBWAY = ss.K_SUBWAY

local KantoMap = {}

KantoMap["Berry Tower Kanto"] = {["Route 13"] = 1}
KantoMap["Bike Road Stop"] = {["Route 18"] = 1}
KantoMap["Celadon City"] = {["Pokecenter Celadon"] = 1, ["Route 16"] = 1, ["Route 7"] = 1}
KantoMap["Cerulean City"] = {["Pokecenter Cerulean"] = 1, ["Route 24"] = 1, ["Route 4"] = 1, ["Route 5"] = 1, ["Route 9"] = 1}
KantoMap["Cinnabar Island"] = {["Cinnabar Lab"] = 1, ["Cinnabar mansion 1"] = 1, ["Pokecenter Cinnabar"] = 1, ["Route 20"] = 1, ["Route 21"] = 1}
KantoMap["Cinnabar Lab"] = {["Cinnabar Island"] = 1}
KantoMap["Cinnabar mansion 1"] = {["Cinnabar Island"] = 1, ["Cinnabar mansion 2"] = 1}
KantoMap["Cinnabar mansion 2"] = {["Cinnabar mansion 1"] = 1, ["Cinnabar mansion 3"] = 1}
KantoMap["Cinnabar mansion 3"] = {["Cinnabar mansion 2"] = 1}
KantoMap["Digletts Cave"] = {["Digletts Cave Entrance 1"] = 1, ["Digletts Cave Entrance 2"] = 1}
KantoMap["Celadon Mart 1"] = {["Celadon City"] = 1, ["Celadon Mart 2"] = 1}
KantoMap["Celadon Mart 2"] = {["Celadon Mart 1"] = 1, ["Celadon Mart 3"] = 1}
KantoMap["Celadon Mart 3"] = {["Celadon Mart 2"] = 1, ["Celadon Mart 4"] = 1}
KantoMap["Celadon Mart 4"] = {["Celadon Mart 3"] = 1, ["Celadon Mart 5"] = 1}
KantoMap["Celadon Mart 5"] = {["Celadon Mart 4"] = 1, ["Celadon Mart 6"] = 1}
KantoMap["Celadon Mart 6"] = {["Celadon Mart 5"] = 1}
KantoMap["Digletts Cave Entrance 1"] = {["Digletts Cave"] = 1, ["Route 2"] = 1}
KantoMap["Digletts Cave Entrance 2"] = {["Digletts Cave"] = 1, ["Route 11"] = 1}
KantoMap["Fisherman House - Vermilion"] = {["Vermilion City"] = 1}
KantoMap["Fuchsia City"] = {["Fuchsia City Stop House"] = 1, ["Pokecenter Fuchsia"] = 1, ["Route 15 Stop House"] = 1, ["Route 18"] = 1, ["Safari Stop"] = 1, ["Fuchsia House 1"] = 1}
KantoMap["Fuchsia City Stop House"] = {["Fuchsia City"] = 1, ["Route 19"] = 1}
KantoMap["Fuchsia House 1"] = {["Fuchsia City"] = 1}
KantoMap["Indigo Plateau"] = {["Indigo Plateau Center"] = 1, ["Indigo Plateau Center Johto"] = 1, ["Victory Road Kanto 3F"] = 1}
KantoMap["Indigo Plateau Center"] = {["Indigo Plateau"] = 1, ["Player Bedroom Pallet"] = 1}
KantoMap["Indigo Plateau Center Johto"] = {["Indigo Plateau"] = 1}
KantoMap["Lavender Town"] = {["Pokecenter Lavender"] = 1, ["Pokemon Tower 1F"] = 1, ["Route 10"] = 1, ["Route 12"] = 1, ["Route 8"] = 1}
KantoMap["Mt. Moon 1F"] = {["Mt. Moon B1F"] = 1, ["Route 3"] = 1}
KantoMap["Mt. Moon B1F"] = {["Mt. Moon 1F"] = 1, ["Mt. Moon B2F"] = 1}
KantoMap["Mt. Moon B2F"] = {["Mt. Moon B1F"] = 1, ["Mt. Moon Exit"] = 1}
KantoMap["Mt. Moon Exit"] = {["Mt. Moon B2F"] = 1, ["Route 4"] = 1}
KantoMap["New Bark Town"] = {["Route 27"] = 1}
KantoMap["Pallet Town"] = {["Route 1"] = 1, ["Route 21"] = 1, ["Player House Pallet"] = 1}
KantoMap["Pewter City"] = {["Pewter Pokemart"] = 1, ["Route 2"] = 1, ["Route 3"] = 1, ["Pokecenter Pewter"] = 1}
KantoMap["Pewter Pokemart"] = {["Pewter City"] = 1}
KantoMap["Player Bedroom Pallet"] = {["Player House Pallet"] = 1}
KantoMap["Player House Pallet"] = {["Player Bedroom Pallet"] = 1, ["Pallet Town"] = 1}
KantoMap["Pokecenter Celadon"] = {["Celadon City"] = 1, ["Celadon City Subway"] = 1}
KantoMap["Pokecenter Cerulean"] = {["Cerulean City"] = 1, ["Cerulean City Subway"] = 1}
KantoMap["Pokecenter Cinnabar"] = {["Cinnabar Island"] = 1}
KantoMap["Pokecenter Fuchsia"] = {["Fuchsia City"] = 1, ["Fuchsia City Subway"] = 1}
KantoMap["Pokecenter Lavender"] = {["Lavender Town"] = 1, ["Lavender Town Subway"] = 1}
KantoMap["Pokecenter Route 10"] = {["Route 10"] = 1}
KantoMap["Pokecenter Route 3"] = {["Route 3"] = 1}
KantoMap["Pokecenter Saffron"] = {["Saffron City"] = 1, ["Saffron City Subway"] = 1}
KantoMap["Pokecenter Vermilion"] = {["Vermilion City"] = 1, ["Vermilion City Subway"] = 1}
KantoMap["Pokecenter Viridian"] = {["Viridian City"] = 1, ["Viridian City Subway"] = 1}
KantoMap["Pokecenter Pewter"] = {["Pewter City"] = 1, ["Pewter City Subway"] = 1}
KantoMap["Pokemon League Reception Gate"] = {["Route 22"] = 1, ["Route 26"] = 1, ["Route 28"] = 1, ["Victory Road Kanto 1F"] = 1}
KantoMap["Pokemon Tower 1F"] = {["Lavender Town"] = 1, ["Pokemon Tower 2F"] = 1, ["Pokemon Tower B1"] = 1}
KantoMap["Pokemon Tower 2F"] = {["Pokemon Tower 3F"] = 1}
KantoMap["Pokemon Tower 3F"] = {["Pokemon Tower 2F"] = 1, ["Pokemon Tower 4F"] = 1}
KantoMap["Pokemon Tower 4F"] = {["Pokemon Tower 3F"] = 1, ["Pokemon Tower 5F"] = 1}
KantoMap["Pokemon Tower 5F"] = {["Pokemon Tower 4F"] = 1, ["Pokemon Tower 6F"] = 1}
KantoMap["Pokemon Tower 6F"] = {["Pokemon Tower 5F"] = 1, ["Pokemon Tower 7F"] = 1}
KantoMap["Pokemon Tower 7F"] = {["Pokemon Tower 6F"] = 1}
KantoMap["Pokemon Tower B1"] = {["Pokemon Tower 1F"] = 1, ["Pokemon Tower B2"] = 1}
KantoMap["Pokemon Tower B10"] = {["Pokemon Tower B11"] = 1}
KantoMap["Pokemon Tower B11"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B12"] = 1}
KantoMap["Pokemon Tower B12"] = {["Pokemon Tower B13"] = 1}
KantoMap["Pokemon Tower B13"] = {["Pokemon Tower B14"] = 1}
KantoMap["Pokemon Tower B14"] = {["Pokemon Tower B15"] = 1}
KantoMap["Pokemon Tower B15"] = {["Pokemon Tower B12"] = 1, ["Pokemon Tower B16"] = 1}
KantoMap["Pokemon Tower B16"] = {["Pokemon Tower B17"] = 1}
KantoMap["Pokemon Tower B17"] = {["Pokemon Tower B18"] = 1}
KantoMap["Pokemon Tower B18"] = {["Pokemon Tower B19"] = 1}
KantoMap["Pokemon Tower B19"] = {["Pokemon Tower B20"] = 1}
KantoMap["Pokemon Tower B2"] = {["Pokemon Tower B3"] = 1}
KantoMap["Pokemon Tower B20"] = {["Pokemon Tower B21"] = 1}
KantoMap["Pokemon Tower B21"] = {["Pokemon Tower B23"] = 1}
KantoMap["Pokemon Tower B22"] = {["Pokemon Tower B13"] = 1, ["Pokemon Tower B24"] = 1}
KantoMap["Pokemon Tower B23"] = {["Pokemon Tower B22"] = 1}
KantoMap["Pokemon Tower B24"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower B29"] = 1}
KantoMap["Pokemon Tower B29"] = {["Pokemon Tower B1"] = 1, ["Pokemon Tower Underground"] = 1}
KantoMap["Pokemon Tower B3"] = {["Pokemon Tower B4"] = 1}
KantoMap["Pokemon Tower B4"] = {["Pokemon Tower B5"] = 1}
KantoMap["Pokemon Tower B5"] = {["Pokemon Tower B6"] = 1}
KantoMap["Pokemon Tower B6"] = {["Pokemon Tower B7"] = 1}
KantoMap["Pokemon Tower B7"] = {["Pokemon Tower B3"] = 1, ["Pokemon Tower B8"] = 1}
KantoMap["Pokemon Tower B8"] = {["Pokemon Tower B9"] = 1}
KantoMap["Pokemon Tower B9"] = {["Pokemon Tower B10"] = 1}
KantoMap["Pokemon Tower Underground"] = {["Pokemon Tower B29"] = 1}
KantoMap["Power Plant"] = {["Route 10"] = 1}
KantoMap["Rock Tunnel 1"] = {["Lavender Town"] = 1, ["Rock Tunnel 2"] = 1, ["Route 10"] = 2}
KantoMap["Rock Tunnel 2"] = {["Rock Tunnel 1"] = 1, ["Route 9"] = 1}
KantoMap["Route 1"] = {["Pallet Town"] = 1, ["Route 1 Stop House"] = 1}
KantoMap["Route 1 Stop House"] = {["Route 1"] = 1, ["Viridian City"] = 1}
KantoMap["Route 10"] = {["Lavender Town"] = 1, ["Pokecenter Route 10"] = 1, ["Power Plant"] = 1, ["Rock Tunnel 1"] = 2, ["Route 9"] = 1}
KantoMap["Route 11"] = {["Digletts Cave Entrance 2"] = 1, ["Route 11 Stop House"] = 1, ["Vermilion City"] = 1}
KantoMap["Route 11 Stop House"] = {["Route 11"] = 1, ["Route 12"] = 1}
KantoMap["Route 12"] = {["Lavender Town"] = 1, ["Route 13"] = 1}
KantoMap["Route 13"] = {["Berry Tower Kanto"] = 1, ["Route 12"] = 1, ["Route 14"] = 1}
KantoMap["Route 14"] = {["Route 13"] = 1, ["Route 15"] = 1}
KantoMap["Route 15"] = {["Route 14"] = 1, ["Route 15 Stop House"] = 1}
KantoMap["Route 15 Stop House"] = {["Fuchsia City"] = 1, ["Route 15"] = 1}
KantoMap["Route 16"] = {["Celadon City"] = 1, ["Route 17"] = 1, ["Route 16 Stop House"] = 1, ["Route 16 house"] = 1}
KantoMap["Route 16 house"] = {["Route 16"] = 1}
KantoMap["Route 16 Stop House"] = {["Route 16"] = 1}
KantoMap["Route 17"] = {["Route 16"] = 1, ["Route 18"] = 999}
KantoMap["Route 18"] = {["Fuchsia City"] = 1, ["Route 17"] = 999, ["Bike Road Stop"] = 1}
KantoMap["Route 19"] = {["Fuchsia City Stop House"] = 1, ["Route 20"] = 5}
KantoMap["Route 2"] = {["Digletts Cave Entrance 1"] = 1, ["Pewter City"] = 1, ["Route 2 Stop"] = 1, ["Route 2 Stop2"] = 1, ["Route 2 Stop3"] = 1, ["Viridian City"] = 1}
KantoMap["Route 2 Stop"] = {["Route 2"] = 1, ["Viridian Forest"] = 1}
KantoMap["Route 2 Stop2"] = {["Route 2"] = 1, ["Viridian Forest"] = 1}
KantoMap["Route 2 Stop3"] = {["Digletts Cave Entrance 1"] = 1, ["Pewter City"] = 1, ["Viridian City"] = 1}
KantoMap["Route 20"] = {["Cinnabar Island"] = 5, ["Route 19"] = 5, ["Seafoam 1F"] = 1}
KantoMap["Route 21"] = {["Cinnabar Island"] = 1, ["Pallet Town"] = 1}
KantoMap["Route 22"] = {["Pokemon League Reception Gate"] = 1, ["Viridian City"] = 1}
KantoMap["Route 24"] = {["Cerulean City"] = 1, ["Route 25"] = 1}
KantoMap["Route 25"] = {["Route 24"] = 1}
KantoMap["Route 26"] = {["Pokemon League Reception Gate"] = 1, ["Route 27"] = 5}
KantoMap["Route 27"] = {["New Bark Town"] = 3, ["Route 26"] = 3, ["Tohjo Falls"] = 1}
KantoMap["Route 28"] = {["Pokemon League Reception Gate"] = 1}
KantoMap["Route 3"] = {["Mt. Moon 1F"] = 1, ["Pewter City"] = 1, ["Pokecenter Route 3"] = 1}
KantoMap["Route 4"] = {["Cerulean City"] = 1, ["Mt. Moon Exit"] = 1}
KantoMap["Route 5"] = {["Cerulean City"] = 1, ["Route 5 Stop House"] = 1, ["Underground House 1"] = 1}
KantoMap["Route 5 Stop House"] = {["Route 5"] = 1, ["Saffron City"] = 1}
KantoMap["Route 6"] = {["Route 6 Stop House"] = 1, ["Underground House 2"] = 1, ["Vermilion City"] = 1}
KantoMap["Route 6 Stop House"] = {["Route 6"] = 1, ["Saffron City"] = 1}
KantoMap["Route 7"] = {["Celadon City"] = 1, ["Route 7 Stop House"] = 1}
KantoMap["Route 7 Stop House"] = {["Route 7"] = 1, ["Saffron City"] = 1}
KantoMap["Route 8"] = {["Lavender Town"] = 1, ["Route 8 Stop House"] = 1}
KantoMap["Route 8 Stop House"] = {["Route 8"] = 1, ["Saffron City"] = 1}
KantoMap["Route 9"] = {["Route 10"] = 1, ["Cerulean City"] = 1}
KantoMap["Safari Area 1"] = {["Safari Area 2"] = 1, ["Safari Entrance"] = 1}
KantoMap["Safari Area 2"] = {["Safari Area 1"] = 1, ["Safari Area 3"] = 1}
KantoMap["Safari Area 3"] = {["Safari Area 2"] = 1, ["Safari Entrance"] = 1, ["Safari Exclusive"] = 1}
KantoMap["Safari Effort Wald 1"] = {["Safari Effort Wald 2"] = 1}
KantoMap["Safari Effort Wald 2"] = {["Safari Effort Wald 1"] = 1, ["Safari Stop"] = 1}
KantoMap["Safari Entrance"] = {["Safari Area 1"] = 1, ["Safari Area 3"] = 1, ["Safari Effort Wald 2"] = 1, ["Safari Stop"] = 1}
KantoMap["Safari Exclusive"] = {["Safari Area 3"] = 1}
KantoMap["Safari Stop"] = {["Fuchsia City"] = 1, ["Safari Effort Wald 2"] = 1, ["Safari Entrance"] = 1}
KantoMap["Saffron City"] = {["Pokecenter Saffron"] = 1, ["Route 5 Stop House"] = 1, ["Route 6 Stop House"] = 1, ["Route 7 Stop House"] = 1, ["Route 8 Stop House"] = 1, ["Saffron City Station"] = 1, ["Saffron Pokemart"] = 1}
KantoMap["Saffron City Station"] = {["Saffron City"] = 1, ["Saffron City Station Floor 2"] = 1}
KantoMap["Saffron City Station Floor 2"] = {["Saffron City Station"] = 1}
KantoMap["Saffron Pokemart"] = {["Saffron City"] = 1}
KantoMap["Seafoam 1F"] = {["Route 20"] = 1, ["Seafoam B1F"] = 1}
KantoMap["Seafoam B1F"] = {["Seafoam 1F"] = 1}
KantoMap["Tohjo Falls"] = {["Route 27"] = 1}
KantoMap["Underground House 1"] = {["Route 5"] = 1, ["Underground2"] = 1}
KantoMap["Underground House 2"] = {["Route 6"] = 1, ["Underground2"] = 1}
KantoMap["Underground2"] = {["Underground House 1"] = 1, ["Underground House 2"] = 1}
KantoMap["Vermilion City"] = {["Pokecenter Vermilion"] = 1, ["Route 11"] = 1, ["Route 6"] = 1, ["Vermilion Pokemart"] = 1, ["Fisherman House - Vermilion"] = 1}
KantoMap["Vermilion Pokemart"] = {["Vermilion City"] = 1}
KantoMap["Victory Road Kanto 1F"] = {["Pokemon League Reception Gate"] = 1, ["Victory Road Kanto 2F"] = 1}
KantoMap["Victory Road Kanto 2F"] = {["Victory Road Kanto 1F"] = 1, ["Victory Road Kanto 3F"] = 1}
KantoMap["Victory Road Kanto 3F"] = {["Indigo Plateau"] = 1, ["Victory Road Kanto 2F"] = 1}
KantoMap["Viridian City"] = {["Pokecenter Viridian"] = 1, ["Route 1 Stop House"] = 1, ["Route 2"] = 1, ["Route 22"] = 1, ["Viridian Pokemart"] = 1}
KantoMap["Viridian Forest"] = {["Route 2 Stop"] = 1, ["Route 2 Stop2"] = 1, ["Viridian Maze"] = 1}
KantoMap["Viridian Maze"] = {["Viridian Forest"] = 1}
KantoMap["Viridian Pokemart"] = {["Viridian City"] = 1}
KantoMap["Pewter City Subway"] = {["Pokecenter Pewter"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Celadon City Subway"] = {["Pokecenter Celadon"] = 1, ["Pewter City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Fuchsia City Subway"] = {["Pokecenter Fuchsia"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Saffron City Subway"] = {["Pokecenter Saffron"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Viridian City Subway"] = {["Pokecenter Viridian"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Cerulean City Subway"] = {["Pokecenter Cerulean"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Vermilion City Subway"] = {["Pokecenter Vermilion"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY, ["Lavender Town Subway"] = K_SUBWAY}
KantoMap["Lavender Town Subway"] = {["Pokecenter Lavender"] = 1, ["Celadon City Subway"] = K_SUBWAY, ["Fuchsia City Subway"] = K_SUBWAY, ["Saffron City Subway"] = K_SUBWAY, ["Viridian City Subway"] = K_SUBWAY, ["Cerulean City Subway"] = K_SUBWAY, ["Vermilion City Subway"] = K_SUBWAY, ["Pewter City Subway"] = K_SUBWAY}

return KantoMap
