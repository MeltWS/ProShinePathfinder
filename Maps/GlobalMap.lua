local lib = require "Lib/lib"
local KantoMap = require "Maps/Kanto/KantoMap"
local JohtoMap = require "Maps/Johto/JohtoMap"
local HoennMap = require "Maps/Hoenn/HoennMap"
local LinkMap  = require "Maps/LinkMap"
local GlobalMap = {}

lib.mergeTable(GlobalMap, KantoMap)
lib.mergeTable(GlobalMap, JohtoMap)
lib.mergeTable(GlobalMap, HoennMap)
lib.mergeTable(GlobalMap, LinkMap)


return GlobalMap