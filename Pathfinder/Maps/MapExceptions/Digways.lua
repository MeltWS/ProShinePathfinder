local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Lib = require (cppdpath .. "Lib/Lib")

local digways = {}

----------------------
------ Kanto ---------
----------------------

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

----------------------
------ JOHTO ---------
----------------------

digways["Route 42_D"] = {
    ["Route 42_A"] = {{77, 13}, {1}}
}
digways["Route 42_A"] = {
    ["Route 42_D"] = {{15, 13}, {1}}
}
digways["Route 44"] = {
    ["Blackthorn City"] = {{73, 9}, {1}}
}
digways["Blackthorn City"] = {
    ["Route 44"] = {{49, 16}, {1}}
}
digways["Route 31"] = {
    ["Route 45_A"] = {{53, 10}, {1}}
}
digways["Route 45_A"] = {
    ["Route 31"] = {{14, 5}, {1}}
}
digways["Route 32"] = {
    ["Route 33"] = {{10, 143}, {1}}
}
digways["Route 33"] = {
    ["Route 32"] = {{14, 13}, {1}}
}


return digways