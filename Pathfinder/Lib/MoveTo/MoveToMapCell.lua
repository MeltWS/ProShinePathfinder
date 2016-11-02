local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local pf             = require (cppdpath .. "Lib/MoveTo/MoveTo")
local SubMaps        = require (cppdpath .. "Maps/MapExceptions/SubstituteMaps")

local function getSubMapWithloc(dest, x ,y)
    for subMap, locs in pairs(SubMaps[dest]) do
        for _, rect in ipairs(locs) do
            if (x >= rect[1] and x <= rect[3]) and (y >= rect[2] and y <= rect[4]) then
                return subMap
            end
        end
    end
    error("Pathfinder -> Location x:" .. x .. "  y:" .. y .. " does not match any sub map for :" .. dest)
end

-- move to a cell on a map
local function moveToMapCell(map, dest, x, y)
    if SubMaps[dest] then
        dest = getSubMapWithloc(dest, x, y)
    end
    if not pf.moveTo(map, dest) then
        if getPlayerX() == x and getPlayerY() == y then
            return false
        end
        return moveToCell(x, y)
    end
    return true
end

return { moveToMapCell = moveToMapCell }