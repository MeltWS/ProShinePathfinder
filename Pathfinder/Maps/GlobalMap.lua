local modpath = ""
local ppath = select(1, ...)
if ppath ~= nil then
    modpath = ppath:match(".+[/%.]") or modpath
end
local LibPath = (string.gsub(modpath, "[/%.]Maps", "" ) or "") .. "Lib/"

local lib = require (LibPath .. "lib")
local KantoMap = require (modpath .. "Kanto/KantoMap")
local JohtoMap = require (modpath .. "Johto/JohtoMap")
local HoennMap = require (modpath .. "Hoenn/HoennMap")
local LinkMap  = require (modpath .. "LinkMap")
local GlobalMap = {}

local function mergeMap(t1, t2)
    for key, value in pairs(t2) do
        if not t1[key] then
            t1[key] = value
        elseif type(value) == "table" then
            mergeMap(t1[key], value)
        end
    end
end

mergeMap(GlobalMap, KantoMap)
mergeMap(GlobalMap, JohtoMap)
mergeMap(GlobalMap, HoennMap)
mergeMap(GlobalMap, LinkMap)

return GlobalMap