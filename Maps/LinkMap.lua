
local link = {}

link["New Bark Town"] = {"Route 27=1", "Route 29=1"} -- Link Kanto to Johto and Johto to Kanto
link["Vermilion City"] = {"Route 11=1", "Route 6=1","Vermilion Pokemart=1","Pokecenter Vermilion=1", "Lilycove City Harbor=1"} -- Link Kanto to Hoenn
link["Olivine City"] = {"Route 39=1", "Olivine Pokemart=1", "Olivine Pokecenter=1", "Route 40=1", "Lilycove City Harbor=1"} -- Link Johto to Hoenn
link["Lilycove City Harbor"] = {"Lilycove City=1", "Vermilion City=999", "Olivine City=999"} -- Link Hoenn to Kanto and Johto

return link