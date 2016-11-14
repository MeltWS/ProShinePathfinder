local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

local _ss = require (cpppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local K_SUBWAY = ss.K_SUBWAY

local EventMap = {}

-- Vulcanic Town
EventMap["Lilycove City Harbor"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Olivine City"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Vermilion City_A"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Vulcan Island shore"] = {["Lilycove City Harbor"] = {999}, ["Olivine City"] = {999}, ["Vermilion City_A"] = {999}, ["Vulcan Path"] = {1}}
EventMap["Vulcan Path"] = {["Vulcan Forest"] = {1}, ["Vulcan Island shore"] = {1}}
EventMap["Vulcan Forest"] = {["Vulcan Path"] = {1}, ["Vulcanic Town"] = {1}}
EventMap["Vulcanic Town"] = {["Pokecenter Vulcanic Town"] = {1}, ["Vulcan Forest"] = {1}}
EventMap["Pokecenter Vulcanic Town"] = {["Vulcanic Town"] = {1}}

-- EventMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return EventMap
end
