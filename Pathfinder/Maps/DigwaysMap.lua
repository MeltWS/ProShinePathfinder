local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpdpath = nTimes(2, rmlast, cpath) -- callee parent of parent dir path

local lib = require (cpdpath .. "Lib/lib")

local Digways = {} -- Digway map used for discovering them.

-- Kanto
Digways["Route 2"] = {["x"] = 30, ["y"] = 31, ["outletMap"] = "Route 11"}
Digways["Route 11"] = {["x"] = 12, ["y"] = 12, ["outletMap"] = "Route 2"}
Digways["Route 3"] = {["x"] = 74, ["y"] = 16, ["outletMap"] = "Route 4"}
Digways["Route 4"] = {["x"] = 9, ["y"] = 20, ["outletMap"] = "Route 3"}

Digways["Route 10"] = {["x"] = 2, ["y"] = 44, ["outletMap"] = "Route 10", ["inRectangle"] = function () return lib.inRectangle(2,45,29,71) end}
Digways["Route 10_2"] = {["x"] = 9, ["y"] = 9, ["outletMap"] = "Route 10", ["inRectangle"] = function() return lib.inRectangle(10,0,24,11) end}
-- Johto
Digways["Route 31"] = {["x"] = 53, ["y"] = 10, ["outletMap"] = "Route 45"}
Digways["Route 45"] = {["x"] = 14, ["y"] = 5, ["outletMap"] = "Route 31"}
Digways["Route 32"] = {["x"] = 10, ["y"] = 143, ["outletMap"] = "Route 33"}
Digways["Route 33"] = {["x"] = 14, ["y"] = 13, ["outletMap"] = "Route 32"}
Digways["Route 44"] = {["x"] = 73, ["y"] = 9, ["outletMap"] = "Blackthorn City"}
Digways["Blackthorn City"] = {["x"] = 49, ["y"] = 16, ["outletMap"] = "Route 44"}

return Digways
