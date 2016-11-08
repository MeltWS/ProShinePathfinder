local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local Lib = require (cpdpath .. "Lib/Lib")
local _KantoMap = require (cdpath .. "Kanto/KantoMap")
local _JohtoMap = require (cdpath .. "Johto/JohtoMap")
local _HoennMap = require (cdpath .. "Hoenn/HoennMap")
local _LinkMap  = require (cdpath .. "LinkMap")

return function()

local KantoMap = _KantoMap()
local JohtoMap = _JohtoMap()
local HoennMap = _HoennMap()
local LinkMap  = _LinkMap()

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
end