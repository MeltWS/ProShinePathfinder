local modpath = ""
local ppath = select(1, ...)
if ppath ~= nil then
    modpath = ppath:match(".+[/%.]") or modpath
end
local SettingsPath = (string.gsub(modpath, "[/%.]Maps", "" ) or "") .. "Settings/"

local ss = require (SettingsPath .. "static_Settings")
local H_TO_KJ = ss.H_TO_KJ
local J_TO_K  = ss.J_TO_K

local Link = {}

Link["Lilycove City Harbor"] = {["Vermilion City"] = H_TO_KJ, ["Olivine City"] = H_TO_KJ}
Link["Vermilion City"] = {["Lilycove City Harbor"] = H_TO_KJ}
Link["Olivine City"] = {["Lilycove City Harbor"] = H_TO_KJ}
Link["New Bark Town"] = {["Route 27"] = 1, ["Route 29"] = 1}
Link["Saffron City Station Floor 2"] = {["Saffron City Station"] = 1, ["Goldenrod City Station Floor 2"] = J_TO_K}
Link["Goldenrod City Station Floor 2"] = {["Goldenrod City Station"] = 1, ["Saffron City Station Floor 2"] = J_TO_K}


return Link
