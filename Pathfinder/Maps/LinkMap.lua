local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local _ss = require (cppdpath .. "Settings/Static_Settings")

return function()

local ss = _ss()
local H_TO_KJ = ss.H_TO_KJ
local J_TO_K  = ss.J_TO_K

local Link = {}

Link["Lilycove City Harbor"] = {["Vermilion City_A"] = {H_TO_KJ}, ["Olivine City"] = {H_TO_KJ}}
Link["Vermilion City_A"] = {["Lilycove City Harbor"] = {H_TO_KJ}}
Link["Olivine City"] = {["Lilycove City Harbor"] = {H_TO_KJ}}
Link["Saffron City Station Floor 2"] = {["Goldenrod City Station Floor 2"] = {J_TO_K}}
Link["Goldenrod City Station Floor 2"] = {["Saffron City Station Floor 2"] = {J_TO_K}}

-- Link["test run"] = {} -- load this to check for map errors, you should get "Path Not Found result, otherwise the map is incorrect."
-- Link["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}


return Link
end