local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

return function()

local EventMap = {}

-- Summer Event
EventMap["Kalijodo Path"] = {["Kalijodo Lake"] = {1}, ["Vulcanic Town"] = {1}}
EventMap["Kalijodo Cave B1F"] = {["Kalijodo Cave Entrance"] = {1}, ["Kalijodo Cave B2F"] = {1}}
EventMap["Kalijodo Cave B2F"] = {["Kalijodo Cave B1F"] = {1}}
EventMap["Kalijodo Cave Entrance"] = {["Kalijodo Lake"] = {1}}
EventMap["Kalijodo Lake"] = {["Kalijodo Path"] = {1}}
EventMap["Lilycove City Harbor"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Olivine City"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Pokecenter Vulcanic Town"] = {["Vulcanic Town"] = {1}}
EventMap["Vermilion City_A"] = {["Vulcan Island shore"] = {0.2}}
EventMap["Vulcan Island shore"] = {["Lilycove City Harbor"] = {999}, ["Olivine City"] = {999}, ["Vermilion City_A"] = {999}, ["Vulcan Path"] = {1}}
EventMap["Vulcan Path"] = {["Vulcan Forest"] = {1}, ["Vulcan Island shore"] = {1}}
EventMap["Vulcan Forest"] = {["Vulcan Path"] = {1}, ["Vulcanic Town"] = {1}}
EventMap["Vulcanic Town"] = {["Pokecenter Vulcanic Town"] = {1}, ["Vulcan Forest"] = {1}}


-- Christmas Event
EventMap["Cryofrost Brink"] = {["Cryofrost Town"] = {1}, ["Snowfall Valley"] = {1}}
EventMap["Cryofrost Path_A"] = {["Cryofrost Path_B"] = {1, {["abilities"] = {"cut"}}}, ["Cryofrost Path Costume Mart"] = {1}, ["Flake Wood"] = {1}, ["Frost Valley"] = {1}}
EventMap["Cryofrost Path_B"] = {["Cryofrost Path_A"] = {1, {["abilities"] = {"cut"}}}, ["Cryofrost Town"] = {1}}
EventMap["Cryofrost Path Costume Mart"] = {["Cryofrost Path_A"] = {1}}
EventMap["Cryofrost Town"] = {["Cryofrost Brink"] = {1}, ["Cryofrost Path_B"] = {1}, ["Mart Cryofrost Town"] = {1}, ["Pokecenter Cryofrost Town"] = {1}}
EventMap["Flake Wood"] = {["Cryofrost Path_A"] = {1}, ["Viridian City"] = {1}}
EventMap["Frost Valley"] = {["Cryofrost Path_A"] = {1}, ["Frozen Cave Entrance_A"] = {1}}
EventMap["Frozen Cave B1F"] = {["Frozen Cave B2F_B"] = {1}, ["Frozen Cave B2F_C"] = {1}}
EventMap["Frozen Cave B2F_A"] = {["Frozen Cave B2F_B"] = {1, {["abilities"] = {"surf"}}}, ["Frozen Cave Entrance_B"] = {1}}
EventMap["Frozen Cave B2F_B"] = {["Frozen Cave B1F"] = {1}, ["Frozen Cave B2F_A"] = {1, {["abilities"] = {"surf"}}}}
EventMap["Frozen Cave B2F_C"] = {["Frozen Cave B1F"] = {1}}
EventMap["Frozen Cave Entrance_A"] = {["Frost Valley"] = {1}, ["Frozen Cave Entrance_B"] = {1}}
EventMap["Frozen Cave Entrance_B"] = {["Frozen Cave Entrance_A"] = {1}, ["Frozen Cave B2F_A"] = {1}}
EventMap["Mart Cryofrost Town"] = {["Cryofrost Town"] = {1}}
EventMap["Pokecenter Cryofrost Town"] = {["Cryofrost Town"] = {1}}
EventMap["Snowfall Valley"] = {["Cryofrost Brink"] = {1}}
EventMap["Viridian City"] = {["Flake Wood"] = {1}}

-- EventMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return EventMap
end
