local lib = require "Pathfinder/Lib/lib"
local KantoMap = require "Pathfinder/Maps/Kanto/KantoMap"
local JohtoMap = require "Pathfinder/Maps/Johto/JohtoMap"
local HoennMap = require "Pathfinder/Maps/Hoenn/HoennMap"
local LinkMap  = require "Pathfinder/Maps/LinkMap"
local GlobalMap = {}

lib.mergeTable(GlobalMap, KantoMap)
lib.mergeTable(GlobalMap, JohtoMap)
lib.mergeTable(GlobalMap, HoennMap)
lib.mergeTable(GlobalMap, LinkMap)


return GlobalMap