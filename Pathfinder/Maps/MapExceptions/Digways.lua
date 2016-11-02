local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Lib = require (cppdpath .. "Lib/Lib")

local digways = {} -- Digway map used for discovering them.

-- Kanto
-- Digways["Route 2_B"] = {["x"] = 30, ["y"] = 31, ["outletMap"] = "Route 11"}
-- Digways["Route 11"] = {["x"] = 12, ["y"] = 12, ["outletMap"] = "Route 2"}
-- Digways["Route 3"] = {["x"] = 74, ["y"] = 16, ["outletMap"] = "Route 4"}
-- Digways["Route 4"] = {["x"] = 9, ["y"] = 20, ["outletMap"] = "Route 3"}

-- Digways["Route 10_C"] = {["x"] = 2, ["y"] = 44, ["outletMap"] = "Route 10"}
-- Digways["Route 10_A"] = {["x"] = 9, ["y"] = 9, ["outletMap"] = "Route 10"}
-- -- Johto
-- Digways["Route 31"] = {["x"] = 53, ["y"] = 10, ["outletMap"] = "Route 45"}
-- Digways["Route 45"] = {["x"] = 14, ["y"] = 5, ["outletMap"] = "Route 31"}
-- Digways["Route 32"] = {["x"] = 10, ["y"] = 143, ["outletMap"] = "Route 33"}
-- Digways["Route 33"] = {["x"] = 14, ["y"] = 13, ["outletMap"] = "Route 32"}
-- Digways["Route 44"] = {["x"] = 73, ["y"] = 9, ["outletMap"] = "Blackthorn City"}
-- Digways["Blackthorn City"] = {["x"] = 49, ["y"] = 16, ["outletMap"] = "Route 44"}
-- Digways["Route 42"] = {["x"] = 15, ["y"] = 13, ["outletMap"] = "Route 42"}
-- Digways["Route 42_2"] = {["x"] = 77, ["y"] = 13, ["outletMap"] = "Route 42"}

-- return Digways

digways["Route 10_C"] = {
    ["Route 10_A"] = {{2, 44}, {1}}
}
digways["Route 10_A"] = {
    ["Route 10_C"] = {{9, 9}, {1}}
}
digways["Route 11"] = {
    ["Route 2_B"] = {{12, 12}, {1}}
}
digways["Route 2_B"] = {
    ["Route 11"] = {{30, 31}, {1}}
}
digways["Route 3"] = {
    ["Route 4"] = {{74, 16}, {1}}
}
digways["Route 4"] = {
    ["Route 3"] = {{9, 20}, {1}}
}


return digways