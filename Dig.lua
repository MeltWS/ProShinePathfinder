name = "Dig"
author = "MeltWS"

description = [[Dig Maps]]

local pf = require "Pathfinder/MoveToApp" -- requesting table with methods
local map = nil

local DigMaps = {
    "Route 15",
    "Route 14",
}

function onPathAction()
    map = getMapName()
    if not pf.moveTo(map, DigMaps[1]) then
        table.remove(DigMaps, 1)
        if DigMaps[1] then
            log("Map " .. map .. ", no more dig to do, moving to:" .. tostring(DigMaps[1]))
            pf.moveTo(map, DigMaps[1])
        else fatal("No more maps to dig")
        end
    end
end

function onBattleAction()
    run()
end

