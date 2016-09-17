local lib = require "Lib/lib"
local MapExceptions = require "Maps_Exceptions"
local DescMaps = MapExceptions.DescMaps
local ExceRouteEdit = MapExceptions.ExceRouteEdit
local GlobalMap = require "Maps/GlobalMap"
local PathSolution = {}
local PathDestStore = ""
-----------------------------------
--- DIJKSTRA CODE PATHFINDING   ---
-----------------------------------

local Settings = nil
local NodesIndex = nil
local Nodes = nil
local Edges = nil
local StartNode = nil

local push = table.insert

local function NewNode(name)
	local node = {}
	node.name = name
	node.Pre = nil
	node.Dist = -1
	node.vis = false
	push(Nodes,node)
	NodesIndex[name] = #Nodes
end

local function NewEdge(Node1,Node2,EdgeVal)
	local edge = {}
	edge.N1 = Node1
	edge.N2 = Node2
	edge.Dist = EdgeVal
	push(Edges,edge)
end

function setEdge(n1, n2, dist)
	for k, edge in ipairs(Edges) do
		if edge.N1 == n1 and edge.N2 == n2 then
			edge.Dist = dist
			return
		end
	end
	NewEdge(n1, n2, dist)
end

function unsetEdge(n1, n2, dist)
	for k, edge in ipairs(Edges) do
		if edge.N1 == n1 and edge.N2 == n2 then
			table.remove(Edges, k)
			return
		end
	end
end

local function SetStartNode(name)
    if not Nodes[NodesIndex[name]] then return error("Could not find starting position on the map.") end -- in case the algorithm is called from a map not referenced.
	Nodes[NodesIndex[name]].Dist = 0
	StartNode = name
end

local function EdgeConnectsNodes(E,N1,N2)
	return E.N1 == N1 and E.N2 == N2
end

local function GetDistance(N1,N2)
	for i=1,#Edges,1 do
		if EdgeConnectsNodes(Edges[i],N1,N2) then
			return Edges[i].Dist
		end
	end
	return -1
end

local function GetNumOfUnVisNodes()
	local NOUVN = 0
	for i=1,#Nodes,1 do
		if not Nodes[i].vis then
			NOUVN = NOUVN + 1
		end
	end
	return NOUVN
end

local function GetAllAdjcentNodes(N,AdjNodes)
	for i=1,#Edges,1 do
		if Edges[i].N1 == N and not Nodes[NodesIndex[Edges[i].N2]].vis then
			push(AdjNodes,Edges[i].N2)
		end
	end
end

local function VisitClosestNode()
	local index=0
	local Dist=0
	for i=1,#Nodes,1 do
		if not Nodes[i].vis and Nodes[i].Dist >= 0 then
			Dist = Nodes[i].Dist
			index=i
			break
		end
	end
	for i=1,#Nodes,1 do
		if Nodes[i].Dist < Dist and not Nodes[i].vis and Nodes[i].Dist >= 0 then
			Dist = Nodes[i].Dist
			index = i
		end
	end
	if not Nodes[index] then
		error("Could not find ClosestNode node, probably a map error")
	end
	Nodes[index].vis = true
	return index
end

local function Dijkstras()
	while GetNumOfUnVisNodes()>0 do
		local ClosetsNode = Nodes[VisitClosestNode()]
		local MyAdjNodes = {}
		GetAllAdjcentNodes(ClosetsNode.name,MyAdjNodes)
		if #MyAdjNodes ~= 0 then
		for i=1,#MyAdjNodes,1  do	
			local Distance = ClosetsNode.Dist + GetDistance(ClosetsNode.name,MyAdjNodes[i])
			local AdjNode = Nodes[NodesIndex[MyAdjNodes[i]]]
			if AdjNode.Dist >= 0 then
				if Distance < AdjNode.Dist then
					AdjNode.Dist = Distance
					AdjNode.Pre = ClosetsNode.name
				end
			else
				AdjNode.Dist = Distance
				AdjNode.Pre = ClosetsNode.name
			end
		end
	end
	end
end

local function GetPathTo(N,Path)
	local CN = N
	while CN~=StartNode and Nodes[NodesIndex[CN]] do
		local Temp = CN
		push(Path,1,Temp)
		CN = Nodes[NodesIndex[CN]].Pre
	end
	if not Nodes[NodesIndex[CN]] then return error("Pathfinder : " .. N .. " does not exist in the MAP.") end
	push(Path,1,StartNode)
end

local function initNodes()
	if Nodes then return end
	Nodes = {}
	Edges = {}
	NodesIndex = {}
	StartNode = {}
	for node, links in pairs(GlobalMap) do
		NewNode(node)
		for dest, dist in pairs(links) do
			NewEdge(node, dest, dist)
		end
	end
end

---------------------------
--- EXCEPTION  HANDLING ---
---------------------------

-- CALL FUNCTION ON EXCEPTION TABLE
local function SolvingException(EMap)
	for index, value in pairs(DescMaps) do
		if index == EMap then
			MapExceptions.SetPathSolution(PathSolution)
			-- CHECK MODE
			--Res = tonumber(tablelength(DescMaps[index]))
			for val, func in pairs(DescMaps[index]) do
				if DescMaps[index][val]() == false then
					return
				end 
			end
		end
	end
end

-- CHECK EXCEPTION MAP1 TO MAP2    - IF FOUND CALL RESOLUTION EXCEPTION
local function CheckException(EMap)
	for index, value in pairs(DescMaps) do	
		if index == EMap then	
			SolvingException(EMap)
			return true
		end
	end
end

-- FUNCTION NO BULTIN FOR ADD VALUE ON A TABLE
local function replacepath(startpos, endpos, namexc)
	local temppath = {}
	for posS=1,(startpos-1) do	
		table.insert(temppath,PathSolution[posS])
	end
	for posex, val in pairs(ExceRouteEdit[namexc][1]) do
		table.insert(temppath,ExceRouteEdit[namexc][2][posex])
	end
	for posE=1,(lib.tablelength(PathSolution) - endpos) do
		table.insert(temppath,PathSolution[(endpos + posE)])
	end
	--log("Orginal: ".. table.concat(PathSolution,"",""))
	PathSolution = temppath
end

-- EDIT PATH FOR NO EDIT BASIC MAP TABLE
local function EditPathGenerated()
	local found = false
	for val, zone in pairs(PathSolution) do -- for every val in array path 
		for valx, exce in pairs(ExceRouteEdit) do -- for every val in exception, based on path, compare
			if zone == ExceRouteEdit[valx][1][1] then -- if 1 of element is a start of exception- get table length exception
				found = true
				for stat, element in pairs(ExceRouteEdit[valx][1]) do
					local posp = val - 1
					if not (element == PathSolution[(posp + stat)]) then
						found = false
					end
				end
				if found == true then
					local exclng = tonumber(val - 1 + lib.tablelength(ExceRouteEdit[valx][1]))
					--print("need replace path pos:" .. val .. "  to pos:" .. exclng)
					replacepath(val, exclng, valx)
					return
				end
			end
		end
	end
end

---------------------------
--- FUNCTION FOR MOVETO ---
---------------------------

-- RESET PATH ON STOP
local function ResetPath()
	PathDestStore = ""
end

local function MovingApply(ToMap)
	if CheckException(getMapName() .. "_to_" .. PathSolution[1]) == true then
		return
	else
		lib.log1time("Maps Remains: " .. lib.tablelength(PathSolution) .. "  Moving To: --> " .. PathSolution[1])	
		if lib.useBike() then
			return
		elseif moveToMap(ToMap) then
			return
		else
			ResetPath()
			lib.log1time("Error in Path - Reset and Recalc")
			swapPokemon(getTeamSize(), getTeamSize()-1)
		end
	end
end

local function MoveWithCalcPath()
	if lib.tablelength(PathSolution) > 0 then	
		if PathSolution[1] == getMapName() then
			table.remove(PathSolution, 1)
			if lib.tablelength(PathSolution) > 0 then
				MovingApply(PathSolution[1])
			end
		else
			MovingApply(PathSolution[1])
		end
	else
		return true
	end	
end


---------------------------
-------- SETTINGS ---------
---------------------------

-- MODIF NODEMAP ACCORDING TO SETTINGS
local function ApplySettings()
	-- BIKE PATHS
	if Settings.bike then
		setEdge("Route 18", "Route 17", 1)		
		setEdge("Route 17", "Route 18", 1)
	else
		setEdge("Route 18", "Route 17", 999) -- to be safe and not cut nodes off the map
		setEdge("Route 17", "Route 18", 999)
	end
	-- DIG PATHS
	if Settings.dig then
		MapExceptions.EnableDigPath()
		-- Kanto
		setEdge("Route 11", "Route 2", 1)
		setEdge("Route 2", "Route 11", 1)
		setEdge("Route 4", "Route 3", 1)
		setEdge("Route 3", "Route 4", 1)
		-- Johto
		setEdge("Route 31", "Route 45", 1)
		setEdge("Route 45", "Route 31", 1)
		setEdge("Route 33", "Route 32", 1)
		setEdge("Route 32", "Route 33", 1)		
		setEdge("Blackthorn City", "Route 44", 1)
		setEdge("Route 44", "Blackthorn City", 1)
	else
		MapExceptions.DisableDigPath()
		-- Kanto
		unsetEdge("Route 11", "Route 2")
		unsetEdge("Route 2", "Route 11")
		unsetEdge("Route 4", "Route 3")
		unsetEdge("Route 3", "Route 4")
		-- Johto
		unsetEdge("Route 31", "Route 45")
		unsetEdge("Route 45", "Route 31")
		unsetEdge("Route 33", "Route 32")
		unsetEdge("Route 32", "Route 33")		
		unsetEdge("Blackthorn City", "Route 44")
		unsetEdge("Route 44", "Blackthorn City")
	end
end

-- INIT SETTINGS WITH CURRENT INVENTORY AND TEAM
local function initSettings()
	initNodes(GlobalMap)
	if Settings then return end
	Settings = {}
	Settings.bike = hasItem("Bicycle")
	Settings.dig = lib.hasPokemonWithMove("Dig")
	ApplySettings()
end

local function initDij(startPos, EndPos)
	initSettings()
	SetStartNode(startPos)
	local MyPath = {}
	Dijkstras()
	GetPathTo(EndPos, MyPath)
	return MyPath
end

-- MOVETO DEST
local function MoveTo(Destination)
	if PathDestStore == Destination then
		MoveWithCalcPath()	
	else
		PathSolution = initDij(getMapName(), Destination)
		if lib.tablelength(PathSolution) == 0 then
			return fatal("Path Not Found ERROR")
		end		
		PathDestStore = Destination
		-- for i=0,15 do
		EditPathGenerated()
		-- end
		log("Percorso: " .. table.concat(PathSolution,"->"))
		MoveWithCalcPath()	
	end
end

-- SETTINGS CALLS
local function EnableBikePath()
	initSettings()
	Settings.bike = true
	log("BIKE PATH ENABLED")
	ApplySettings()
end

local function DisableBikePath()
	initSettings()
	Settings.bike = false
	log("BIKE PATH DISABLED")
	ApplySettings()
end

local function EnableDigPath()
	initSettings()
	Settings.dig = true
	log("DIG PATH ENABLED")
	ApplySettings()
end

local function DisableDigPath()
	initSettings()
	Settings.dig = false
	log("DIG PATH DISABLED")
	ApplySettings()
end

-- RETURN TABLE FOR USER
return {
	MoveTo = MoveTo,
	ResetPath = ResetPath,
	SolveDialog = MapExceptions.SolveDialog,
	EnableBikePath = EnableBikePath,
	DisableBikePath = DisableBikePath,
	EnableDigPath = EnableDigPath,
	DisableDigPath = DisableDigPath,
	initSettings = initSettings
 }