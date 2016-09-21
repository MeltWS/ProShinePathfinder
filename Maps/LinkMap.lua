local ss = require "static_Settings"
local H_TO_KJ = ss.H_TO_KJ

local Link = {}

Link["Lilycove City Harbor"] = {["Lilycove City"] = 1, ["Vermilion City"] = H_TO_KJ, ["Olivine City"] = H_TO_KJ}
Link["Vermilion City"] = {["Route 11"] = 1, ["Route 6"] = 1, ["Vermilion Pokemart"] = 1, ["Pokecenter Vermilion"] = 1, ["Lilycove City Harbor"] = H_TO_KJ}
Link["Olivine City"] = {["Route 39"] = 1, ["Olivine Pokemart"] = 1, ["Olivine Pokecenter"] = 1, ["Route 40"] = 1, ["Lilycove City Harbor"] = H_TO_KJ}
Link["New Bark Town"] = {["Route 27"] = 1, ["Route 29"] = 1}

return Link
