local thispath = "aStar/" -- select('1', ...):match(".+%.") or ""

local PQ = require (thispath .. "PQ")
local HOF = require (thispath .. "HOF")

local function backtrack(last, cameFrom)
    local current = last
	local path = {}
    while current ~= nil do
        table.insert(path, 1, current)
        current = cameFrom[current]
	end
	return path
end

local aStar = HOF.curry(function(expand, cost, heuristic, goal, start)
	local open = PQ.new()
	local closed = {}
	local cameFrom = {}
	local tCost = {}

	open:insert(0, start)
	cameFrom[start] = nil
	tCost[start] = 0
	for current in PQ.pop, open do
		if goal(current) then
			return backtrack(current, cameFrom)
		else
			closed[current] = true
			for _, neighbor in pairs(expand(current)) do
				if not closed[neighbor] then
					local tmpCost = tCost[current] + cost(current, neighbor)
					if tCost[neighbor] == nil or tmpCost < tCost[neighbor] then
						cameFrom[neighbor] = current
						tCost[neighbor] = tmpCost
						open:insert(tmpCost + heuristic(neighbor), neighbor)
					end
				end
			end
		end
	end
	return nil
end)

return aStar
