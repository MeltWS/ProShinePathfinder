local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

local _ss = require (cpppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local J_SUBWAY = ss.J_SUBWAY

local JohtoMap = {}

JohtoMap["Abandoned Desert Village"] = {["Desert Lagoon"] = {1}, ["Desert Cave"] = {1}}
JohtoMap["Amazon Forest Entrance"] = {["Amazon Forest"] = {1}, ["Dock Island"] = {1}}
JohtoMap["Amazon Forest"] = {["Desert Cave"] = {1}, ["Amazon Forest Entrance"] = {1}}
JohtoMap["Azalea House1"] = {["Azalea Town"] = {1}}
JohtoMap["Azalea Kurts House"] = {["Azalea Town"] = {1}}
JohtoMap["Azalea Pokemart"] = {["Azalea Town"] = {1}}
JohtoMap["Azalea Town Gym"] = {["Azalea Town"] = {1}}
JohtoMap["Azalea Town Subway"] = {["Pokecenter Azalea"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Azalea Town"] = {["Azalea Town Gym"] = {1}, ["Azalea House1"] = {1}, ["Azalea Kurts House"] = {1}, ["Azalea Pokemart"] = {1}, ["Ilex Forest Stop House"] = {1}, ["Pokecenter Azalea"] = {1}, ["Route 33"] = {1}, ["Slowpoke Well"] = {1}}
JohtoMap["Battle Road House_A"] = {["Battle Road"] = {1}}
JohtoMap["Battle Road House_B"] = {["Battle Road"] = {1}}
JohtoMap["Battle Road"] = {["Battle Tower Entrance"] = {1}, ["Battle Road House_A"] = {1}, ["Battle Road House_B"] = {1}, ["Route 40"] = {1}}
JohtoMap["Battle Tower Entrance"] = {["Battle Road"] = {1}}
JohtoMap["Bell Tower Barrier Station 1F"] = {["Ecruteak City"] = {1}, ["Bell Tower Barrier Station B1F"] = {1}}
JohtoMap["Bell Tower Barrier Station B1F"] = {["Bell Tower Barrier Station 1F"] = {1}, ["Bell Tower"] = {1}}
JohtoMap["Bell Tower Floor 10"] = {["Bell Tower Floor 9_B"] = {1}, ["Bell Tower Roof"] = {1}}
JohtoMap["Bell Tower Floor 2"] = {["Bell Tower"] = {1}, ["Bell Tower Floor 3"] = {1}}
JohtoMap["Bell Tower Floor 3"] = {["Bell Tower Floor 2"] = {1}, ["Bell Tower Floor 4_A"] = {1}}
JohtoMap["Bell Tower Floor 4_A"] = {["Bell Tower Floor 3"] = {1}, ["Bell Tower Floor 4_B"] = {1}, ["Bell Tower Floor 5_A"] = {1}}
JohtoMap["Bell Tower Floor 4_B"] = {["Bell Tower Floor 5_D"] = {1}, ["Bell Tower Floor 4_C"] = {1}}
JohtoMap["Bell Tower Floor 4_C"] = {["Bell Tower Floor 5_B"] = {1}, ["Bell Tower Floor 4_A"] = {1}}
JohtoMap["Bell Tower Floor 5_A"] = {["Bell Tower Floor 4_A"] = {1}, ["Bell Tower Floor 5_C"] = {1}, ["Bell Tower Floor 5_E"] = {1}}
JohtoMap["Bell Tower Floor 5_B"] = {["Bell Tower Floor 4_C"] = {1}}
JohtoMap["Bell Tower Floor 5_C"] = {["Bell Tower Floor 5_E"] = {1}, ["Bell Tower Floor 5_F"] = {1}}
JohtoMap["Bell Tower Floor 5_D"] = {["Bell Tower Floor 4_B"] = {1}}
JohtoMap["Bell Tower Floor 5_E"] = {["Bell Tower Floor 5_D"] = {1}}
JohtoMap["Bell Tower Floor 5_F"] = {["Bell Tower Floor 5_B"] = {1}, ["Bell Tower Floor 5_E"] = {1}, ["Bell Tower Floor 5_G"] = {1}}
JohtoMap["Bell Tower Floor 5_G"] = {["Bell Tower Floor 5_B"] = {1}, ["Bell Tower Floor 6"] = {1}}
JohtoMap["Bell Tower Floor 6"] = {["Bell Tower Floor 5_G"] = {1}, ["Bell Tower Floor 7_A"] = {1}}
JohtoMap["Bell Tower Floor 7_A"] = {["Bell Tower Floor 6"] = {1}, ["Bell Tower Floor 8_A"] = {1}, ["Bell Tower Floor 7_B"] = {1}}
JohtoMap["Bell Tower Floor 7_B"] = {["Bell Tower Floor 7_A"] = {1}, ["Bell Tower Floor 8_C"] = {1}}
JohtoMap["Bell Tower Floor 8_A"] = {["Bell Tower Floor 7_A"] = {1}, ["Bell Tower Floor 9_A"] = {1}, ["Bell Tower Floor 9_C"] = {1}}
JohtoMap["Bell Tower Floor 8_B"] = {["Bell Tower Floor 9_A"] = {1}, ["Bell Tower Floor 9_B"] = {1}}
JohtoMap["Bell Tower Floor 8_C"] = {["Bell Tower Floor 7_B"] = {1}}
JohtoMap["Bell Tower Floor 9_A"] = {["Bell Tower Floor 8_A"] = {1}, ["Bell Tower Floor 8_B"] = {1}}
JohtoMap["Bell Tower Floor 9_B"] = {["Bell Tower Floor 8_B"] = {1}, ["Bell Tower Floor 10"] = {1}}
JohtoMap["Bell Tower Floor 9_C"] = {["Bell Tower Floor 8_A"] = {1}}
JohtoMap["Bell Tower Roof"] = {["Bell Tower Floor 10"] = {1}}
JohtoMap["Bell Tower"] = {["Bell Tower Barrier Station B1F"] = {1}, ["Bell Tower Floor 2"] = {1}}
JohtoMap["Blackthorn City Dragon Club 1F"] = {["Blackthorn City Dragon Club 2F"] = {1}, ["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City Dragon Club 2F"] = {["Blackthorn City Dragon Club 3F"] = {1}, ["Blackthorn City Dragon Club 1F"] = {1}}
JohtoMap["Blackthorn City Dragon Club 3F"] = {["Blackthorn City Dragon Club 2F"] = {1}}
JohtoMap["Blackthorn City Gym"] = {["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City House 1"] = {["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City House 2"] = {["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City House 3"] = {["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City Pokemart"] = {["Blackthorn City"] = {1}}
JohtoMap["Blackthorn City Subway"] = {["Pokecenter Blackthorn"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Blackthorn City"] = {["Blackthorn City Dragon Club 1F"] = {1}, ["Blackthorn City Gym"] = {1}, ["Blackthorn City House 1"] = {1}, ["Blackthorn City House 2"] = {1}, ["Blackthorn City House 3"] = {1}, ["Blackthorn City Pokemart"] = {1}, ["Route 44"] = {1, {["abilities"] = {"dig"}}}, ["Dragons Den Entrance"] = {1, {["abilities"] = {"surf"}}}, ["Ice Path 1F_B"] = {1}, ["Pokecenter Blackthorn"] = {1}, ["Route 45_A"] = {1}}
JohtoMap["Burned Tower Floor 2"] = {["Burned Tower Top Floor"] = {1}}
JohtoMap["Burned Tower Top Floor"] = {["Ecruteak City"] = {1}, ["Burned Tower Floor 2"] = {1}}
JohtoMap["Cherrygrove City House 1"] = {["Cherrygrove City_A"] = {1}}
JohtoMap["Cherrygrove City House 2"] = {["Cherrygrove City_A"] = {1}}
JohtoMap["Cherrygrove City House 3"] = {["Cherrygrove City_A"] = {1}}
JohtoMap["Cherrygrove City Subway"] = {["Pokecenter Cherrygrove City"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Cherrygrove City_A"] = {["Cherrygrove City House 1"] = {1}, ["Cherrygrove City House 2"] = {1}, ["Cherrygrove City House 3"] = {1}, ["Mart Cherrygrove City"] = {1}, ["Pokecenter Cherrygrove City"] = {1}, ["Route 29"] = {1}, ["Route 30"] = {1}}
JohtoMap["Cherrygrove City_B"] = {["Route 30"] = {1}}
JohtoMap["Cianwood City Gym"] = {["Cianwood City"] = {1}}
JohtoMap["Cianwood City"] = {["Cianwood Shop"] = {1}, ["Cianwood City Gym"] = {1}, ["Cianwood House 1"] = {1}, ["Cianwood House 2"] = {1}, ["Cianwood House 3"] = {1}, ["Cianwood House 4"] = {1}, ["Cliff Edge Gate"] = {1}, ["Pokecenter Cianwood"] = {1}, ["Route 41"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Cianwood House 1"] = {["Cianwood City"] = {1}}
JohtoMap["Cianwood House 2"] = {["Cianwood City"] = {1}}
JohtoMap["Cianwood House 3"] = {["Cianwood City"] = {1}}
JohtoMap["Cianwood House 4"] = {["Cianwood City"] = {1}}
JohtoMap["Cianwood Shop"] = {["Cianwood City"] = {1}}
JohtoMap["Cliff Cave 1F"] = {["Cliff Cave 2F"] = {1}, ["Cliff Cave B1F"] = {1}, ["Route 47_A"] = {1}}
JohtoMap["Cliff Cave 2F"] = {["Cliff Cave 1F"] = {1}, ["Route 47_C"] = {1}}
JohtoMap["Cliff Cave B1F"] = {["Cliff Cave 1F"] = {1}, ["Route 47_B"] = {1}}
JohtoMap["Cliff Edge Gate"] = {["Cianwood City"] = {1}, ["Route 47_A"] = {1}}
JohtoMap["Dark Cave North_A"] = {["Route 45_A"] = {2}, ["Dark Cave North_B"] = {2, {["abilities"] = {"surf"}}}}
JohtoMap["Dark Cave North_B"] = {["Dark Cave South_B"] = {0.5}}
JohtoMap["Dark Cave South_A"] = {["Route 31"] = {1}, ["Dark Cave South_B"] = {1, {["abilities"] = {"surf"}}}, ["Dark Cave South_C"] = {1, {["abilities"] = {"rock smash"}}}}
JohtoMap["Dark Cave South_B"] = {["Dark Cave South_A"] = {0.5}, ["Dark Cave South_C"] = {0.5}, ["Dark Cave North_B"] = {0.5}}
JohtoMap["Dark Cave South_C"] = {["Dark Cave South_B"] = {1.5, {["abilities"] = {"surf"}}}, ["Dark Cave South_A"] = {1.5, {["abilities"] = {"rock smash"}}}, ["Dark Cave South_D"] = {1.5}}
JohtoMap["Dark Cave South_D"] = {["Dark Cave South_C"] = {0.5, {["abilities"] = {"rock smash"}}}, ["Route 46_A"] = {0.5}}
JohtoMap["Desert Cave"] = {["Abandoned Desert Village"] = {1}, ["Amazon Forest"] = {1}}
JohtoMap["Desert Lagoon"] = {["Abandoned Desert Village"] = {1}}
JohtoMap["Dock Island"] = {["Amazon Forest Entrance"] = {1}, ["Olivine City"] = {1}}
JohtoMap["Dragons Den B1F"] = {["Dragons Den"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Dragons Den Entrance"] = {["Blackthorn City"] = {1}, ["Dragons Den"] = {1}}
JohtoMap["Dragons Den"] = {["Dragons Den B1F"] = {1, {["abilities"] = {"surf"}}}, ["Dragons Den Entrance"] = {1}}
JohtoMap["Ecruteak City Costume Mart"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak City House 1"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak City House 2"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak City Subway"] = {["Pokecenter Ecruteak"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Ecruteak City"] = {["Ecruteak City Costume Mart"] = {1}, ["Ecruteak Dance Theater"] = {1}, ["Ecruteak City House 1"] = {1}, ["Ecruteak City House 2"] = {1}, ["Ecruteak Gym"] = {1}, ["Ecruteak Mart"] = {1}, ["Ecruteak Stop House 1"] = {1}, ["Ecruteak Stop House 2"] = {1}, ["Pokecenter Ecruteak"] = {1}, ["Route 37"] = {1}, ["Burned Tower Top Floor"] = {1}, ["Bell Tower Barrier Station 1F"] = {1--[[npc maybe]]}}
JohtoMap["Ecruteak Dance Theater"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak Gym"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak Mart"] = {["Ecruteak City"] = {1}}
JohtoMap["Ecruteak Stop House 1"] = {["Ecruteak City"] = {0.2}, ["Route 38"] = {0.2}}
JohtoMap["Ecruteak Stop House 2"] = {["Ecruteak City"] = {0.2}, ["Route 42_A"] = {0.2}}
JohtoMap["Glitter Lighthouse 1F"] = {["Olivine City"] = {1}, ["Glitter Lighthouse 2F_A"] = {1}}
JohtoMap["Glitter Lighthouse 2F_A"] = {["Glitter Lighthouse 1F"] = {1}, ["Glitter Lighthouse 3F_B"] = {1}}
JohtoMap["Glitter Lighthouse 2F_B"] = {["Glitter Lighthouse 3F_A"] = {1}, ["Glitter Lighthouse 3F_B"] = {1}}
JohtoMap["Glitter Lighthouse 3F_A"] = {["Glitter Lighthouse 2F_B"] = {1}, ["Glitter Lighthouse 4F"] = {1}}
JohtoMap["Glitter Lighthouse 3F_B"] = {["Glitter Lighthouse 2F_B"] = {1}, ["Glitter Lighthouse 2F_A"] = {1}}
JohtoMap["Glitter Lighthouse 4F"] = {["Glitter Lighthouse 3F_A"] = {1}, ["Glitter Lighthouse 5F"] = {1}}
JohtoMap["Glitter Lighthouse 5F"] = {["Glitter Lighthouse 4F"] = {1}}
JohtoMap["Goldenrod City Bike Shop"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Bills House"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Flower Shop"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Fortune Teller Tent"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Game Corner"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Gym"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City House 1"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City House 2"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod City Station Floor 2"] = {["Goldenrod City Station_B"] = {0.5}}
JohtoMap["Goldenrod City Station_A"] = {["Goldenrod City Station_B"] = {0.5}, ["Goldenrod City"] = {0.5}}
JohtoMap["Goldenrod City Station_B"] = {["Goldenrod City Station Floor 2"] = {1}, ["Goldenrod City Station_A"] = {0.5}}
JohtoMap["Goldenrod City Subway"] = {["Pokecenter Goldenrod"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}}
JohtoMap["Goldenrod City"] = {["Goldenrod Global Station"] = {1}, ["Goldenrod Radio Station Floor 1"] = {1}, ["Goldenrod City Flower Shop"] = {1}, ["Goldenrod City Gym"] = {1}, ["Goldenrod City Fortune Teller Tent"] = {1}, ["Goldenrod City Bills House"] = {1}, ["Goldenrod City Game Corner"] = {1}, ["Goldenrod City House 1"] = {1}, ["Goldenrod City House 2"] = {1}, ["Goldenrod City Bike Shop"] = {1}, ["Goldenrod Mart 1"] = {1}, ["Pokecenter Goldenrod"] = {1}, ["Route 34_A"] = {1}, ["Route 35 Stop House"] = {1}, ["Goldenrod City Station_A"] = {1}, ["Goldenrod Underground Entrance Top"] = {1}, ["Goldenrod Underground Entrance Bottom"] = {1}}
JohtoMap["Goldenrod Global Station"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod Mart 1"] = {["Goldenrod Mart 2"] = {1}, ["Goldenrod Mart Elevator"] = {1}, ["Goldenrod City"] = {1}}
JohtoMap["Goldenrod Mart 2"] = {["Goldenrod Mart 1"] = {1}, ["Goldenrod Mart Elevator"] = {1}, ["Goldenrod Mart 3"] = {1}}
JohtoMap["Goldenrod Mart 3"] = {["Goldenrod Mart 2"] = {1}, ["Goldenrod Mart Elevator"] = {1}, ["Goldenrod Mart 4"] = {1}}
JohtoMap["Goldenrod Mart 4"] = {["Goldenrod Mart 3"] = {1}, ["Goldenrod Mart Elevator"] = {1}, ["Goldenrod Mart 5"] = {1}}
JohtoMap["Goldenrod Mart 5"] = {["Goldenrod Mart 4"] = {1}, ["Goldenrod Mart Elevator"] = {1}, ["Goldenrod Mart 6"] = {1}}
JohtoMap["Goldenrod Mart 6"] = {["Goldenrod Mart 5"] = {1}, ["Goldenrod Mart Elevator"] = {1}}
JohtoMap["Goldenrod Mart B1F"] = {["Goldenrod Mart Elevator"] = {1}, ["Underground Warehouse"] = {1}}
JohtoMap["Goldenrod Mart Elevator"] = {["Goldenrod Mart 2"] = {0.2}, ["Goldenrod Mart 1"] = {0.2}, ["Goldenrod Mart 4"] = {0.2}, ["Goldenrod Mart 3"] = {0.2}, ["Goldenrod Mart 5"] = {0.2}, ["Goldenrod Mart 6"] = {0.2}, ["Goldenrod Mart B1F"] = {0.2}}
JohtoMap["Goldenrod Radio Station Floor 1"] = {["Goldenrod City"] = {1}}
JohtoMap["Goldenrod Underground Entrance Bottom"] = {["Goldenrod City"] = {0.2}, ["Goldenrod Underground Path"] = {0.2}}
JohtoMap["Goldenrod Underground Entrance Top"] = {["Goldenrod City"] = {0.2}, ["Goldenrod Underground Path"] = {0.2}}
JohtoMap["Goldenrod Underground Path"] = {["Goldenrod Underground Entrance Top"] = {1}, ["Goldenrod Underground Entrance Bottom"] = {1}, ["Underground Warehouse"] = {1}}
JohtoMap["Ice Path 1F_A"] = {["Route 44"] = {3}, ["Ice Path B1F_A"] = {3}}
JohtoMap["Ice Path 1F_B"] = {["Blackthorn City"] = {1}, ["Ice Path B1F_B"] = {1}}
JohtoMap["Ice Path B1F_A"] = {["Ice Path B2F_A"] = {0.5}, ["Ice Path 1F_A"] = {1.5}}
JohtoMap["Ice Path B1F_B"] = {["Ice Path B2F_B"] = {1}, ["Ice Path 1F_B"] = {1}}
JohtoMap["Ice Path B2F_A"] = {["Ice Path B3F"] = {1}, ["Ice Path B1F_A"] = {1}}
JohtoMap["Ice Path B2F_B"] = {["Ice Path B3F"] = {1}, ["Ice Path B1F_B"] = {1}}
JohtoMap["Ice Path B3F"] = {["Ice Path B2F_A"] = {1}, ["Ice Path B2F_B"] = {1}}
JohtoMap["Ilex Forest Stop House"] = {["Azalea Town"] = {0.2}, ["Ilex Forest_A"] = {0.2}}
JohtoMap["Ilex Forest_A"] = {["Ilex Forest Stop House"] = {1}, ["Ilex Forest_B"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Ilex Forest_B"] = {["Ilex Forest_A"] = {2, {["abilities"] = {"cut"}}}, ["Route 34 Stop House"] = {2}}
JohtoMap["Item Maniac Johto"] = {["Ruins Of Alph_A"] = {1}}
JohtoMap["Johto Safari Entrance"] = {["Safari Johto Wet Zone"] = {1}, ["Safari Johto Mountain Zone"] = {1}, ["Safari Johto Snow Zone"] = {1}, ["Safari Johto Grass and Swamp Zone"] = {1}}
JohtoMap["Johto Safari Zone Lobby"] = {["Route 48"] = {1}, ["Johto Safari Entrance"] = {1}}
JohtoMap["Lake of Rage House 1"] = {["Lake of Rage_A"] = {1}}
JohtoMap["Lake of Rage House 2"] = {["Lake of Rage_E"] = {1}}
JohtoMap["Lake of Rage_A"] = {["Lake of Rage House 1"] = {1}, ["Route 43"] = {1}, ["Lake of Rage_C"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Lake of Rage_B"] = {["Route 43"] = {1}, ["Lake of Rage_E"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Lake of Rage_C"] = {["Lake of Rage_A"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Lake of Rage_D"] = {["Lake of Rage_B"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Lake of Rage_E"] = {["Lake of Rage House 2"] = {1}, ["Lake of Rage_B"] = {1, {["abilities"] = {"cut"}}}, ["Lake of Rage_D"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Mahogany Town Gym_A"] = {["Mahogany Town Gym_B"] = {1}, ["Mahogany Town"] = {1}}
JohtoMap["Mahogany Town Gym_B"] = {["Mahogany Town Gym_A"] = {1}, ["Mahogany Town Gym_C"] = {1}}
JohtoMap["Mahogany Town Gym_C"] = {["Mahogany Town Gym_B"] = {1}}
JohtoMap["Mahogany Town House"] = {["Mahogany Town"] = {1}}
JohtoMap["Mahogany Town Shop"] = {["Mahogany Town"] = {1}}
JohtoMap["Mahogany Town Subway"] = {["Pokecenter Mahogany"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Mahogany Town"] = {["Mahogany Town House"] = {1}, ["Mahogany Town Gym_A"] = {1}, ["Mahogany Town Shop"] = {1}, ["Pokecenter Mahogany"] = {1}, ["Route 42_D"] = {1}, ["Route 43"] = {1}, ["Route 44"] = {1}}
JohtoMap["Mart Cherrygrove City"] = {["Cherrygrove City_A"] = {1}}
JohtoMap["Miltank Barn"] = {["Route 39"] = {1}}
JohtoMap["Mt. Mortar 1F_A"] = {["Mt. Mortar Lower Cave"] = {1}, ["Route 42_A"] = {1}}
JohtoMap["Mt. Mortar 1F_B"] = {["Mt. Mortar B1F_A"] = {1}, ["Route 42_B"] = {1}}
JohtoMap["Mt. Mortar 1F_C"] = {["Mt. Mortar Lower Cave"] = {1}, ["Route 42_D"] = {1}}
JohtoMap["Mt. Mortar 1F_D"] = {["Mt. Mortar Lower Cave"] = {1.5}, ["Route 42_C"] = {1}}
JohtoMap["Mt. Mortar 1F_E"] = {["Mt. Mortar Lower Cave"] = {1}}
JohtoMap["Mt. Mortar 1F_F"] = {["Mt. Mortar Upper Cave"] = {1}}
JohtoMap["Mt. Mortar 1F_G"] = {["Mt. Mortar Lower Cave"] = {1}}
JohtoMap["Mt. Mortar B1F_A"] = {["Mt. Mortar 1F_B"] = {1}, ["Mt. Mortar B1F_B"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Mt. Mortar B1F_B"] = {["Mt. Mortar B1F_A"] = {1, {["abilities"] = {"surf"}}}, ["Mt. Mortar Lower Cave"] = {1}}
JohtoMap["Mt. Mortar Lower Cave"] = {["Mt. Mortar 1F_C"] = {1.5}, ["Mt. Mortar 1F_A"] = {1.5}, ["Mt. Mortar 1F_E"] = {1.5}, ["Mt. Mortar 1F_G"] = {1.5}, ["Mt. Mortar 1F_D"] = {2}, ["Mt. Mortar B1F_B"] = {2.5}, ["Mt. Mortar Upper Cave"] = {2.5}}
JohtoMap["Mt. Mortar Upper Cave"] = {["Mt. Mortar Lower Cave"] = {1.5, {["abilities"] = {"surf"}}}, ["Mt. Mortar 1F_F"] = {2}}
JohtoMap["National Park Stop House 1"] = {["National Park"] = {0.2}, ["Route 35_A"] = {0.2}}
JohtoMap["National Park Stop"] = {["National Park"] = {0.2}, ["Route 36"] = {0.2}}
JohtoMap["National Park"] = {["National Park Stop"] = {1.5}, ["National Park Stop House 1"] = {1.5}}
JohtoMap["New Bark Town House 2"] = {["New Bark Town"] = {1}}
JohtoMap["New Bark Town House"] = {["New Bark Town"] = {1}}
JohtoMap["New Bark Town Player House Bedroom"] = {["New Bark Town Player House"] = {1}}
JohtoMap["New Bark Town Player House"] = {["New Bark Town Player House Bedroom"] = {1}, ["New Bark Town"] = {1}}
JohtoMap["New Bark Town"] = {["New Bark Town House 2"] = {1}, ["New Bark Town House"] = {1}, ["Professor Elms House"] = {1}, ["Professor Elms Lab"] = {1}, ["New Bark Town Player House"] = {1}, ["Route 29"] = {1}}
JohtoMap["Olivine Cafe"] = {["Olivine City"] = {1}}
JohtoMap["Olivine City Gym"] = {["Olivine City"] = {1}}
JohtoMap["Olivine City Subway"] = {["Olivine Pokecenter"] = {0.2}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Violet City Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Olivine City"] = {["Dock Island"] = {1}, ["Glitter Lighthouse 1F"] = {1}, ["Olivine Cafe"] = {1}, ["Olivine City Gym"] = {1}, ["Olivine Pokecenter"] = {1}, ["Olivine Pokemart"] = {1}, ["Route 39"] = {1}, ["Route 40"] = {1}, ["Olivine House 1"] = {1}, ["Olivine House 2"] = {1}, ["Olivine House 3"] = {1}}
JohtoMap["Olivine House 1"] = {["Olivine City"] = {1}}
JohtoMap["Olivine House 2"] = {["Olivine City"] = {1}}
JohtoMap["Olivine House 3"] = {["Olivine City"] = {1}}
JohtoMap["Olivine Pokecenter"] = {["Olivine City"] = {1}, ["Olivine City Subway"] = {0.2}}
JohtoMap["Olivine Pokemart"] = {["Olivine City"] = {1}}
JohtoMap["Pokecenter Azalea"] = {["Azalea Town"] = {1}, ["Azalea Town Subway"] = {0.2}}
JohtoMap["Pokecenter Blackthorn"] = {["Blackthorn City"] = {1}, ["Blackthorn City Subway"] = {0.2}}
JohtoMap["Pokecenter Cherrygrove City"] = {["Cherrygrove City_A"] = {1}, ["Cherrygrove City Subway"] = {0.2}}
JohtoMap["Pokecenter Cianwood"] = {["Cianwood City"] = {1}}
JohtoMap["Pokecenter Ecruteak"] = {["Ecruteak City"] = {1}, ["Ecruteak City Subway"] = {0.2}}
JohtoMap["Pokecenter Goldenrod"] = {["Goldenrod City"] = {1}, ["Goldenrod City Subway"] = {0.2}}
JohtoMap["Pokecenter Mahogany"] = {["Mahogany Town"] = {1}, ["Mahogany Town Subway"] = {0.2}}
JohtoMap["Pokecenter Route 32"] = {["Route 32"] = {1}}
JohtoMap["Pokecenter Route 48"] = {["Route 48"] = {1}}
JohtoMap["Pokecenter Violet City"] = {["Violet City"] = {1}, ["Violet City Subway"] = {0.2}}
JohtoMap["Professor Elms House"] = {["New Bark Town"] = {1}}
JohtoMap["Professor Elms Lab"] = {["New Bark Town"] = {1}}
JohtoMap["Route 29 Stop House"] = {["Route 29"] = {0.2}, ["Route 46_B"] = {0.2}}
JohtoMap["Route 29"] = {["Cherrygrove City_A"] = {1}, ["New Bark Town"] = {1}, ["Route 29 Stop House"] = {1}}
JohtoMap["Route 30 House 1"] = {["Route 30"] = {1}}
JohtoMap["Route 30 House 2"] = {["Route 30"] = {1}}
JohtoMap["Route 30"] = {["Route 30 House 2"] = {1}, ["Route 30 House 1"] = {1}, ["Cherrygrove City_A"] = {1.5}, ["Cherrygrove City_B"] = {1.5, {["abilities"] = {"surf"}}}, ["Route 31"] = {1.5}}
JohtoMap["Route 31"] = {["Dark Cave South_A"] = {1}, ["Route 30"] = {1}, ["Violet City Stop House"] = {1}, ["Route 45_A"] = {1, {["abilities"] = {"dig"}}}}
JohtoMap["Route 32"] = {["Pokecenter Route 32"] = {1.5}, ["Ruins Of Alph Stop House"] = {1.5}, ["Union Cave 1F_C"] = {1.5}, ["Violet City"] = {1.5}, ["Route 33"] = {1.5, {["abilities"] = {"dig"}}}}
JohtoMap["Route 33"] = {["Azalea Town"] = {1}, ["Union Cave 1F_C"] = {1}, ["Route 32"] = {1, {["abilities"] = {"dig"}}}}
JohtoMap["Route 34 Stop House"] = {["Ilex Forest_B"] = {0.2}, ["Route 34_A"] = {0.2}}
JohtoMap["Route 34_A"] = {["Goldenrod City"] = {1}, ["Route 34 Stop House"] = {1}, ["Route 34_B"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Route 34_B"] = {["Route 34_A"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Route 35 Stop House"] = {["Goldenrod City"] = {0.2}, ["Route 35_A"] = {0.2}}
JohtoMap["Route 35_A"] = {["National Park Stop House 1"] = {1}, ["Route 35 Stop House"] = {1}, ["Route 35_B"] = {1, {["abilities"] = {"cut"}}}}
JohtoMap["Route 35_B"] = {["Route 35_A"] = {0, {["abilities"] = {"cut"}}}, ["Route 36"] = {0.2}}
JohtoMap["Route 36 Stop"] = {["Route 36"] = {0.2}, ["Violet City"] = {0.2}}
JohtoMap["Route 36"] = {["Route 35_B"] = {1}, ["Route 36 Stop"] = {1}, ["Route 37"] = {1}, ["Ruins Of Alph Stop House 1"] = {1}}
JohtoMap["Route 37"] = {["Ecruteak City"] = {1}, ["Route 36"] = {1}}
JohtoMap["Route 38"] = {["Ecruteak Stop House 1"] = {1}, ["Route 39"] = {1}}
JohtoMap["Route 39 House"] = {["Route 39"] = {1}}
JohtoMap["Route 39"] = {["Route 39 House"] = {1}, ["Miltank Barn"] = {1}, ["Olivine City"] = {1}, ["Route 38"] = {1}}
JohtoMap["Route 40"] = {["Battle Road"] = {1}, ["Olivine City"] = {1}, ["Route 41"] = {2, {["abilities"] = {"surf"}}}}
JohtoMap["Route 41"] = {["Cianwood City"] = {2}, ["Route 40"] = {2}, ["Whirl Islands 1F NorthEast_A"] = {2}, ["Whirl Islands 1F NorthWest"] = {2}, ["Whirl Islands 1F SouthWest"] = {2}}
JohtoMap["Route 42_A"] = {["Ecruteak Stop House 2"] = {0.2}, ["Mt. Mortar 1F_A"] = {0.2}, ["Route 42_D"] = {0, {["abilities"] = {"dig"}}}}
JohtoMap["Route 42_B"] = {["Mt. Mortar 1F_B"] = {0.2}, ["Route 42_A"] = {0.2, {["abilities"] = {"surf"}}}, ["Route 42_C"] = {0.2, {["abilities"] = {"surf"}}}, ["Route 42_D"] = {0.2, {["abilities"] = {"surf"}}}}
JohtoMap["Route 42_C"] = {["Mt. Mortar 1F_D"] = {0.2}, ["Route 42_B"] = {0.2, {["abilities"] = {"surf"}}}, ["Route 42_D"] = {0.2, {["abilities"] = {"surf"}}}}
JohtoMap["Route 42_D"] = {["Mahogany Town"] = {0.2}, ["Mt. Mortar 1F_C"] = {0.2}, ["Route 42_A"] = {0, {["abilities"] = {"dig"}}}, ["Route 42_C"] = {0.2, {["abilities"] = {"surf"}}}, ["Route 42_B"] = {0.2, {["abilities"] = {"surf"}}}, ["Route 42_E"] = {0, {["abilities"] = {"rock climb"}}}}
JohtoMap["Route 42_E"] = {["Route 42_D"] = {0}}
JohtoMap["Route 43"] = {["Lake of Rage_A"] = {1}, ["Lake of Rage_B"] = {1}, ["Mahogany Town"] = {1}}
JohtoMap["Route 44"] = {["Ice Path 1F_A"] = {1}, ["Mahogany Town"] = {1}, ["Blackthorn City"] = {1, {["abilities"] = {"dig"}}}}
JohtoMap["Route 45_A"] = {["Blackthorn City"] = {0.5}, ["Dark Cave North_A"] = {0.5}, ["Route 45_B"] = {0.5}, ["Route 31"] = {0.5, {["abilities"] = {"dig"}}}}
JohtoMap["Route 45_B"] = {["Route 46_A"] = {1.5}}
JohtoMap["Route 46_A"] = {["Route 46_B"] = {0.5}, ["Route 45_B"] = {0.5}, ["Dark Cave South_D"] = {0.5}}
JohtoMap["Route 46_B"] = {["Route 29 Stop House"] = {0.5}}
JohtoMap["Route 47_A"] = {["Cliff Cave 1F"] = {1}, ["Cliff Edge Gate"] = {1}}
JohtoMap["Route 47_B"] = {["Cliff Cave B1F"] = {1}}
JohtoMap["Route 47_C"] = {["Cliff Cave 2F"] = {2}, ["Route 48"] = {2}}
JohtoMap["Route 48"] = {["Johto Safari Zone Lobby"] = {1}, ["Pokecenter Route 48"] = {1}, ["Route 47_C"] = {1}}
JohtoMap["Ruins Of Alph Stop House 1"--[[npcs entrance]]] = {["Route 36"] = {0.2}, ["Ruins Of Alph_A"] = {0.2, {["items"] = {"Zephyr Badge"}}}}
JohtoMap["Ruins Of Alph Stop House"--[[npcs entrance]]] = {["Route 32"] = {1}, ["Ruins Of Alph_A"] = {0.2, {["items"] = {"Zephyr Badge"}}}}
JohtoMap["Ruins Of Alph_A"--[[npcs entrance]]] = {["Item Maniac Johto"] = {1}, ["Ruins Research Center"] = {1}, ["Ruins Of Alph Stop House"] = {1}, ["Ruins Of Alph Stop House 1"] = {1}, ["Ruins Of Alph_D"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Ruins Of Alph_B"] = {["Union Cave 1F_B"] = {1}}
JohtoMap["Ruins Of Alph_C"] = {["Ruins Of Alph_D"] = {0.2}, ["Union Cave 1F_A"] = {0.2}}
JohtoMap["Ruins Of Alph_D"] = {["Ruins Of Alph_A"] = {0.5, {["abilities"] = {"surf"}}}}
JohtoMap["Ruins Research Center"] = {["Ruins Of Alph_A"] = {1}}
JohtoMap["Safari Johto Grass and Swamp Zone"] = {["Johto Safari Entrance"] = {1}}
JohtoMap["Safari Johto Mountain Zone"] = {["Johto Safari Entrance"] = {1}}
JohtoMap["Safari Johto Snow Zone"] = {["Johto Safari Entrance"] = {1}}
JohtoMap["Safari Johto Wet Zone"] = {["Johto Safari Entrance"] = {1}}
JohtoMap["Slowpoke Well L1"] = {["Slowpoke Well"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Slowpoke Well"] = {["Azalea Town"] = {1}, ["Slowpoke Well L1"] = {1, {["abilities"] = {"surf"}}--[[npc maybe]]}}
JohtoMap["Sprout Tower F1_A"] = {["Violet City"] = {1}, ["Sprout Tower F2_A"] = {1}}
JohtoMap["Sprout Tower F1_B"] = {["Sprout Tower F2_A"] = {1}, ["Sprout Tower F2_B"] = {1}}
JohtoMap["Sprout Tower F2_A"] = {["Sprout Tower F1_A"] = {1}, ["Sprout Tower F1_B"] = {1}}
JohtoMap["Sprout Tower F2_B"] = {["Sprout Tower F1_B"] = {1}, ["Sprout Tower F3"] = {1}}
JohtoMap["Sprout Tower F3"] = {["Sprout Tower F2_B"] = {1}}
JohtoMap["Underground Warehouse"] = {["Goldenrod Mart B1F"] = {1}, ["Goldenrod Underground Path"] = {1}}
JohtoMap["Union Cave 1F_A"] = {["Union Cave B2F_A"] = {0.5}, ["Ruins Of Alph_C"] = {0.5}}
JohtoMap["Union Cave 1F_B"] = {["Union Cave B2F_B"] = {0.5}, ["Ruins Of Alph_B"] = {0.5}}
JohtoMap["Union Cave 1F_C"] = {["Union Cave 1F_D"] = {2.5, {["abilities"] = {"surf"}}}, ["Route 32"] = {2.5}, ["Route 33"] = {2.5}, ["Union Cave B1F_A"] = {2.5}}
JohtoMap["Union Cave 1F_D"] = {["Union Cave 1F_C"] = {0, {["abilities"] = {"surf"}}}, ["Union Cave B1F_C"] = {0.5}}
JohtoMap["Union Cave B1F_A"] = {["Union Cave 1F_C"] = {0.5}, ["Union Cave B1F_B"] = {0.5, {["abilities"] = {"surf"}}}}
JohtoMap["Union Cave B1F_B"] = {["Union Cave B2F_A"] = {1.5}, ["Union Cave B2F_B"] = {1.5}, ["Union Cave B1F_A"] = {1.5, {["abilities"] = {"surf"}}}}
JohtoMap["Union Cave B1F_C"] = {["Union Cave 1F_D"] = {1, {["abilities"] = {"surf"}}}, ["Union Cave B2F_C"] = {1, {["abilities"] = {"surf"}}}}
JohtoMap["Union Cave B2F_A"] = {["Union Cave 1F_A"] = {1}, ["Union Cave B1F_B"] = {1}}
JohtoMap["Union Cave B2F_B"] = {["Union Cave 1F_B"] = {1}, ["Union Cave B1F_B"] = {1}}
JohtoMap["Union Cave B2F_C"] = {["Union Cave B1F_C"] = {1}}
JohtoMap["Violet City Gym Entrance"] = {["Violet City"] = {1}, ["Violet City Gym"] = {1}}
JohtoMap["Violet City Gym"] = {["Violet City Gym Entrance"] = {1}}
JohtoMap["Violet City House 1"] = {["Violet City"] = {1}}
JohtoMap["Violet City House 2"] = {["Violet City"] = {1}}
JohtoMap["Violet City Pokemart"] = {["Violet City"] = {1}}
JohtoMap["Violet City School"] = {["Violet City"] = {1}}
JohtoMap["Violet City Stop House"] = {["Route 31"] = {0.2}, ["Violet City"] = {0.2}}
JohtoMap["Violet City Subway"] = {["Pokecenter Violet City"] = {0.2}, ["Olivine City Subway"] = {J_SUBWAY}, ["Mahogany Town Subway"] = {J_SUBWAY}, ["Azalea Town Subway"] = {J_SUBWAY}, ["Blackthorn City Subway"] = {J_SUBWAY}, ["Cherrygrove City Subway"] = {J_SUBWAY}, ["Ecruteak City Subway"] = {J_SUBWAY}, ["Goldenrod City Subway"] = {J_SUBWAY}}
JohtoMap["Violet City"] = {["Violet City House 1"] = {1}, ["Violet City House 2"] = {1}, ["Violet City Gym Entrance"] = {1}, ["Violet City School"] = {1}, ["Pokecenter Violet City"] = {1}, ["Route 32"] = {1}, ["Route 36 Stop"] = {1}, ["Violet City Pokemart"] = {1}, ["Violet City Stop House"] = {1}, ["Sprout Tower F1_A"] = {1}}
JohtoMap["Whirl Islands 1F NorthEast_A"] = {["Route 41"] = {0.2}, ["Whirl Islands 1F NorthEast_B"] = {0}}
JohtoMap["Whirl Islands 1F NorthEast_B"] = {["Whirl Islands 1F NorthEast_C"] = {0}, ["Whirl Islands 1F NorthEast_D"] = {0}}
JohtoMap["Whirl Islands 1F NorthEast_C"] = {["Whirl Islands B1F_A"] = {0.5}}
JohtoMap["Whirl Islands 1F NorthEast_D"] = {["Whirl Islands B1F_C"] = {0.5}}
JohtoMap["Whirl Islands 1F NorthWest"] = {["Route 41"] = {0.5}, ["Whirl Islands B1F_A"] ={0.5}}
JohtoMap["Whirl Islands 1F SouthEast"] = {["Route 41"] = {1}, ["Whirl Islands B1F_B"] = {1}}
JohtoMap["Whirl Islands 1F SouthWest"] = {["Route 41"] = {1}, ["Whirl Islands B1F_B"] = {1}}
JohtoMap["Whirl Islands B1F_A"] = {["Whirl Islands 1F NorthWest"] = {2}, ["Whirl Islands 1F NorthEast_C"] = {2}, ["Whirl Islands B1F_B"] = {1.5}, ["Whirl Islands B2F"] = {1.5}}
JohtoMap["Whirl Islands B1F_B"] = {["Whirl Islands 1F SouthWest"] = {1}, ["Whirl Islands 1F SouthEast"] = {1}}
JohtoMap["Whirl Islands B1F_C"] = {["Whirl Islands B1F_B"] = {2}, ["Whirl Islands 1F NorthEast_D"] = {2}, ["Whirl Islands B2F"] = {1.5}}
JohtoMap["Whirl Islands B2F"] = {["Whirl Islands B1F_A"] = {1}, ["Whirl Islands B1F_C"] = {1}, ["Whirl Islands B3F"] = {1},  ["Whirl Islands B4F"] = {1}}
JohtoMap["Whirl Islands B3F"] = {["Whirl Islands B2F"] = {1}}
JohtoMap["Whirl Islands B4F"] = {["Whirl Islands B2F"] = {1}}

-- JohtoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return JohtoMap
end