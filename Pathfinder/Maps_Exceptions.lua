local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local lib = require (cdpath .. "Lib/lib")

local ExceRouteEdit = {}
local DescMaps = {}
local PathSolution = nil
local DialogCheck = nil
local DialogChoose = {}
local DigUndiscovered = "I better not venture in"
local TransmatDialogReached = "You are detectedly already in the lobby of Pokecenter"
local TransmatReached = false

local function SetPathSolution(Path)
	PathSolution = Path
end

-- FUNCTION FOR ADD DIALOG AND PUSHDIALOG

local function SolveDialog(message, pf)
	if DialogCheck and message == DialogCheck then
		for value, index in pairs(DialogChoose) do
			pushDialogAnswer(index)
			log("Pushing Dialog: " .. index)
		end
	elseif string.find(message, DigUndiscovered) then -- outlet digway isn't discovered
		DialogCheck = nil
		pf.DisableDigPath()
		pf.SetOutlet(getMapName()) -- pathfinder will check the outlet when possible.
		pf.ResetPath()
	elseif pf.OutletFound(getMapName()) then -- outlet discovered
		pf.SetOutlet(nil)
		pf.EnableDigPath()
		pushDialogAnswer(2) -- not using digway
	elseif string.find(message, TransmatDialogReached) then
		TransmatReached = true
		pushDialogAnswer(2)
	end
end

-- RESOLUTION EXCEPTION FOR MOVE MAP1 TO MAP2 SPEAKING WITH NPC
local function Mode_MoveToCell(MapName,Xh,Yh,Xl,Yl,Xc,Yc)
	if lib.inRectangle(Xh,Yh,Xl,Yl) and MapName == getMapName() then
	    lib.log1time("Exception Resolution:  [ " .. getMapName() .." To " .. PathSolution[1] .." ]  GoTo  X:".. Xc .." Y:" .. Yc)
		moveToCell(Xc,Yc)
	else
		return false
	end
	return true
end

-- RESOLUTION EXCEPTION FOR MOVE MAP1 TO MAP2 SPEAKING WITH NPC
local function Mode_SpeakWithNPC(MapName,Check,Dialogs,cellX,cellY,npcX,npcY)
	DialogCheck = Check
	DialogChoose = Dialogs
	lib.log1time("Exception Resolution:  [ " .. getMapName() .." To " .. PathSolution[1] .." ]  SpeakWithNPC  X:".. cellX .." Y:" .. cellY)
	if (getPlayerX() == cellX) and (getPlayerY() == cellY) and isNpcOnCell(npcX, npcY) == true then
			talkToNpcOnCell(npcX, npcY)
		else
		if MapName == getMapName() then
			moveToCell(cellX,cellY)
		end
	end
end

-- DIGS WAYS EXCEPTION
local function Mode_DigWay(MapName,cellX,cellY,npcX,npcY)
	Mode_SpeakWithNPC(MapName, "Do you want to attempt to use it?", {1,lib.getPokemonNumberWithMove("Dig", 155)}, cellX, cellY, npcX, npcY)
end

-- DIVE EXCEPTION
local function Mode_Dive(MapName, Dialog, cellX,cellY)
	lib.log1time("Exception Resolution:  [ " .. getMapName() .." To " .. PathSolution[1] .." ]  Dive  X:".. cellX .." Y:" .. cellY)
	diveId = lib.getPokemonNumberWithMove("Dive", 155)
	if diveId == 0 then
		return error("Missing pokemon with DIVE")
	end
	if getMapName() == MapName then
	DialogCheck = Dialog
	DialogChoose = {1,diveId}
		moveToCell(cellX, cellY)
	end
end

-- TRANSMAT EXCEPTION
local function Mode_Transmat(destPC, Dialogs)
	local npcX = 4
	local npcY = 4
	local cellX = 4
	local cellY = 5

	if "Transmat Station" == getMapName()  then
		if TransmatReached then
			if getPlayerX() == 9 and getPlayerY() == 9 then
				TransmatReached = false
				return moveToCell(9,10)
			else moveToCell(9,9)
			end
		else
			lib.log1time("Exception Resolution:  [ Transmat Station To " .. PathSolution[1] .." ]  SpeakWithNPC  X:4 Y:4 ")
			if (getPlayerX() == cellX) and (getPlayerY() == cellY) and isNpcOnCell(npcX, npcY) then
				DialogCheck  = "What destination's Pokemon Center would you like to be transmitted to? It will cost $2,500 Pokedollars per travel."
				DialogChoose = Dialogs
				talkToNpcOnCell(npcX, npcY)
			else moveToCell(cellX,cellY)
			end
		end
	else
		return false
	end
end

-- DIG PATH EXCEPTION EDIT
local function EnableDigPath()
	-- Kanto
	DescMaps["Route 10_to_Lavender Town"] = {function() if lib.inRectangle(10,0,24,11) then Mode_DigWay("Route 10",10,9,9,9) elseif Mode_MoveToCell("Route 10", 27,0,30,35,27,0) or Mode_MoveToCell("Route 10", 8,22,26,35,27,0) then return else moveToMap("Lavender Town") end end}
	DescMaps["Route 10_to_Route 9"] = {function() if lib.inRectangle(2,45,29,71) then Mode_DigWay("Route 10",2,45,2,44) else moveToMap("Route 9") end end}
	DescMaps["Route 10_to_Power Plant"] = {function() Mode_MoveToCell("Route 10", 8,0,25,11,22,0) end,function() Mode_MoveToCell("Route 10", 8,21,26,34,15,26) end,function() Mode_MoveToCell("Route 10", 27,0,30,34,15,26) end, function() if lib.inRectangle(2,45,29,71) then Mode_DigWay("Route 10",2,45,2,44) end end}
	-- Johto
	DescMaps["Route 42_to_Mahogany Town"] = {function() if lib.inRectangle(1,14,18,26) then Mode_SpeakWithNPC("Route 42","Do you want to attempt to use it?",{1,lib.getPokemonNumberWithMove("Dig", 155)},15,14,15,13) else moveToMap("Mahogany Town") end end} -- enabling digway route 42 from left to right side
	DescMaps["Route 42_to_Ecruteak Stop House 2"] = {function() if lib.inRectangle(66,14,95,21) then Mode_SpeakWithNPC("Route 42","Do you want to attempt to use it?",{1,lib.getPokemonNumberWithMove("Dig", 155)},77,14,77,13) else moveToMap("Ecruteak Stop House 2") end end} -- enabling digway route 42 from right to left side
end

local function DisableDigPath()
	-- Kanto
	DescMaps["Route 10_to_Lavender Town"] = {function() Mode_MoveToCell("Route 10", 1,43,32,71,16,71) end, function() Mode_MoveToCell("Route 10", 9,0,25,12,11,5) end, function() Mode_MoveToCell("Route 10", 8,22,26,35,27,0) end, function() Mode_MoveToCell("Route 10", 27,0,30,35,27,0) end}
	DescMaps["Route 10_to_Route 9"] = {function() Mode_MoveToCell("Route 10", 1,43,32,71,5,44) end,function() Mode_MoveToCell("Route 10", 9,0,25,12,23,0) end,function() Mode_MoveToCell("Route 10", 6,13,33,35,28,0) end,function() Mode_MoveToCell("Route 10", 26,0,31,12,28,0) end}
	DescMaps["Route 10_to_Power Plant"] = {function() Mode_MoveToCell("Route 10", 8,0,25,11,22,0) end,function() Mode_MoveToCell("Route 10", 8,21,26,34,15,26) end,function() Mode_MoveToCell("Route 10", 27,0,30,34,15,26) end, function() Mode_MoveToCell("Route 10",2,45,32,71,5,44) end}
	-- Johto
	DescMaps["Route 42_to_Mahogany Town"] = {function() Mode_MoveToCell("Route 42", 3,14,18,26,17,13) end, function() Mode_MoveToCell("Route 42", 19,0,95,28,95,17) end}
	DescMaps["Route 42_to_Ecruteak Stop House 2"] = nil

end

-- KANTO SUBWAY EXCEPTION
local SubDestList = {["Viridian City Subway"] = 1, ["Pewter City Subway"] = 2, ["Cerulean City Subway"] = 3, ["Vermilion City Subway"] = 4, ["Lavender Town Subway"] = 5, ["Celadon City Subway"] = 6, ["Fuchsia City Subway"] = 7, ["Saffron City Subway"] = 8, ["Azalea Town Subway"] = 1, ["Blackthorn City Subway"] = 2, ["Cherrygrove City Subway"] = 3, ["Ecruteak City Subway"] = 4, ["Goldenrod City Subway"] = 5, ["Mahogany Town Subway"] = 6, ["Olivine City Subway"] = 7, ["Violet City Subway"] = 8}

local function SubDialogFPage(map1, map2)
	local answer = SubDestList[map2]
	if SubDestList[map1] < answer then
		answer = answer - 1
	end
	return answer < 5
end

local function SolvSubExce(map1, map2)
	lib.log1time("Exception Resolution:  [ Subway To " .. map2  .." ]  SpeakWithNPC  X:10 Y:9 ")
	if SubDialogFPage(map1, map2) then
		DialogChoose = {map2}
	else DialogChoose = {"More Options", map2}
	end
	DialogCheck  = "Where would you like to go? Takes only $2500."
	talkToNpcOnCell(10,9)
end

-- KANTO --

-- TABLE- PATHEDIT FORCE
ExceRouteEdit["1"] = {{"Mt. Moon B1F","Mt. Moon B2F","Mt. Moon Exit"},{"Mt. Moon Exit"}}
ExceRouteEdit["2"] = {{"Mt. Moon B2F","Mt. Moon B1F","Mt. Moon 1F"},{"Mt. Moon B1F","Mt. Moon 1F"}}
ExceRouteEdit["3"] = {{"Rock Tunnel 1","Rock Tunnel 2","Route 9"},{"Rock Tunnel 1","Route 10","Route 9"}}
ExceRouteEdit["4"] = {{"Rock Tunnel 2","Route 9"},{"Rock Tunnel 1","Route 10","Route 9"}}
ExceRouteEdit["5"] = {{"Pokemon Tower B9","Pokemon Tower B10","Pokemon Tower B11"},{"Pokemon Tower B9","Pokemon Tower B11"}}
ExceRouteEdit["6"] = {{"Safari Stop","Safari Effort Wald 1"},{"Safari Stop","Safari Effort Wald 2","Safari Effort Wald 1"}}
ExceRouteEdit["7"] = {{"Safari Effort Wald 1","Safari Effort Wald 2","Safari Stop"},{"Safari Effort Wald 1","Safari Stop"}}
ExceRouteEdit["8"] = {{"Rock Tunnel 1","Route 10","Route 10","Lavender Town"},{"Rock Tunnel 1","Lavender Town"}}
ExceRouteEdit["9"] = {{"Route 9","Route 10","Lavender Town"},{"Route 9","Lavender Town"}}
ExceRouteEdit["10"] = {{"Seafoam 1F","Route 20","Route 19"},{"Seafoam 1F","Route 19"}}
ExceRouteEdit["11"] = {{"Lavender Town","Route 9","Pokecenter Route 10"},{"Lavender Town","Route 10","Route 9","Pokecenter Route 10"}}
ExceRouteEdit["12"] = {{"Tohjo Falls", "Route 27", "Route 26"},{"Tohjo Falls", "Route 26"}}
ExceRouteEdit["23"] = {{"Route 16 Stop House", "Route 16", "Route 17"},{"Route 16 Stop House", "Route 17"}}
ExceRouteEdit["24"] = {{"Route 16 Stop House", "Route 16", "Celadon City"},{"Route 16 Stop House", "Celadon City"}}
ExceRouteEdit["25"] = {{"Bike Road Stop", "Route 18", "Fuchsia City"},{"Bike Road Stop", "Fuchsia City"}}
ExceRouteEdit["26"] = {{"Bike Road Stop", "Route 18", "Route 17"},{"Bike Road Stop", "Route 17"}}
ExceRouteEdit["29"] = {{"Route 9", "Route 10", "Power Plant"},{"Route 9", "Power Plant"}}


-- MOVE TO CELL --
-- DIGLETTS CAVE (VIRIDIAN OR PEWTER CITY)
DescMaps["Route 2_to_Digletts Cave Entrance 1"] = {function() Mode_MoveToCell("Route 2", 6,0,44,90,33,31) end,function() Mode_MoveToCell("Route 2", 3,95,45,130,40,96) end}
DescMaps["Route 2 Stop3_to_Digletts Cave Entrance 1"] = {function() Mode_MoveToCell("Route 2 Stop3", 0,2,7,12,3,2) end}

-- TOHJO FALLS (NEW BARK TOWN OR ROUTE 27)
DescMaps["Route 27_to_Tohjo Falls"] = {function() Mode_MoveToCell("Route 27", 0,13,63,28,56,16) end,function() Mode_MoveToCell("Route 27", 73,0,217,29,74,14) end}
DescMaps["Route 27_to_Route 26"] = {function() Mode_MoveToCell("Route 27", 0,13,63,28,56,16) end, function() Mode_MoveToCell("Route 27", 73,0,217,29,217,23) end}
DescMaps["Route 27_to_New Bark Town"] = {function() Mode_MoveToCell("Route 27", 0,13,63,28,0,20) end, function() Mode_MoveToCell("Route 27", 73,0,217,29,74,14) end}
DescMaps["Tohjo Falls_to_New Bark Town"] = {function() Mode_MoveToCell("Tohjo Falls", 19,27,49,31,23,32) end}
DescMaps["Tohjo Falls_to_Route 26"] = {function() Mode_MoveToCell("Tohjo Falls", 19,27,49,31,46,32) end}

-- ROUTE 2 GO TO (VIRIDIAN OR PEWTER)
DescMaps["Route 2_to_Pewter City"] = {function() Mode_MoveToCell("Route 2", 6,0,44,90,25,0) end,function() Mode_MoveToCell("Route 2", 3,95,45,130,40,96) end}
DescMaps["Route 2 Stop3_to_Pewter City"] = {function() Mode_MoveToCell("Route 2 Stop3", 0,2,7,12,3,2) end}
DescMaps["Route 2_to_Viridian City"] = {function() Mode_MoveToCell("Route 2", 6,0,44,90,39,90) end,function() Mode_MoveToCell("Route 2", 3,95,45,130,8,130) end}
DescMaps["Route 2 Stop3_to_Viridian City"] = {function() Mode_MoveToCell("Route 2 Stop3", 0,2,7,12,4,12) end}

-- MT MOON GO TO (ROUTE 3 OR ROUTE 4)
DescMaps["Mt. Moon 1F_to_Mt. Moon Exit"] = {function() Mode_MoveToCell("Mt. Moon 1F", 19,16,74,64,21,20) end}
DescMaps["Mt. Moon B1F_to_Mt. Moon Exit"] = {function() Mode_MoveToCell("Mt. Moon B1F", 70,14,78,35,56,34) end,function() Mode_MoveToCell("Mt. Moon B1F", 52,28,71,35,56,34) end,function() Mode_MoveToCell("Mt. Moon B1F", 30,18,44,22,41,20) end,function() Mode_MoveToCell("Mt. Moon B1F", 57,18,65,21,65,20) end}
DescMaps["Mt. Moon B2F_to_Mt. Moon Exit"] = {function() Mode_MoveToCell("Mt. Moon B2F", 36,34,71,41,17,27) end,function() Mode_MoveToCell("Mt. Moon B2F", 50,42,71,71,17,27) end,function() Mode_MoveToCell("Mt. Moon B2F", 14,60,49,72,17,27) end,function() Mode_MoveToCell("Mt. Moon B2F", 12,17,27,59,17,27) end}
DescMaps["Mt. Moon B1F_to_Mt. Moon 1F"] = {function() Mode_MoveToCell("Mt. Moon B1F", 70,14,78,35,75,15) end,function() Mode_MoveToCell("Mt. Moon B1F", 52,28,71,35,75,15) end,function() Mode_MoveToCell("Mt. Moon B1F", 30,18,44,22,32,21) end,function() Mode_MoveToCell("Mt. Moon B1F", 17,15,25,17,18,15) end}
DescMaps["Mt. Moon B2F_to_Mt. Moon 1F"] = {function() Mode_MoveToCell("Mt. Moon B2F", 36,34,71,41,38,40) end,function() Mode_MoveToCell("Mt. Moon B2F", 50,42,71,71,38,40) end,function() Mode_MoveToCell("Mt. Moon B2F", 14,60,49,72,38,40) end,function() Mode_MoveToCell("Mt. Moon B2F", 12,17,27,59,38,40) end}

-- ROUTE 4 TO CERULEAN CITY
DescMaps["Route 4_to_Cerulean City"] = {function() Mode_MoveToCell("Route 4", 8,9,96,29,96,21) end}

-- ROUTE 5 TO CERULEAN City
DescMaps["Route 5_to_Cerulean City"] = {function() Mode_MoveToCell("Route 5", 0,0,41,39,13,0) end}

-- SEAFOAM (CINNABAR OR FUCHSIA)
DescMaps["Route 20_to_Seafoam 1F"] = {function() Mode_MoveToCell("Route 20", 55,20,120,34,60,32) end,function() Mode_MoveToCell("Route 20", 0,13,52,47,73,40) end,function() Mode_MoveToCell("Route 20", 53,38,84,45,73,40) end}
DescMaps["Route 20_to_Route 19"] = {function() Mode_MoveToCell("Route 20", 55,20,120,34,120,29) end,function() Mode_MoveToCell("Route 20", 50,39,77,44,73,40) end,function() Mode_MoveToCell("Route 20", 0,0,49,46,73,40) end}
DescMaps["Route 20_to_Cinnabar Island"] = {function() Mode_MoveToCell("Route 20", 0,13,82,46,0,33) end,function() Mode_MoveToCell("Route 20", 55,18,120,37,60,32) end}
DescMaps["Seafoam B1F_to_Cinnabar Island"] = {function() Mode_MoveToCell("Seafoam B1F", 15,9,86,28,85,22) end}
DescMaps["Seafoam B1F_to_Route 19"] = {function() Mode_MoveToCell("Seafoam B1F", 15,9,86,28,15,12) end}
DescMaps["Seafoam 1F_to_Cinnabar Island"] = {function() Mode_MoveToCell("Seafoam 1F", 64,7,78,16,71,15) end,function() Mode_MoveToCell("Seafoam 1F", 7,7,20,16,20,8) end}
DescMaps["Seafoam 1F_to_Route 19"] = {function() Mode_MoveToCell("Seafoam 1F", 6,6,20,16,13,16) end,function() Mode_MoveToCell("Seafoam 1F", 64,7,77,15,64,8) end}
DescMaps["Seafoam B1F_to_Seafoam B2F"] = {function() Mode_MoveToCell("Seafoam B1F", 14,8,88,30,64,25) end}
DescMaps["Seafoam B2F_to_Seafoam B3F"] = {function() Mode_MoveToCell("Seafoam B2F", 9,7,69,34,63,19) end}
DescMaps["Seafoam B3F_to_Seafoam B4F"] = {function() Mode_MoveToCell("Seafoam B3F", 7,4,69,33,57,26) end}

-- ROUTE 9 ,ROUTE 10 AND ROCKTUNNEL 1,2
DescMaps["Route 9_to_Lavender Town"] = {function() Mode_MoveToCell("Route 9", 0,0,100,100,86,33) end}
DescMaps["Rock Tunnel 1_to_Route 10"] = {function() Mode_MoveToCell("Rock Tunnel 1", 5,26,26,33,7,30) end,function() Mode_MoveToCell("Rock Tunnel 1", 5,5,32,17,7,7) end,function() Mode_MoveToCell("Rock Tunnel 1", 32,4,48,19,43,11) end}
DescMaps["Rock Tunnel 2_to_Route 10"] = {function() Mode_MoveToCell("Rock Tunnel 2", 5,12,29,29,10,13) end,function() Mode_MoveToCell("Rock Tunnel 2", 5,4,48,11,36,16) end,function() Mode_MoveToCell("Rock Tunnel 2", 34,12,39,18,36,16) end}
DescMaps["Rock Tunnel 1_to_Route 9"] = {function() Mode_MoveToCell("Rock Tunnel 1", 5,26,26,33,7,30) end,function() Mode_MoveToCell("Rock Tunnel 1", 5,5,32,17,7,7) end,function() Mode_MoveToCell("Rock Tunnel 1", 32,4,48,19,43,11) end}
DescMaps["Rock Tunnel 2_to_Route 9"] = {function() Mode_MoveToCell("Rock Tunnel 2", 5,12,29,29,10,13) end,function() Mode_MoveToCell("Rock Tunnel 2", 5,4,48,11,36,16) end,function() Mode_MoveToCell("Rock Tunnel 2", 34,12,39,18,36,16) end}
DescMaps["Rock Tunnel 1_to_Lavender Town"] = {function() Mode_MoveToCell("Rock Tunnel 1", 5,26,26,33,21,32) end,function() Mode_MoveToCell("Rock Tunnel 1", 5,5,32,17,8,15) end,function() Mode_MoveToCell("Rock Tunnel 1", 32,4,48,19,35,16) end}
DescMaps["Rock Tunnel 2_to_Lavender Town"] = {function() Mode_MoveToCell("Rock Tunnel 2", 5,12,29,29,8,26) end,function() Mode_MoveToCell("Rock Tunnel 2", 5,4,48,11,7,5) end,function() Mode_MoveToCell("Rock Tunnel 2", 34,12,39,18,7,5) end}
DescMaps["Rock Tunnel 1_to_Power Plant"] = {function() Mode_MoveToCell("Rock Tunnel 1", 5,26,26,33,7,30) end,function() Mode_MoveToCell("Rock Tunnel 1", 5,5,32,17,7,7) end,function() Mode_MoveToCell("Rock Tunnel 1", 32,4,48,19,43,11) end}
DescMaps["Rock Tunnel 2_to_Power Plant"] = {function() Mode_MoveToCell("Rock Tunnel 2", 5,12,29,29,10,13) end,function() Mode_MoveToCell("Rock Tunnel 2", 5,4,48,11,36,16) end,function() Mode_MoveToCell("Rock Tunnel 2", 34,12,39,18,36,16) end}

-- POWERPLANT
DescMaps["Route 9_to_Power Plant"] = {function() Mode_MoveToCell("Route 9", 0,0,97,35,92,33) end}
DescMaps["Power Plant_to_Route 9"] = {function() Mode_MoveToCell("Power Plant", 0,0,48,39,5,39) end}
DescMaps["Route 10_to_Pokecenter Route 10"] = {function() Mode_MoveToCell("Route 10", 8,0,25,11,18,4) end,function() Mode_MoveToCell("Route 10", 8,21,26,34,28,0) end,function() Mode_MoveToCell("Route 10", 27,0,30,34,28,0) end}
DescMaps["Route 9_to_Pokecenter Route 10"] = {function() Mode_MoveToCell("Route 9", 0,0,97,35,87,33) end}

-- POKEMON TOWER
DescMaps["Pokemon Tower B3_to_Pokemon Tower B4"] = {function() Mode_MoveToCell("Pokemon Tower B3", 23,17,23,19,23,20) end,function() Mode_MoveToCell("Pokemon Tower B3", 17,19,19,22,17,23) end,function() Mode_MoveToCell("Pokemon Tower B3", 23,20,23,21,23,22) end}
DescMaps["Pokemon Tower B7_to_Pokemon Tower B8"] = {function() Mode_MoveToCell("Pokemon Tower B7", 0,0,99,99,23,17) end}
DescMaps["Pokemon Tower B9_to_Pokemon Tower B11"] = {function() Mode_MoveToCell("Pokemon Tower B9", 17,17,19,21,18,21) end,function() Mode_MoveToCell("Pokemon Tower B9", 21,17,24,21,24,21) end}
DescMaps["Pokemon Tower B10_to_Pokemon Tower B11"] = {function() Mode_MoveToCell("Pokemon Tower B10", 17,16,23,21,23,17) end,function() Mode_MoveToCell("Pokemon Tower B10", 21,22,23,23,23,22) end}
DescMaps["Pokemon Tower B11_to_Pokemon Tower B12"] = {function() Mode_MoveToCell("Pokemon Tower B11", 0,0,99,99,17,17) end}
DescMaps["Pokemon Tower B17_to_Pokemon Tower B18"] = {function() Mode_MoveToCell("Pokemon Tower B17", 19,17,24,20,20,19) end,function() Mode_MoveToCell("Pokemon Tower B17", 17,21,21,23,18,22) end}
DescMaps["Pokemon Tower B18_to_Pokemon Tower B19"] = {function() Mode_MoveToCell("Pokemon Tower B18", 0,0,99,99,23,22) end}
DescMaps["Pokemon Tower B19_to_Pokemon Tower B20"] = {function() Mode_MoveToCell("Pokemon Tower B19", 20,22,23,22,20,21) end,function() Mode_MoveToCell("Pokemon Tower B19", 17,20,20,21,18,20) end,function() Mode_MoveToCell("Pokemon Tower B19", 17,22,19,23,18,20) end}
DescMaps["Pokemon Tower B20_to_Pokemon Tower B21"] = {function() Mode_MoveToCell("Pokemon Tower B20", 17,22,19,23,18,22) end,function() Mode_MoveToCell("Pokemon Tower B20", 20,20,24,23,22,19) end,function() Mode_MoveToCell("Pokemon Tower B20", 17,16,24,19,22,19) end}

-- VICTORY ROAD KANTO
-- not fully supported.
DescMaps["Victory Road Kanto 3F_to_Victory Road Kanto 2F"] = {function() if not Mode_MoveToCell("Victory Road Kanto 3F", 20,14,47,35,29,17) then moveToCell(29,17) end end}
DescMaps["Victory Road Kanto 2F_to_Victory Road Kanto 3F"] = {function() if not Mode_MoveToCell("Victory Road Kanto 2F", 31,23,38,31,33,29) then moveToMap("Victory Road Kanto 3F") end end}
DescMaps["Victory Road Kanto 2F_to_Victory Road Kanto 1F"] = {function() if not Mode_MoveToCell("Victory Road Kanto 2F", 31,23,38,31,33,29) then moveToMap("Victory Road Kanto 1F") end end}

-- ROUTE 16
DescMaps["Route 16_to_Route 17"] = {function() Mode_MoveToCell("Route 16", 70,3,91,21,70,13) end, function() Mode_MoveToCell("Route 16", 25,9,64,40,29,40) end}
DescMaps["Route 16 Stop House_to_Route 17"] = {function() Mode_MoveToCell("Route 16 Stop House", 0,3,20,9,0,6) end}
DescMaps["Route 16_to_Celadon City"] = {function() Mode_MoveToCell("Route 16", 70,3,91,21,90,19) end, function() Mode_MoveToCell("Route 16", 25,9,64,40,64,12) end}
DescMaps["Route 16 Stop House_to_Celadon City"] = {function() Mode_MoveToCell("Route 16 Stop House", 0,3,20,9,20,6) end}
DescMaps["Route 16_to_Route 16 house"] = {function() Mode_MoveToCell("Route 16", 70,3,91,21,70,13) end, function() Mode_MoveToCell("Route 16", 25,9,64,40,31,14) end}
DescMaps["Route 16 Stop House_to_Route 16 house"] = {function() Mode_MoveToCell("Route 16 Stop House", 0,3,20,9,0,6) end}

-- Route 18
DescMaps["Bike Road Stop_to_Fuchsia City"] = {function() Mode_MoveToCell("Bike Road Stop", 0,3,10,10,10,7) end}
DescMaps["Bike Road Stop_to_Route 17"] = {function() Mode_MoveToCell("Bike Road Stop", 0,3,10,10,0,7) end}
DescMaps["Route 18_to_Route 17"] = {function() Mode_MoveToCell("Route 18", 14,0,29,18,17,0) end, function() Mode_MoveToCell("Route 18", 30,15,50,25,35,17) end}
DescMaps["Route 18_to_Fuchsia City"] = {function() Mode_MoveToCell("Route 18", 14,0,29,18,29,17) end, function() Mode_MoveToCell("Route 18", 30,15,50,25,50,17) end}

--Pallet
DescMaps["Player House Pallet_to_Pallet Town"] = {function() Mode_MoveToCell("Player House Pallet", 0,0,13,10,4,10) end}
DescMaps["Pallet Town_to_Player House Pallet"] = {function() Mode_MoveToCell("Pallet Town", 3,0,28,30,6,12) end}

--MT. SILVER
DescMaps["Mt. Silver 1F_to_Mt. Silver 2F"] = {function() Mode_MoveToCell("Mt. Silver 1F", 41,46,57,63,56,47) end, function() Mode_MoveToCell("Mt. Silver 1F", 35,15,58,44,36,16) end}
DescMaps["Mt. Silver Lower Mountainside_to_Mt. Silver 1F"] = {function() Mode_MoveToCell("Mt. Silver Lower Mountainside", 11,6,24,42,18,28) end}
DescMaps["Mt. Silver 2F_to_Mt. Silver Upper Mountainside"] = {function() Mode_MoveToCell("Mt. Silver 2F", 16,13,46,46,32,14) end, function() Mode_MoveToCell("Mt. Silver 2F", 48,31,52,47,51,45) end}
DescMaps["Mt. Silver Upper Mountainside_to_Mt. Silver 3F"] = {function() Mode_MoveToCell("Mt. Silver Upper Mountainside", 22,22,41,44,39,43) end, function() Mode_MoveToCell("Mt. Silver Upper Mountainside", 9,48,41,63,14,49) end}
DescMaps["Mt. Silver Upper Mountainside_to_Mt. Silver 2F"] = {function() Mode_MoveToCell("Mt. Silver Upper Mountainside", 9,48,41,63,39,56) end, function() Mode_MoveToCell("Mt. Silver Upper Mountainside", 22,22,41,44,22,25) end}
DescMaps["Mt. Silver 2F_to_Mt. Silver 1F"] = {function() Mode_MoveToCell("Mt. Silver 2F", 48,31,52,47,51,32) end, function() Mode_MoveToCell("Mt. Silver 2F", 16,13,46,46,32,35) end}
DescMaps["Mt. Silver 1F_to_Mt. Silver Exterior"] = {function() Mode_MoveToCell("Mt. Silver 1F", 42,46,57,64,45,63) end, function() Mode_MoveToCell("Mt. Silver 1F", 41,41,59,46,58,43) end, function() Mode_MoveToCell("Mt. Silver 1F", 16,15,41,53,58,43) end}
DescMaps["Mt. Silver Lower Mountainside_to_Mt. Silver Exterior"] = {function() Mode_MoveToCell("Mt. Silver Lower Mountainside", 11,6,24,42,22,34) end}
DescMaps["Mt. Silver 1F_to_Mt. Silver Expert Belt"] = {function() Mode_MoveToCell("Mt. Silver 1F", 41,46,57,63,56,47) end, function() Mode_MoveToCell("Mt. Silver 1F", 16,15,41,53,40,48) end, function() Mode_MoveToCell("Mt. Silver 1F", 41,41,59,46,40,48) end}


-- SPEAK WITH NPC --
-- SAFARI KANTO ALL MAPS
DescMaps["Safari Stop_to_Safari Entrance"] = {function() Mode_SpeakWithNPC("Safari Stop","Hello! Welcome to the safari zone!",{1},6,5,6,4) end}
DescMaps["Safari Entrance_to_Safari Stop"] = {function() Mode_SpeakWithNPC("Safari Entrance","NoNeed",{1},27,24,27,25) end}
DescMaps["Safari Area 3_to_Safari Exclusive"] = {function() Mode_SpeakWithNPC("Safari Area 3","NoNeed",{1},17,33,17,34) end}
DescMaps["Safari Exclusive_to_Safari Area 3"] = {function() Mode_SpeakWithNPC("Safari Exclusive","NoNeed",{1},21,4,21,3) end}
DescMaps["Safari Stop_to_Safari Effort Wald 2"] = {function() Mode_SpeakWithNPC("Safari Stop","Hello! Welcome to the safari zone!",{2},7,5,7,4) end}
DescMaps["Safari Effort Wald 2_to_Safari Effort Wald 1"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 2","NoNeed",{1},8,27,8,28) end}
DescMaps["Safari Effort Wald 1_to_Safari Effort Wald 2"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 1","NoNeed",{1},6,22,6,21) end}
DescMaps["Safari Effort Wald 2_to_Safari Stop"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 2","Hello. How may I help you?",{3,1},8,27,8,28) end}
DescMaps["Safari Effort Wald 1_to_Safari Stop"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 1","Hello. How may I help you?",{3,1},6,22,6,21) end}

-- LEAGUE ABRA TP
DescMaps["Indigo Plateau Center_to_Player Bedroom Pallet"] = {function() Mode_SpeakWithNPC("Indigo Plateau Center","Do you want to use my Abra's powers?",{1},13,24,13,23) end}


-- DIGWAYS
DescMaps["Route 2 Stop3_to_Route 11"] = {function() Mode_MoveToCell("Route 2 Stop3", 0,2,7,12,3,2) end}
DescMaps["Route 2_to_Route 11"] = {function() if lib.inRectangle(6,0,44,90) then Mode_DigWay("Route 2",30,32,30,31) end end,function() Mode_MoveToCell("Route 2", 3,95,45,130,40,96) end}
DescMaps["Route 11_to_Route 2"] = {function() Mode_DigWay("Route 11",12,13,12,12) end}
DescMaps["Route 4_to_Route 3"] = {function() Mode_DigWay("Route 4",10,20,9,20) end}
DescMaps["Route 3_to_Route 4"] = {function() Mode_DigWay("Route 3",74,17,74,16) end}

-- TRAIN STATION TO JOHTO
DescMaps["Saffron City Station_to_Saffron City"] = {function() if lib.inRectangle(0,0,13,7) then Mode_SpeakWithNPC("Saffron City Station","Would you like to return",{1},9,6,9,7) else moveToMap("Saffron City") end end}
DescMaps["Saffron City Station_to_Saffron City Station Floor 2"] = {function() if lib.inRectangle(0,0,13,7) then moveToMap("Saffron City Station Floor 2") else Mode_SpeakWithNPC("Saffron City Station","Would you like to take the train?",{1},9,10,9,9) end end}
DescMaps["Saffron City Station Floor 2_to_Goldenrod City Station Floor 2"] = {function() Mode_SpeakWithNPC("Saffron City Station Floor 2","Where do you want to go?",{1},14,11,14,10) end}

-- JOHTO --

-- TABLE- PATHEDIT FORCE
-- ExceRouteEdit[""] = {{""},{""}}
ExceRouteEdit["13"] = {{"Mt. Mortar 1F", "Route 42", "Mahogany Town"},{"Mt. Mortar 1F", "Mahogany Town"}}
ExceRouteEdit["14"] = {{"Mt. Mortar Lower Cave", "Mt. Mortar 1F", "Route 42", "Mahogany Town"},{"Mt. Mortar Lower Cave", "Mahogany Town"}}
ExceRouteEdit["15"] = {{"Route 32", "Union Cave 1F", "Ruins Of Alph"},{"Route 32", "Union Cave 1F", "Union Cave B2F", "Union Cave 1F", "Ruins Of Alph"}}
ExceRouteEdit["16"] = {{"Route 33", "Union Cave 1F", "Ruins Of Alph"},{"Route 33", "Union Cave 1F", "Union Cave B2F", "Union Cave 1F", "Ruins Of Alph"}}
ExceRouteEdit["17"] = {{"Ice Path B1F", "Ice Path 1F", "Blackthorn City"},{"Ice Path B1F", "Blackthorn City"}}
ExceRouteEdit["18"] = {{"Ice Path B1F", "Ice Path 1F", "Route 44"},{"Ice Path B1F", "Route 44"}}
ExceRouteEdit["19"] = {{"Ice Path B2F", "Ice Path B1F", "Ice Path 1F", "Blackthorn City"},{"Ice Path B2F", "Blackthorn City"}}
ExceRouteEdit["20"] = {{"Ice Path B2F", "Ice Path B1F", "Ice Path 1F", "Route 44"},{"Ice Path B2F", "Route 44"}}
ExceRouteEdit["21"] = {{"Ice Path B3F", "Ice Path B2F", "Ice Path B1F", "Ice Path 1F", "Blackthorn City"},{"Ice Path B3F", "Blackthorn City"}}
ExceRouteEdit["22"] = {{"Ice Path B3F", "Ice Path B2F", "Ice Path B1F", "Ice Path 1F", "Route 44"},{"Ice Path B3F", "Route 44"}}

-- MOVE TO CELL --
--ROUTE 42 to Ecruteak or Mahogany.
DescMaps["Mt. Mortar 1F_to_Mahogany Town"] = {function() Mode_MoveToCell("Mt. Mortar 1F", 56,36,67,45,65,46) end, function() Mode_MoveToCell("Mt. Mortar 1F", 53,36,56,36,65,46) end, function() Mode_MoveToCell("Mt. Mortar 1F", 21,35,31,45,34,35) end, function() Mode_MoveToCell("Mt. Mortar 1F", 32,36,34,36,34,35) end, function() if isSurfing() then Mode_MoveToCell("Mt. Mortar 1F", 33,32,54,48,43,49) else Mode_MoveToCell("Mt. Mortar 1F", 40,42,45,48,43,49) end end}
DescMaps["Mt. Mortar Lower Cave_to_Mahogany Town"] = {function() Mode_MoveToCell("Mt. Mortar Lower Cave", 10,0,66,57,47,57) end}

--Route 47 to Cliff Edge Gate or Route 48 or Cliff Cave B1F
DescMaps["Route 47_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,89,74) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,89,74) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,89,74) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,89,74) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,66,70,68,69,65) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,69,65) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,69,65) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,69,65) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,69,65) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Route 47_to_Route 48"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,68,71) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,68,71) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,68,71) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,68,71) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,66,70,68,33,0) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,33,0) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,33,0) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,33,0) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,33,0) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Route 47_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Route 47", 65,72,93,80,68,71) end, function() Mode_MoveToCell("Route 47", 76,81,84,83,68,71) end, function() Mode_MoveToCell("Route 47", 55,74,64,76,68,71) end, function() Mode_MoveToCell("Route 47", 41,72,54,81,68,71) end--[[Between Cliff Cave 1F and Cliff Edge]], function() if isSurfing() then Mode_MoveToCell("Route 47", 19,63,98,95,67,83) end end, function() Mode_MoveToCell("Route 47", 65,84,68,86,67,83) end--[[Water route 47 Downside]], function() Mode_MoveToCell("Route 47", 41,68,70,68,69,65) end, function() Mode_MoveToCell("Route 47", 41,69,41,72,69,65) end, function() Mode_MoveToCell("Route 47", 12,73,41,75,69,65) end, function() Mode_MoveToCell("Route 47", 12,60,15,72,69,65) end, function() Mode_MoveToCell("Route 47", 6,0,38,59,69,65) end--[[Between Cliff Cave 2F and Route 48]]}
DescMaps["Cliff Cave 1F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,17,18) end}
DescMaps["Cliff Cave 1F_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,21,15) end}
DescMaps["Cliff Cave 1F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave 1F", 12,12,23,17,14,13) end}
DescMaps["Cliff Cave 2F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,18,22) end}
DescMaps["Cliff Cave 2F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,13,13) end}
DescMaps["Cliff Cave 2F_to_Cliff Cave B1F"] = {function() Mode_MoveToCell("Cliff Cave 2F", 12,12,20,21,13,13) end}
DescMaps["Cliff Cave B1F_to_Route 48"] = {function() Mode_MoveToCell("Cliff Cave B1F", 12,12,17,20,15,13) end}
DescMaps["Cliff Cave B1F_to_Cliff Edge Gate"] = {function() Mode_MoveToCell("Cliff Cave B1F", 12,12,17,20,15,13) end}

--Route 43
DescMaps["Route 43_to_Lake of Rage"] = {function() Mode_MoveToCell("Route 43", 0,0,40,63,21,0) end}

--Union Cave
DescMaps["Union Cave 1F_to_Union Cave B1F"] = {function() Mode_MoveToCell("Union Cave 1F", 18,30,44,83,19,31) end, function() Mode_MoveToCell("Union Cave 1F", 18,15,24,17,23,16) end}
DescMaps["Union Cave 1F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave 1F", 18,30,44,83,19,31) end, function() Mode_MoveToCell("Union Cave 1F", 18,15,24,17,19,18) end}
DescMaps["Union Cave B1F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave B1F", 15,15,44,49,16,24) end}
DescMaps["Union Cave B1F_to_Union Cave 1F"] = {function() Mode_MoveToCell("Union Cave B1F", 15,15,44,49,43,48) end}
DescMaps["Union Cave B2F_to_Ruins Of Alph"] = {function() Mode_MoveToCell("Union Cave B2F", 18,20,28,29,18,20) end}

--Ice Path
DescMaps["Ice Path 1F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path 1F", 50,21,58,45,57,46) end, function() Mode_MoveToCell("Ice Path 1F", 10,15,49,61,57,15) end, function() Mode_MoveToCell("Ice Path 1F", 51,13,58,20,57,15) end}
DescMaps["Ice Path 1F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path 1F", 50,21,58,45,57,28) end, function() Mode_MoveToCell("Ice Path 1F", 10,15,49,61,12,62) end, function() Mode_MoveToCell("Ice Path 1F", 51,13,58,20,12,62) end}
DescMaps["Ice Path B1F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B1F", 13,12,40,29,21,25) end, function() Mode_MoveToCell("Ice Path B1F", 17,41,41,50,18,44) end}
DescMaps["Ice Path B1F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B1F", 13,12,40,29,16,28) end, function() Mode_MoveToCell("Ice Path B1F", 17,41,41,50,40,42) end}
DescMaps["Ice Path B2F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B2F", 12,13,35,30,23,22) end, function() Mode_MoveToCell("Ice Path B2F", 49,9,65,30,50,27) end}
DescMaps["Ice Path B2F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B2F", 12,13,35,30,33,17) end, function() Mode_MoveToCell("Ice Path B2F", 49,9,65,30,57,11) end}
DescMaps["Ice Path B3F_to_Blackthorn City"] = {function() Mode_MoveToCell("Ice Path B3F", 11,8,34,19,32,17) end}
DescMaps["Ice Path B3F_to_Route 44"] = {function() Mode_MoveToCell("Ice Path B3F", 11,8,34,19,13,16) end}

-- SPEAK WITH NPC --
-- DIGWAYS
DescMaps["Route 31_to_Route 45"] = {function() Mode_DigWay("Route 31", 53,11,53,10) end}
DescMaps["Route 45_to_Route 31"] = {function() Mode_DigWay("Route 45", 14,6,14,5) end}
DescMaps["Route 32_to_Route 33"] = {function() Mode_DigWay("Route 32", 11,143,10,143) end}
DescMaps["Route 33_to_Route 32"] = {function() Mode_DigWay("Route 33", 14,14,14,13) end}
DescMaps["Blackthorn City_to_Route 44"] = {function() Mode_DigWay("Blackthorn City", 49,17,49,16) end}
DescMaps["Route 44_to_Blackthorn City"] = {function() Mode_DigWay("Route 44", 73,10,73,9) end}

-- TRAIN STATION TO KANTO
DescMaps["Goldenrod City Station_to_Goldenrod City"] = {function() if lib.inRectangle(0,0,13,7) then Mode_SpeakWithNPC("Goldenrod City Station","Would you like to return",{1},9,6,9,7) else moveToMap("Goldenrod City") end end}
DescMaps["Goldenrod City Station_to_Goldenrod City Station Floor 2"] = {function() if lib.inRectangle(0,0,13,7) then moveToMap("Goldenrod City Station Floor 2") else Mode_SpeakWithNPC("Goldenrod City Station","Would you like to take the train?",{1},9,10,9,9) end end}
DescMaps["Goldenrod City Station Floor 2_to_Saffron City Station Floor 2"] = {function() Mode_SpeakWithNPC("Goldenrod City Station Floor 2","Where do you want to go?",{1},14,11,14,10) end}


-- DescMaps["Safari Effort Wald 1_to_Safari Stop"] = {function() Mode_SpeakWithNPC("Safari Effort Wald 1","Hello. How may I help you?",{3,1},6,22,6,21) end}

-- HOENN --

-- TABLE-- PATHEDIT FORCE
ExceRouteEdit["23"] = {{"Petalburg Woods", "Route 104", "Rustboro City"},{"Petalburg Woods", "Rustboro City"}}
ExceRouteEdit["24"] = {{"Petalburg Woods", "Route 104", "Petalburg City"},{"Petalburg Woods", "Petalburg City"}}
ExceRouteEdit["25"] = {{"Petalburg Woods", "Route 104", "Route 105"},{"Petalburg Woods", "Route 105"}}
-- ExceRouteEdit[""] = {{""},{""}}

-- MOVE TO CELL --
-- Route 104 and Petalburg Woods
DescMaps["Route 104_to_Rustboro City"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,36,79) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,40,0) end}
DescMaps["Route 104_to_Route 105"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,47,148) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,23,51) end}
DescMaps["Route 104_to_Petalburg City"] = {function() Mode_MoveToCell("Route 104", 7,79,78,148,78,110) end, function() Mode_MoveToCell("Route 104", 7,0,67,51,23,51) end}
DescMaps["Petalburg Woods_to_Rustboro City"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,22,0) end}
DescMaps["Petalburg Woods_to_Route 105"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,51,60) end}
DescMaps["Petalburg Woods_to_Petalburg City"] = {function() Mode_MoveToCell("Petalburg Woods", 7,0,67,60,51,60) end}
-- Route 116
DescMaps["Route 116_to_Rusturf Tunnel"] = {function() Mode_MoveToCell("Route 116", 0,10,79,29,62,19) end, function() Mode_MoveToCell("Route 116", 85,10,119,31,87,22) end}
-- Rusturf Tunnel
DescMaps["Rusturf Tunnel_to_Verdanturf Town"] = {function() Mode_MoveToCell("Rusturf Tunnel", 9,5,38,32,35,26) end}
DescMaps["Rusturf Tunnel_to_Route 116"] = {function() Mode_MoveToCell("Rusturf Tunnel", 9,5,38,32,11,19) end}
-- Route 112 and Fiery Path
DescMaps["Route 112_to_Route 111 South"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,45,58) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,45,58) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,45,58) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Route 111 North"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,8,43) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,8,43) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,8,43) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,45,11) end}
DescMaps["Route 112_to_Lavaridge Town"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,0,59) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Jagged Pass"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,11,55) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Route 112_to_Cable Car Station 1"] = {function() Mode_MoveToCell("Route 112", 15,52,45,67,29,33) end, function() Mode_MoveToCell("Route 112", 6,30,32,51,29,33) end, function() Mode_MoveToCell("Route 112", 0,56,14,71,29,33) end, function() Mode_MoveToCell("Route 112", 14,7,45,19,16,13) end}
DescMaps["Fiery Path_to_Route 111 South"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Route 111 North"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,38,8) end}
DescMaps["Fiery Path_to_Lavaridge Town"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Jagged Pass"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Fiery Path_to_Cable Car Station 1"] = {function() Mode_MoveToCell("Fiery Path", 3,3,41,55,36,48) end}
DescMaps["Cable Car Station 2_to_Lavaridge Town"] = {function() Mode_MoveToCell("Cable Car Station 2", 0,6,11,9,3,9) end}
DescMaps["Cable Car Station 2_to_Jagged Pass"] = {function() Mode_MoveToCell("Cable Car Station 2", 0,6,11,9,3,9) end}
DescMaps["Mt. Chimney_to_Lavaridge Town"] = {function() Mode_MoveToCell("Mt. Chimney", 11,0,56,50,32,50) end}
DescMaps["Mt. Chimney_to_Jagged Pass"] = {function() Mode_MoveToCell("Mt. Chimney", 11,0,56,50,32,50) end}
DescMaps["Jagged Pass_to_Lavaridge Town"] = {function() Mode_MoveToCell("Jagged Pass", 0,0,40,110,21,110) end}
-- Victory Road HOENN
DescMaps["Ever Grande City_to_Route 128"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,30,34) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,0,103) end}
DescMaps["Ever Grande City_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,31,9) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,27,56) end}
DescMaps["Ever Grande City_to_Pokecenter Ever Grande City"] = {function() Mode_MoveToCell("Ever Grande City", 10,3,46,42,30,34) end, function() Mode_MoveToCell("Ever Grande City", 0,56,51,117,45,64) end}
DescMaps["Victory Road Hoenn 1F_to_Route 128"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,21,55) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,21,55) end}
DescMaps["Victory Road Hoenn 1F_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,9,17) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,46,10) end}
DescMaps["Victory Road Hoenn 1F_to_Pokecenter Ever Grande City"] = {function() Mode_MoveToCell("Victory Road Hoenn 1F", 4,15,48,55,21,55) end, function() Mode_MoveToCell("Victory Road Hoenn 1F", 33,5,48,13,21,55) end}
DescMaps["Victory Road Hoenn B1F_to_Pokemon League Hoenn"] = {function() Mode_MoveToCell("Victory Road Hoenn B1F", 4,4,58,80,46,7) end}
-- Route 134
DescMaps["Route 134_to_Route 133"] = {function() Mode_MoveToCell("Route 134", 16,2,55,30,55,2) end, function() Mode_MoveToCell("Route 134", 0,2,15,30,0,6) end}
-- SKY PILLAR --
DescMaps["Sky Pillar Entrance_to_Sky Pillar 1F"] = {function() Mode_MoveToCell("Sky Pillar Entrance", 13,30,37,48,26,32) end, function() Mode_MoveToCell("Sky Pillar Entrance", 25,7,36,26,27,6) end}
DescMaps["Sky Pillar Entrance Cave 1F_to_Sky Pillar Entrance"] = {function() Mode_MoveToCell("Sky Pillar Entrance Cave 1F", 5,2,18,16,17,6) end}
DescMaps["Sky Pillar 3F_to_Sky Pillar 4F"] = {function() Mode_MoveToCell("Sky Pillar 3F", 1,5,14,11,3,6) end}
DescMaps["Sky Pillar Entrance_to_Route 131"] = {function() Mode_MoveToCell("Sky Pillar Entrance", 25,7,36,26,35,23) end, function() Mode_MoveToCell("Sky Pillar Entrance", 13,30,37,49,26,49) end}
DescMaps["Sky Pillar Entrance Cave 1F_to_Route 131"] = {function() Mode_MoveToCell("Sky Pillar Entrance Cave 1F", 5,2,18,18,7,17) end}

-- SPEAK WITH NPC --
-- Cable Car Station
DescMaps["Cable Car Station 1_to_Cable Car Station 2"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 1_to_Lavaridge Town"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 1_to_Jagged Pass"] = {function() Mode_SpeakWithNPC("Cable Car Station 1","Do you want to be taken to the top",{1},10,7,10,6) end}
DescMaps["Cable Car Station 2_to_Cable Car Station 1"] = {function() Mode_SpeakWithNPC("Cable Car Station 2","Do you want to be taken to the bottom",{1},10,7,10,6) end}

-- DIVE
DescMaps["Route 126_to_Route 126 Underwater"] = {function() Mode_Dive("Route 126", "Do you want to Dive here?", 15,71) end}
DescMaps["Route 126 Underwater_to_Route 126"] = {function() if getMapName() == "Route 126 Underwater" then moveToCell(15,71) end end}
DescMaps["Sootopolis City_to_Sootopolis City Underwater"] = {function() Mode_Dive("Sootopolis City", "Do you want to Dive here?", 50,91) end}
DescMaps["Sootopolis City Underwater_to_Sootopolis City"] = {function() Mode_Dive("Sootopolis City Underwater", "Do you want to go to the surface?", 17,11) end}

-- PC TO TRANSMAT
DescMaps["Pokecenter Verdanturf_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Verdanturf","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Sootopolis_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Sootopolis","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Slateport_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Slateport","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Rustboro City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Rustboro City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Petalburg City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Petalburg City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Pacifidlog Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Pacifidlog Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Oldale Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Oldale Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Mossdeep City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Mossdeep City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Mauville City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Mauville City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Lilycove City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Lilycove City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Lavaridge Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Lavaridge Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Fortree City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Fortree City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Fallarbor Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Fallarbor Town","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Ever Grande City_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Ever Grande City","Can you present to me your registered",{1},8,5,8,4) end}
DescMaps["Pokecenter Dewford Town_to_Transmat Station"] = {function() Mode_SpeakWithNPC("Pokecenter Dewford Town","Can you present to me your registered",{1},8,5,8,4) end}

--TRANSMAT TO PC
DescMaps["Transmat Station_to_Pokecenter Verdanturf"] = {function() Mode_Transmat("Pokecenter Verdanturf", {6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Sootopolis"] = {function() Mode_Transmat("Pokecenter Sootopolis", {6,6,4}) end}
DescMaps["Transmat Station_to_Pokecenter Slateport"] = {function() Mode_Transmat("Pokecenter Slateport", {5}) end}
DescMaps["Transmat Station_to_Pokecenter Rustboro City"] = {function() Mode_Transmat("Pokecenter Rustboro City", {3}) end}
DescMaps["Transmat Station_to_Pokecenter Petalburg City"] = {function() Mode_Transmat("Pokecenter Petalburg City", {2}) end}
DescMaps["Transmat Station_to_Pokecenter Pacifidlog Town"] = {function() Mode_Transmat("Pokecenter Pacifidlog Town", {6,6,6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Oldale Town"] = {function() Mode_Transmat("Pokecenter Oldale Town", {1}) end}
DescMaps["Transmat Station_to_Pokecenter Mossdeep City"] = {function() Mode_Transmat("Pokecenter Mossdeep City", {6,6,3}) end}
DescMaps["Transmat Station_to_Pokecenter Mauville City"] = {function() Mode_Transmat("Pokecenter Mauville City", {6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Lilycove City"] = {function() Mode_Transmat("Pokecenter Lilycove City", {6,6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Lavaridge Town"] = {function() Mode_Transmat("Pokecenter Lavaridge Town", {6,4}) end}
DescMaps["Transmat Station_to_Pokecenter Fortree City"] = {function() Mode_Transmat("Pokecenter Fortree City", {6,6,1}) end}
DescMaps["Transmat Station_to_Pokecenter Fallarbor Town"] = {function() Mode_Transmat("Pokecenter Fallarbor Town", {6,3}) end}
DescMaps["Transmat Station_to_Pokecenter Ever Grande City"] = {function() Mode_Transmat("Pokecenter Ever Grande City", {6,6,6,2}) end}
DescMaps["Transmat Station_to_Pokecenter Dewford Town"] = {function() Mode_Transmat("Pokecenter Dewford Town", {4}) end}

-- IN BETWEEN REGIONS --
-- BOAT PATHS  --
DescMaps["Olivine City_to_Lilycove City Harbor"] = {function() Mode_SpeakWithNPC("Olivine City","Where do you want to go, mate?",{2,1},17,46,17,47) end}
DescMaps["Vermilion City_to_Lilycove City Harbor"] = {function() Mode_SpeakWithNPC("Vermilion City","you want to go to Lilycove City?",{1},40,67,40,68) end}
DescMaps["Lilycove City Harbor_to_Olivine City"] = {function() Mode_SpeakWithNPC("Lilycove City Harbor","Where do you want to go?",{3,1},8,9,8,10) end}
DescMaps["Lilycove City Harbor_to_Vermilion City"] = {function() Mode_SpeakWithNPC("Lilycove City Harbor","Where do you want to go?",{2,1},8,9,8,10) end}

--DescMaps[" "] = {function() Mode_MoveToCell(" ", ,,,,,) end}
--DescMaps[" "] = {function() Mode_SpeakWithNPC("","",{},,,,) end}

return {
	ExceRouteEdit = ExceRouteEdit,
	DescMaps = DescMaps,
	SetPathSolution = SetPathSolution,
	EnableDigPath = EnableDigPath,
	DisableDigPath = DisableDigPath,
	SolvSubExce = SolvSubExce,
	SolveDialog = SolveDialog
}
