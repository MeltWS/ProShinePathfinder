local lib = require "Pathfinder/Lib/lib"
local KantoMap = require "Pathfinder/Maps/Kanto/KantoMap"
local JohtoMap = require "Pathfinder/Maps/Johto/JohtoMap"
local HoennMap = require "Pathfinder/Maps/Hoenn/HoennMap"
local LinkMap  = require "Pathfinder/Maps/LinkMap"
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