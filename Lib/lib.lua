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
function lib.hasPokemonWithMove(Move)
	for pokemonId=1, getTeamSize(), 1 do
		if hasMove(pokemonId, Move) then
			return true
		end
	end
	return false
end

-- BIKE USAGE --
function lib.useBike()
	if not hasItem("Bicycle") or isMounted() or isSurfing() or not isOutside() then
		return false
	else
		log("Using: Bicycle") -- too much verbose
		if not useItem("Bicycle") then
			log("Error using item : Bicycle.")
		end
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

function lib.mergeTable(table1, table2)
	if type(table1) ~= "table" then
		return error(" mergTable : #1 expected table, recieved " .. type(table1))
	elseif type(table2) ~= "table" then
		return error(" mergTable : #2 expected table, recieved " .. type(table2))
	end
	for key, value in pairs(table2) do
		table1[key] = value
	end
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
function lib.swap(v1, v2) -- swap two var
	local tmp = v1
	v1 = v2
	v2 = tmp
end

return lib