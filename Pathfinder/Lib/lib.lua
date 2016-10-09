local lib = {}

-- IN RECTANGLE --
function lib.inRectangle(UpperX, UpperY, LowerX, LowerY)
	local ActX = getPlayerX()
	local ActY = getPlayerY()
	if (ActX >= UpperX and ActX <= LowerX) and (ActY >= UpperY and ActY <= LowerY) then
		return true
	else
		return false
	end
end

-- STRING SPLIT --> RETURN ARRAY TABLE --
function lib.splitstring(s, delimiter)
    local result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- TABLE LENGTH --
function lib.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- LOG 1 TIME ONLY --
lib.LastMessage = ""
function lib.log1time(msg)
	if lib.LastMessage == msg then
	else
		log(msg)
		lib.LastMessage = msg
	end
end

-- MOVE CHECK --

-- BIKE USAGE --
function lib.useMount(mount)
    if not hasItem(mount) or isMounted() or isSurfing() or not isOutside() then
        return false
    else
        log("Using: " .. mount)
        assert(useItem(mount), "Error using item: " .. mount .. ".")
        return true
    end
end

function lib.getPokemonNumberWithMove(Move, ...) -- optional parameter happiness
	local arg = {...}
	if #arg > 1 then
		return error("getPokemonNumberWithMove too many arguments.")
	end
	for i=1, getTeamSize(), 1 do
		if hasMove(i, Move) and (#arg == 0 or (#arg == 1 and type(arg[1]) == "number" and getPokemonHappiness(i) >= arg[1])) then
			return i
		end
	end
	return 0
end

function lib.logTable(table, ...) -- logTable(table, name) with name as optional parameter
	local name  = nil
	local arg = {...}
	if type(table) ~= "table" then
		return error(" bad argument #1 to logTable, expected table")
	elseif #arg > 1 then
		return error(" logTable expected two parameters at most :: logTable(table, (optional) name)")
	elseif #arg == 1 then
		if type(arg[1]) ~= "string" then
			return error(" bad argument #2 to logTable, expected string")
		end
		name = arg[1]
	end
	for key, value in pairs(table) do
		if name then
			log(name .. " -> Key : " .. key .. ", Value : " .. value)
		else
			log("Key : " .. key .. " --- Value : " .. value)
		end
	end
end

function lib.ifNotThen(anything, call)
	if not anything then
		return call()
	end
end

function lib.pairsByKeys(t, f) -- sort table keys by alpha order or f as alternative order.
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
    	end
	end
	return iter
end

return lib