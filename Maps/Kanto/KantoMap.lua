
local kanto = {}

kanto["Route 21"] = {"Pallet Town=1", "Cinnabar Island=1"}
kanto["Pallet Town"] = {"Route 1=1", "Route 21=1"}
kanto["Route 1"] = {"Route 1 Stop House=1", "Pallet Town=1"}
kanto["Route 1 Stop House"] = {"Route 1=1", "Viridian City=1"}
kanto["Viridian City"] = {"Route 22=1", "Route 1 Stop House=1", "Route 2=1", "Viridian Pokemart=1","Pokecenter Viridian=1"}
kanto["Pokecenter Viridian"] = {"Viridian City=1"}
kanto["Viridian Pokemart"] = {"Viridian City=1"}
kanto["Pewter City"] = {"Route 2=1", "Route 3=1","Pewter Pokemart=1"}
kanto["Pewter Pokemart"] = {"Pewter City=1"}
kanto["Digletts Cave Entrance 1"] = {"Route 2=1", "Digletts Cave=1"}
kanto["Digletts Cave"] = {"Digletts Cave Entrance 1=1", "Digletts Cave Entrance 2=1"}
kanto["Digletts Cave Entrance 2"] = {"Digletts Cave=1", "Route 11=1"}
kanto["Route 3"] = {"Pewter City=1", "Mt. Moon 1F=1", "Pokecenter Route 3=1"}
kanto["Pokecenter Route 3"] = {"Route 3=1"}
kanto["Route 22"] = {"Viridian City=1", "Pokemon League Reception Gate=1"}
kanto["Pokemon League Reception Gate"] = {"Route 28=1", "Route 22=1", "Route 26=1", "Victory Road Kanto 1F=1"}
kanto["Route 28"] = {"Pokemon League Reception Gate=1"}
kanto["Victory Road Kanto 1F"] = {"Pokemon League Reception Gate=1", "Victory Road Kanto 2F=1"}
kanto["Victory Road Kanto 2F"] = {"Victory Road Kanto 1F=1", "Victory Road Kanto 3F=1"}
kanto["Victory Road Kanto 3F"] = {"Victory Road Kanto 2F=1", "Indigo Plateau=1"}
kanto["Indigo Plateau"] = {"Victory Road Kanto 3F=1", "Indigo Plateau Center=1", "Indigo Plateau Center Johto=1"}
kanto["Indigo Plateau Center"] = {"Indigo Plateau=1"}
kanto["Indigo Plateau Center Johto"] = {"Indigo Plateau=1"}
kanto["Route 26"] = {"Pokemon League Reception Gate=1", "Route 27=5"}
kanto["Route 27"] = {"Tohjo Falls=1", "Route 26=3", "New Bark Town=3"}
kanto["New Bark Town"] = {"Route 27=1"} -- link to Johto
kanto["Tohjo Falls"] = {"Route 27=1"}
kanto["Mt. Moon 1F"] = {"Route 3=1", "Mt. Moon B1F=1"}
kanto["Mt. Moon B1F"] = {"Mt. Moon 1F=1", "Mt. Moon B2F=1"}
kanto["Mt. Moon B2F"] = {"Mt. Moon B1F=1","Mt. Moon Exit=1"}
kanto["Mt. Moon Exit"] = {"Mt. Moon B2F=1", "Route 4=1"}
kanto["Route 4"] = {"Mt. Moon Exit=1", "Cerulean City=1"}
kanto["Cerulean City"] = {"Route 5=1", "Route 24=1", "Route 4=1", "Route 9=1","Pokecenter Cerulean=1"}
kanto["Pokecenter Cerulean"] = {"Cerulean City=1"}
kanto["Route 2"] = {"Route 2 Stop2=1","Route 2 Stop3=1","Viridian City=1","Digletts Cave Entrance 1=1","Pewter City=1", "Route 2 Stop=1"}
kanto["Route 2 Stop"] = {"Route 2=1", "Viridian Forest=1"}
kanto["Route 2 Stop2"] = {"Route 2=1", "Viridian Forest=1"}
kanto["Route 2 Stop3"] = {"Pewter City=1","Viridian City=1","Digletts Cave Entrance 1=1"}
kanto["Viridian Forest"] = {"Route 2 Stop2=1","Route 2 Stop=1","Viridian Maze=1"}
kanto["Viridian Maze"] = {"Viridian Forest=1"}
kanto["Route 11"] = {"Vermilion City=1","Route 11 Stop House=1", "Digletts Cave Entrance 2=1"}
kanto["Vermilion City"] = {"Route 11=1", "Route 6=1","Vermilion Pokemart=1","Pokecenter Vermilion=1"}
kanto["Pokecenter Vermilion"] = {"Vermilion City=1"}
kanto["Vermilion Pokemart"] = {"Vermilion City=1"}
kanto["Route 6"] = {"Vermilion City=1", "Route 6 Stop House=1", "Underground House 2=1"}
kanto["Underground House 2"] = {"Route 6=1", "Underground2=1"}
kanto["Underground2"] = {"Underground House 2=1", "Underground House 1=1"}
kanto["Underground House 1"] = {"Underground2=1", "Route 5=1"}
kanto["Route 5"] = {"Underground House 1=1", "Route 5 Stop House=1", "Cerulean City=1"}
kanto["Route 5 Stop House"] = {"Route 5=1", "Saffron City=1"}
kanto["Route 9"] = {"Route 10=1"}
kanto["Power Plant"] = {"Route 10=1"}
kanto["Route 24"] = {"Route 25=1","Cerulean City=1"}
kanto["Route 25"] = {"Route 24=1"}
kanto["Route 7 Stop House"] = {"Saffron City=1", "Route 7=1"}
kanto["Route 7"] = {"Route 7 Stop House=1","Celadon City=1"}
kanto["Pokecenter Celadon"] = {"Celadon City=1"}
kanto["Route 8 Stop House"] = {"Saffron City=1", "Route 8=1"}
kanto["Route 8"] = {"Route 8 Stop House=1","Lavender Town=1"}
kanto["Celadon City"] = {"Route 7=1","Route 16=1","Pokecenter Celadon=1"}
kanto["Route 16"] = {"Celadon City=1","Route 17=1"}
kanto["Route 17"] = {"Route 16=1","Route 18=999"}
kanto["Route 18"] = {"Route 17=999","Fuchsia City=1"}
kanto["Route 6 Stop House"] = {"Route 6=1", "Saffron City=1"}
kanto["Saffron City"] = {"Route 6 Stop House=1","Route 5 Stop House=1","Route 7 Stop House=1","Route 8 Stop House=1","Pokecenter Saffron=1"}
kanto["Pokecenter Saffron"] = {"Saffron City=1"}
kanto["Route 11 Stop House"] = {"Route 11=1", "Route 12=1"}
kanto["Route 12"] = {"Route 13=1", "Lavender Town=1"}
kanto["Lavender Town"] = {"Route 12=1", "Route 8=1","Route 10=1","Pokemon Tower 1F=1","Pokecenter Lavender=1"}
kanto["Pokecenter Lavender"] = {"Lavender Town=1"}
kanto["Rock Tunnel 1"] = {"Route 10=2","Rock Tunnel 2=1","Lavender Town=1"}
kanto["Rock Tunnel 2"] = {"Route 9=1","Rock Tunnel 1=1"}
kanto["Route 10"] = {"Rock Tunnel 1=2", "Lavender Town=1","Pokecenter Route 10=1","Route 9=1", "Power Plant=1"}
kanto["Pokecenter Route 10"] = {"Route 10=1"}
kanto["Route 13"] = {"Route 12=1", "Route 14=1", "Berry Tower Kanto=1"}
kanto["Berry Tower Kanto"] = {"Route 13=1"}
kanto["Cinnabar Island"] = {"Route 21=1", "Pokecenter Cinnabar=1","Cinnabar mansion 1=1","Route 20=1","Cinnabar Lab=1"}
kanto["Pokecenter Cinnabar"] = {"Cinnabar Island=1"}
kanto["Cinnabar Lab"] = {"Cinnabar Island=1"}
kanto["Cinnabar mansion 1"] = {"Cinnabar mansion 2=1", "Cinnabar Island=1"}
kanto["Cinnabar mansion 2"] = {"Cinnabar mansion 3=1", "Cinnabar mansion 1=1"}
kanto["Cinnabar mansion 3"] = {"Cinnabar mansion 2=1"}
kanto["Route 14"] = {"Route 13=1", "Route 15=1"}
kanto["Route 15"] = {"Route 14=1", "Route 15 Stop House=1"}
kanto["Route 15 Stop House"] = {"Route 15=1", "Fuchsia City=1"}
-- SAFARI KANTO
kanto["Fuchsia City"] = {"Route 15 Stop House=1","Fuchsia City Stop House=1","Pokecenter Fuchsia=1","Safari Stop=1", "Route 18=1"}
kanto["Safari Stop"] = {"Safari Entrance=1","Safari Effort Wald 2=1","Fuchsia City=1"}
kanto["Safari Effort Wald 1"] = {"Safari Effort Wald 2=1",}
kanto["Safari Effort Wald 2"] = {"Safari Effort Wald 1=1","Safari Stop=1"}
kanto["Safari Entrance"] = {"Safari Area 3=1","Safari Area 1=1","Safari Stop=1","Safari Effort Wald 2=1"}
kanto["Safari Area 1"] = {"Safari Area 2=1","Safari Entrance=1"}
kanto["Safari Area 2"] = {"Safari Area 3=1","Safari Area 1=1"}
kanto["Safari Area 3"] = {"Safari Entrance=1","Safari Exclusive=1","Safari Area 2=1"}
kanto["Safari Exclusive"] = {"Safari Area 3=1"}
kanto["Pokecenter Fuchsia"] = {"Fuchsia City=1"}
kanto["Fuchsia City Stop House"] = {"Route 19=1","Fuchsia City=1"}
kanto["Route 19"] = {"Route 20=5","Fuchsia City Stop House=1"}
kanto["Route 20"] = {"Seafoam 1F=1","Cinnabar Island=5","Route 19=5"}
kanto["Seafoam 1F"] = {"Route 20=1", "Seafoam B1F=1"}
kanto["Seafoam B1F"] = {"Seafoam 1F=1"}
-- POKEMON TOWER UNDEGROUND
kanto["Pokemon Tower 1F"] = {"Lavender Town=1","Pokemon Tower B1=1","Pokemon Tower 2F=1"}
kanto["Pokemon Tower 2F"] = {"Pokemon Tower 3F=1"}
kanto["Pokemon Tower 3F"] = {"Pokemon Tower 2F=1","Pokemon Tower 4F=1"}
kanto["Pokemon Tower 4F"] = {"Pokemon Tower 3F=1","Pokemon Tower 5F=1"}
kanto["Pokemon Tower 5F"] = {"Pokemon Tower 4F=1","Pokemon Tower 6F=1"}
kanto["Pokemon Tower 6F"] = {"Pokemon Tower 5F=1","Pokemon Tower 7F=1"}
kanto["Pokemon Tower 7F"] = {"Pokemon Tower 6F=1"}
kanto["Pokemon Tower B1"] = {"Pokemon Tower B2=1","Pokemon Tower 1F=1"}
kanto["Pokemon Tower B2"] = {"Pokemon Tower B3=1"}
kanto["Pokemon Tower B3"] = {"Pokemon Tower B4=1"}
kanto["Pokemon Tower B4"] = {"Pokemon Tower B5=1"}
kanto["Pokemon Tower B5"] = {"Pokemon Tower B6=1"}
kanto["Pokemon Tower B6"] = {"Pokemon Tower B7=1"}
kanto["Pokemon Tower B7"] = {"Pokemon Tower B8=1","Pokemon Tower B3=1"}
kanto["Pokemon Tower B8"] = {"Pokemon Tower B9=1"}
kanto["Pokemon Tower B9"] = {"Pokemon Tower B10=1"}
kanto["Pokemon Tower B10"] = {"Pokemon Tower B11=1"}
kanto["Pokemon Tower B11"] = {"Pokemon Tower B12=1","Pokemon Tower B1=1"}
kanto["Pokemon Tower B12"] = {"Pokemon Tower B13=1"}
kanto["Pokemon Tower B13"] = {"Pokemon Tower B14=1"}
kanto["Pokemon Tower B14"] = {"Pokemon Tower B15=1"}
kanto["Pokemon Tower B15"] = {"Pokemon Tower B16=1","Pokemon Tower B12=1"}
kanto["Pokemon Tower B16"] = {"Pokemon Tower B17=1"}
kanto["Pokemon Tower B17"] = {"Pokemon Tower B18=1"}
kanto["Pokemon Tower B18"] = {"Pokemon Tower B19=1"}
kanto["Pokemon Tower B19"] = {"Pokemon Tower B20=1"}
kanto["Pokemon Tower B20"] = {"Pokemon Tower B21=1"}
kanto["Pokemon Tower B21"] = {"Pokemon Tower B23=1"}
kanto["Pokemon Tower B22"] = {"Pokemon Tower B24=1","Pokemon Tower B13=1"}
kanto["Pokemon Tower B23"] = {"Pokemon Tower B22=1"}
kanto["Pokemon Tower B24"] = {"Pokemon Tower B29=1","Pokemon Tower B1=1"}
kanto["Pokemon Tower B29"] = {"Pokemon Tower Underground=1","Pokemon Tower B1=1"}
kanto["Pokemon Tower Underground"] = {"Pokemon Tower B29=1"}

return kanto