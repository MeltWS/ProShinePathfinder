
local johto = {}

johto["New Bark Town"] =  {"Route 29=1"} -- link kanto
johto["Route 29"] = {"Cherrygrove City=1", "Route 29 Stop House=1", "New Bark Town=1"}
johto["Route 29 Stop House"] = {"Route 29=1", "Route 46=1"}
johto["Route 46"] = {"Route 29 Stop House=1", "Route 45=999"} -- Cannot go up to route 45
johto["Cherrygrove City"] = {"Route 29=1", "Pokecenter Cherrygrove City=1", "Mart Cherrygrove City=1", "Route 30=1"}
johto["Pokecenter Cherrygrove City"] = {"Cherrygrove City=1"}
johto["Mart Cherrygrove City"] = {"Cherrygrove City=1"}
johto["Route 30"] = {"Cherrygrove City=1", "Route 31=1"}
johto["Route 31"] = {"Route 30=1", "Dark Cave South=1", "Violet City Stop House=1"}
johto["Dark Cave South"] = {"Route 31=1", "Dark Cave North=999"} -- Cannot go up in Dark Cave North
johto["Dark Cave North"] = {"Dark Cave South=1", "Route 45=1"}
johto["Violet City Stop House"] = {"Route 31=1", "Violet City=1"}
johto["Violet City Pokemart"] = {"Violet City=1"}
johto["Pokecenter Violet City"] = {"Violet City=1"}
johto["Violet City"] = {"Route 32=1","Violet City Stop House=1","Route 36 Stop=1","Violet City Pokemart=1","Pokecenter Violet City=1"}
johto["Route 36 Stop"] = {"Violet City=1", "Route 36=1"}
johto["Route 36"] = {"Route 36 Stop=1", "Ruins Of Alph Stop House 1=1", "Route 35=1", "Route 37=1"}
johto["Ruins Of Alph Stop House 1"] = {"Route 36=1", "Ruins Of Alph=5"}
johto["Ruins Of Alph"] = {"Ruins Of Alph Stop House 1=1", "Ruins Of Alph Stop House=1"}
johto["Ruins Of Alph Stop House"] = {"Route 32=1", "Ruins Of Alph=5"}
johto["Route 32"] = {"Ruins Of Alph Stop House=1", "Pokecenter Route 32=1", "Union Cave 1F=1", "Violet City=1"}
johto["Pokecenter Route 32"] = {"Route 32=1"}
johto["Union Cave 1F"] = {"Route 33=1", "Route 32=1", "Union Cave B1F=1", "Ruins Of Alph=3"}
johto["Union Cave B1F"] = {"Union Cave 1F=1", "Union Cave B2F=1"}
johto["Union Cave B2F"] = {"Union Cave B1F=1","Union Cave 1F=1"}
johto["Route 33"] = {"Union Cave 1F=1", "Azalea Town=1"}
johto["Azalea Town"] = {"Route 33=1", "Azalea Pokemart=1", "Pokecenter Azalea=1", "Ilex Forest Stop House=1"}
johto["Azalea Pokemart"] = {"Azalea Town=1"}
johto["Pokecenter Azalea"] = {"Azalea Town=1"}
johto["Ilex Forest Stop House"] = {"Azalea Town=1", "Ilex Forest=1"}
johto["Ilex Forest"] = {"Ilex Forest Stop House=1", "Route 34 Stop House=1"}
johto["Route 34 Stop House"] = {"Route 34=1", "Ilex Forest=1"}
johto["Route 34"] = {"Route 34 Stop House=1", "Goldenrod City=1"}
johto["Goldenrod City"] = {"Route 34=1", "Pokecenter Goldenrod=1", "Goldenrod Mart 1=1", "Route 35 Stop House=1"}
johto["Pokecenter Goldenrod"] = {"Goldenrod City=1"}
johto["Goldenrod Mart 1"] = {"Goldenrod City=1", "Goldenrod Mart 2=1"}
johto["Goldenrod Mart 2"] = {"Goldenrod Mart 1=1"}
johto["Route 35 Stop House"] = {"Goldenrod City=1", "Route 35=1"}
johto["Route 35"] = {"Route 35 Stop House=1", "National Park Stop House 1=1", "Route 36=1"}
johto["National Park Stop House 1"] = {"Route 35=1", "National Park=1"}
johto["National Park Stop"] = {"National Park=1", "Route 36=1"}
johto["National Park"] = {"National Park Stop House 1=1", "National Park Stop=1"}
johto["Route 37"] = {"Route 36=1", "Ecruteak City=1"}
johto["Ecruteak City"] = {"Route 37=1", "Ecruteak Pokemart=1", "Pokecenter Ecruteak=1", "Ecruteak Stop House 2=1", "Ecruteak Stop House 1=1"}
johto["Pokecenter Ecruteak"] = {"Ecruteak City=1"}
johto["Ecruteak Pokemart"] = {"Ecruteak City=1"}
johto["Ecruteak Stop House 1"] = {"Ecruteak City=1", "Route 38=1"}
johto["Route 38"] = {"Ecruteak Stop House 1=1", "Route 39=1"}
johto["Route 39"] = {"Route 38=1", "Olivine City=1"}
johto["Olivine City"] = {"Route 39=1", "Olivine Pokemart=1", "Olivine Pokecenter=1", "Route 40=1"}
johto["Olivine Pokemart"] = {"Olivine City=1"}
johto["Olivine Pokecenter"] = {"Olivine City=1"}
johto["Route 40"] = {"Olivine City=1", "Battle Road=1", "Route 41=1"}
johto["Battle Road"] = {"Route 40=1"}
johto["Route 41"] = {"Route 40=1", "Whirl Islands 1F NorthWest=1", "Whirl Islands 1F NorthEast=1", "Whirl Islands 1F SouthWest=1", "Cianwood City=1"}
johto["Whirl Islands 1F NorthWest"] = {"Route 41=1", "Whirl Islands B1F=1"}
johto["Whirl Islands 1F NorthEast"] = {"Whirl Islands B1F=1"}
johto["Whirl Islands 1F SouthWest"] = {"Whirl Islands B1F=1", "Route 41=1"}
johto["Whirl Islands B1F"] = {"Whirl Islands 1F NorthWest=1", "Whirl Islands 1F NorthEast=1", "Whirl Islands 1F SouthWest=1"} -- exceptions not handled
johto["Cianwood City"] = {"Route 41=1", "Pokecenter Cianwood=1", "Cliff Edge Gate=1"}
johto["Pokecenter Cianwood"] = {"Cianwood City=1"}
johto["Cliff Edge Gate"] = {"Cianwood City=1", "Route 47=1"}
johto["Route 47"] = {"Cliff Edge Gate=1", "Cliff Cave 1F=1", "Cliff Cave 2F=1", "Cliff Cave B1F=1", "Route 48=1"}
johto["Cliff Cave 1F"] = {"Route 47", "Cliff Cave B1F=1", "Cliff Cave 2F=1"}
johto["Cliff Cave B1F"] = {"Cliff Cave 1F=1", "Route 47=1"}
johto["Cliff Cave 2F"] = {"Cliff Cave 1F=1", "Route 47=1"}
johto["Route 48"] = {"Route 47=1", "Pokecenter Route 48=1", "Johto Safari Zone Lobby=1"}
johto["Pokecenter Route 48"] = {"Route 48=1"}
johto["Johto Safari Zone Lobby"] = {"Route 48=1"}
johto["Ecruteak Stop House 2"] = {"Ecruteak City=1", "Route 42=1"}
johto["Route 42"] = {"Mt. Mortar 1F=1", "Mahogany Town=1"}
johto["Mt. Mortar 1F"] = {"Route 42=1", "Mt. Mortar Lower Cave=1"}
johto["Mt. Mortar Lower Cave"] = {"Mt. Mortar 1F=1"}
johto["Pokecenter Mahogany"] = {"Mahogany Town=1"}
johto["Mahogany Town"] = {"Route 42=1", "Pokecenter Mahogany=1", "Route 44=1", "Route 43=1"}
johto["Route 43"] = {"Mahogany Town=1", "Lake Of Rage=1"}
johto["Lake Of Rage"] = {"Route 43=1"}
johto["Route 44"] = {"Mahogany Town=1", "Ice Path 1F=1"}
johto["Ice Path 1F"] = {"Route 44=1", "Ice Path B1F=1", "Blackthorn City=1"}
johto["Ice Path B1F"] = {"Ice Path 1F=1", "Ice Path B2F=1"}
johto["Ice Path B2F"] = {"Ice Path B1F=1", "Ice Path B3F=1"}
johto["Ice Path B3F"] = {"Ice Path B2F=1"}
johto["Blackthorn City"] = {"Ice Path 1F=1", "Route 45=1", "Blackthorn City Pokemart=1", "Pokecenter Blackthorn=1", "Dragons Den Entrance=1"}
johto["Route 45"] = {"Blackthorn City=1", "Route 46=1", "Dark Cave North=1"}
johto["Pokecenter Blackthorn"] = {"Blackthorn City=1"}
johto["Blackthorn City Pokemart"] = {"Blackthorn City=1"}
johto["Dragons Den Entrance"] = {"Blackthorn City=1", "Dragons Den=1"}
johto["Dragons Den"] = {"Dragons Den Entrance=1", "Dragons Den B1F=1"}
johto["Dragons Den B1F"] = {"Dragons Den=1"}

return johto