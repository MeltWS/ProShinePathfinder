local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local pf             = require (cppdpath .. "Lib/MoveTo/MoveTo")
local Lib          = require (cppdpath .. "Lib/Lib")
local PokecenterList = require (cppdpath .. "Maps/Pokecenters/Pokecenters")

-- move to closest PC
local function moveToPC(map)
    return pf.moveTo(map, PokecenterList)
end

-- move to closest PC and use the nurse
local function useNearestPokecenter(map)
    if map == "Indigo Plateau Center" then
        return assert(talkToNpcOnCell(4, 22), "Failed to talk to Nurse on Cell 4/22")
    elseif string.find(map, "Seafoam") and getMoney() > 1500 then
        if pf.moveTo(map, "Seafoam B4F_D") then
            return true
        end
        return assert(talkToNpcOnCell(59,13), "Failed to talk to Nurse on Cell 59/13")
    elseif string.find(map, "Rock Tunnel") then
        if pf.moveTo(map, "Rock Tunnel 1_C") then
            return true
        end
        return assert(talkToNpcOnCell(32,31), "Failed to talk to Nurse on Cell 32/31")
    elseif Lib.inTable({"Moon","Moon 1F","Moon B1F"}, map) then
        if pf.moveTo(map, "Moon") then
            return true
        end
        return assert(talkToNpcOnCell(16,48), "Failed to talk to NPC on Cell 16/48")
    elseif pf.moveTo(map, PokecenterList) then
        return true
    end
    return assert(usePokecenter(), "usePokecenter() failed")
end

return {
    moveToPC = moveToPC,
    useNearestPokecenter = useNearestPokecenter
}
