local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local pf             = require (cppdpath .. "Lib/MoveTo/MoveTo")


local ManiacList = {
	["Item Maniac House"] = {{3, 5}},
}

local ItemList = {
	["Nugget"] = {["option"] = 1},
	["Big Pearl"] = {["option"] = 2},
}

-- move to closest Maniac
local function moveToManiac(map)
    return pf.moveTo(map, ManiacList)
end

-- move to closest Maniac and sell items
local function useNearestManiac(map)
    if pf.moveTo(map, ManiacList) then
        return true
    end
    if not hasItem(ItemList) then
		fatal("You have no items to sell.")
		if hasItem(ItemList) then
			assert(talkToNpcOnCell(ManiacList[1], ManiacList[2]), "Failed to talk to Item Maniac")
			pushDialogAnswer(ItemList["option"])
		end
    end
end

return {
    moveToManiac = moveToManiac,
    useNearestManiac = useNearestManiac
}