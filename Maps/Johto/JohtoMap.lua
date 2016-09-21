local ss = require "static_Settings"


local JohtoMap = {}

JohtoMap["Azalea Pokemart"] = {["Azalea Town"] = 1}
JohtoMap["Azalea Town"] = {["Azalea Pokemart"] = 1, ["Ilex Forest Stop House"] = 1, ["Pokecenter Azalea"] = 1, ["Route 33"] = 1}
JohtoMap["Battle Road"] = {["Route 40"] = 1}
JohtoMap["Blackthorn City"] = {["Blackthorn City Pokemart"] = 1, ["Dragons Den Entrance"] = 1, ["Ice Path 1F"] = 1, ["Pokecenter Blackthorn"] = 1, ["Route 45"] = 1}
JohtoMap["Blackthorn City Pokemart"] = {["Blackthorn City"] = 1}
JohtoMap["Cherrygrove City"] = {["Mart Cherrygrove City"] = 1, ["Pokecenter Cherrygrove City"] = 1, ["Route 29"] = 1, ["Route 30"] = 1}
JohtoMap["Cianwood City"] = {["Cliff Edge Gate"] = 1, ["Pokecenter Cianwood"] = 1, ["Route 41"] = 1}
JohtoMap["Cliff Cave 1F"] = {["Cliff Cave 2F"] = 1, ["Cliff Cave B1F"] = 1, ["Route 47"] = 1}
JohtoMap["Cliff Cave 2F"] = {["Cliff Cave 1F"] = 1, ["Route 47"] = 1}
JohtoMap["Cliff Cave B1F"] = {["Cliff Cave 1F"] = 1, ["Route 47"] = 1}
JohtoMap["Cliff Edge Gate"] = {["Cianwood City"] = 1, ["Route 47"] = 1}
JohtoMap["Dark Cave North"] = {["Dark Cave South"] = 1, ["Route 45"] = 1}
JohtoMap["Dark Cave South"] = {["Route 31"] = 1}
JohtoMap["Dragons Den"] = {["Dragons Den B1F"] = 1, ["Dragons Den Entrance"] = 1}
JohtoMap["Dragons Den B1F"] = {["Dragons Den"] = 1}
JohtoMap["Dragons Den Entrance"] = {["Blackthorn City"] = 1, ["Dragons Den"] = 1}
JohtoMap["Ecruteak City"] = {["Ecruteak Pokemart"] = 1, ["Ecruteak Stop House 1"] = 1, ["Ecruteak Stop House 2"] = 1, ["Pokecenter Ecruteak"] = 1, ["Route 37"] = 1}
JohtoMap["Ecruteak Pokemart"] = {["Ecruteak City"] = 1}
JohtoMap["Ecruteak Stop House 1"] = {["Ecruteak City"] = 1, ["Route 38"] = 1}
JohtoMap["Ecruteak Stop House 2"] = {["Ecruteak City"] = 1, ["Route 42"] = 1}
JohtoMap["Goldenrod City"] = {["Goldenrod Mart 1"] = 1, ["Pokecenter Goldenrod"] = 1, ["Route 34"] = 1, ["Route 35 Stop House"] = 1}
JohtoMap["Goldenrod Mart 1"] = {["Goldenrod City"] = 1, ["Goldenrod Mart 2"] = 1}
JohtoMap["Goldenrod Mart 2"] = {["Goldenrod Mart 1"] = 1}
JohtoMap["Ice Path 1F"] = {["Blackthorn City"] = 1, ["Ice Path B1F"] = 1, ["Route 44"] = 1}
JohtoMap["Ice Path B1F"] = {["Ice Path 1F"] = 1, ["Ice Path B2F"] = 1}
JohtoMap["Ice Path B2F"] = {["Ice Path B1F"] = 1, ["Ice Path B3F"] = 1}
JohtoMap["Ice Path B3F"] = {["Ice Path B2F"] = 1}
JohtoMap["Ilex Forest"] = {["Ilex Forest Stop House"] = 1, ["Route 34 Stop House"] = 1}
JohtoMap["Ilex Forest Stop House"] = {["Azalea Town"] = 1, ["Ilex Forest"] = 1}
JohtoMap["Johto Safari Zone Lobby"] = {["Route 48"] = 1}
JohtoMap["Lake Of Rage"] = {["Route 43"] = 1}
JohtoMap["Mahogany Town"] = {["Pokecenter Mahogany"] = 1, ["Route 42"] = 1, ["Route 43"] = 1, ["Route 44"] = 1}
JohtoMap["Mart Cherrygrove City"] = {["Cherrygrove City"] = 1}
JohtoMap["Mt. Mortar 1F"] = {["Mt. Mortar Lower Cave"] = 1, ["Route 42"] = 1}
JohtoMap["Mt. Mortar Lower Cave"] = {["Mt. Mortar 1F"] = 1}
JohtoMap["National Park"] = {["National Park Stop"] = 1, ["National Park Stop House 1"] = 1}
JohtoMap["National Park Stop"] = {["National Park"] = 1, ["Route 36"] = 1}
JohtoMap["National Park Stop House 1"] = {["National Park"] = 1, ["Route 35"] = 1}
JohtoMap["New Bark Town"] = {["Route 29"] = 1}
JohtoMap["Olivine City"] = {["Olivine Pokecenter"] = 1, ["Olivine Pokemart"] = 1, ["Route 39"] = 1, ["Route 40"] = 1}
JohtoMap["Olivine Pokecenter"] = {["Olivine City"] = 1}
JohtoMap["Olivine Pokemart"] = {["Olivine City"] = 1}
JohtoMap["Pokecenter Azalea"] = {["Azalea Town"] = 1}
JohtoMap["Pokecenter Blackthorn"] = {["Blackthorn City"] = 1}
JohtoMap["Pokecenter Cherrygrove City"] = {["Cherrygrove City"] = 1}
JohtoMap["Pokecenter Cianwood"] = {["Cianwood City"] = 1}
JohtoMap["Pokecenter Ecruteak"] = {["Ecruteak City"] = 1}
JohtoMap["Pokecenter Goldenrod"] = {["Goldenrod City"] = 1}
JohtoMap["Pokecenter Mahogany"] = {["Mahogany Town"] = 1}
JohtoMap["Pokecenter Route 32"] = {["Route 32"] = 1}
JohtoMap["Pokecenter Route 48"] = {["Route 48"] = 1}
JohtoMap["Pokecenter Violet City"] = {["Violet City"] = 1}
JohtoMap["Route 29"] = {["Cherrygrove City"] = 1, ["New Bark Town"] = 1, ["Route 29 Stop House"] = 1}
JohtoMap["Route 29 Stop House"] = {["Route 29"] = 1, ["Route 46"] = 1}
JohtoMap["Route 30"] = {["Cherrygrove City"] = 1, ["Route 31"] = 1}
JohtoMap["Route 31"] = {["Dark Cave South"] = 1, ["Route 30"] = 1, ["Violet City Stop House"] = 1}
JohtoMap["Route 32"] = {["Pokecenter Route 32"] = 1, ["Ruins Of Alph Stop House"] = 1, ["Union Cave 1F"] = 1, ["Violet City"] = 1}
JohtoMap["Route 33"] = {["Azalea Town"] = 1, ["Union Cave 1F"] = 1}
JohtoMap["Route 34"] = {["Goldenrod City"] = 1, ["Route 34 Stop House"] = 1}
JohtoMap["Route 34 Stop House"] = {["Ilex Forest"] = 1, ["Route 34"] = 1}
JohtoMap["Route 35"] = {["National Park Stop House 1"] = 1, ["Route 35 Stop House"] = 1, ["Route 36"] = 1}
JohtoMap["Route 35 Stop House"] = {["Goldenrod City"] = 1, ["Route 35"] = 1}
JohtoMap["Route 36"] = {["Route 35"] = 1, ["Route 36 Stop"] = 1, ["Route 37"] = 1, ["Ruins Of Alph Stop House 1"] = 1}
JohtoMap["Route 36 Stop"] = {["Route 36"] = 1, ["Violet City"] = 1}
JohtoMap["Route 37"] = {["Ecruteak City"] = 1, ["Route 36"] = 1}
JohtoMap["Route 38"] = {["Ecruteak Stop House 1"] = 1, ["Route 39"] = 1}
JohtoMap["Route 39"] = {["Olivine City"] = 1, ["Route 38"] = 1}
JohtoMap["Route 40"] = {["Battle Road"] = 1, ["Olivine City"] = 1, ["Route 41"] = 1}
JohtoMap["Route 41"] = {["Cianwood City"] = 1, ["Route 40"] = 1, ["Whirl Islands 1F NorthEast"] = 1, ["Whirl Islands 1F NorthWest"] = 1, ["Whirl Islands 1F SouthWest"] = 1}
JohtoMap["Route 42"] = {["Mahogany Town"] = 1, ["Mt. Mortar 1F"] = 1}
JohtoMap["Route 43"] = {["Lake Of Rage"] = 1, ["Mahogany Town"] = 1}
JohtoMap["Route 44"] = {["Ice Path 1F"] = 1, ["Mahogany Town"] = 1}
JohtoMap["Route 45"] = {["Blackthorn City"] = 1, ["Dark Cave North"] = 1, ["Route 46"] = 1}
JohtoMap["Route 46"] = {["Route 29 Stop House"] = 1}
JohtoMap["Route 47"] = {["Cliff Cave 1F"] = 1, ["Cliff Cave 2F"] = 1, ["Cliff Cave B1F"] = 1, ["Cliff Edge Gate"] = 1, ["Route 48"] = 1}
JohtoMap["Route 48"] = {["Johto Safari Zone Lobby"] = 1, ["Pokecenter Route 48"] = 1, ["Route 47"] = 1}
JohtoMap["Ruins Of Alph"] = {["Ruins Of Alph Stop House"] = 1, ["Ruins Of Alph Stop House 1"] = 1}
JohtoMap["Ruins Of Alph Stop House"] = {["Route 32"] = 1, ["Ruins Of Alph"] = 5}
JohtoMap["Ruins Of Alph Stop House 1"] = {["Route 36"] = 1, ["Ruins Of Alph"] = 5}
JohtoMap["Union Cave 1F"] = {["Route 32"] = 1, ["Route 33"] = 1, ["Ruins Of Alph"] = 3, ["Union Cave B1F"] = 1}
JohtoMap["Union Cave B1F"] = {["Union Cave 1F"] = 1, ["Union Cave B2F"] = 1}
JohtoMap["Union Cave B2F"] = {["Union Cave 1F"] = 1, ["Union Cave B1F"] = 1}
JohtoMap["Violet City"] = {["Pokecenter Violet City"] = 1, ["Route 32"] = 1, ["Route 36 Stop"] = 1, ["Violet City Pokemart"] = 1, ["Violet City Stop House"] = 1}
JohtoMap["Violet City Pokemart"] = {["Violet City"] = 1}
JohtoMap["Violet City Stop House"] = {["Route 31"] = 1, ["Violet City"] = 1}
JohtoMap["Whirl Islands 1F NorthEast"] = {["Whirl Islands B1F"] = 1}
JohtoMap["Whirl Islands 1F NorthWest"] = {["Route 41"] = 1, ["Whirl Islands B1F"] = 1}
JohtoMap["Whirl Islands 1F SouthWest"] = {["Route 41"] = 1, ["Whirl Islands B1F"] = 1}
JohtoMap["Whirl Islands B1F"] = {["Whirl Islands 1F NorthEast"] = 1, ["Whirl Islands 1F NorthWest"] = 1, ["Whirl Islands 1F SouthWest"] = 1}

return JohtoMap
