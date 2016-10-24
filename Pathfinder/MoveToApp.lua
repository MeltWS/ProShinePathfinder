local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local pf             = require (cdpath .. "MoveTo")
local Table          = require (cdpath .. "Lib/Table")
local ItemList       = require (cdpath .. "Maps/Items/Items")
local PokecenterList = require (cdpath .. "Maps/Pokecenters/Pokecenters")
local PokemartList   = require (cdpath .. "Maps/Pokemarts/Pokemarts")
local SubMaps        = require (cdpath .. "Maps/MapExceptions/SubstituteMaps")

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
local function MoveToMapCell(dest, x, y)
    if SubMaps[dest] then
        dest = getSubMapWithloc(dest, x, y)
    end
    if not pf.MoveTo(dest) then
        if getPlayerX() == x and getPlayerY() == y then
            return false
        end
        return moveToCell(x, y)
    end
    return true
end

-- move to closest PC
local function MoveToPC()
    return pf.MoveTo(PokecenterList)
end

-- move to closest PC and use the nurse
local function UseNearestPokecenter()
    if pf.MoveTo(PokecenterList) then
        return true
    end
    local map = getMapName()
    if map == "Indigo Plateau Center" then
        return assert(talkToNpcOnCell(4, 22), "Failed to talk to Nurse on Cell 4/22")
    elseif string.find(getMapName(), "Seafoam") and getMoney() > 1500 then
        if MoveTo("Seafoam B4F") then
            return true
        end
        return assert(talkToNpcOnCell(59,13), "Failed to talk to Nurse on Cell 59/13")
    end
    return assert(usePokecenter(), "usePokecenter() failed")
end

-- move to npc and use shop
local function usePokemart(item, amount)
    local map = getMapName()
    if isShopOpen() then
        assert(buyItem(item, amount), "buyItem("..item..", "..amount..") failed")
        log("buyItem("..item..", "..amount..") success")
        return false -- job done
    else
        local mart = PokemartList[map][ItemList[item]["maps"][map]]
        if mart[3] ~= 0 then
            talkToNpcOnCell(mart[1], mart[2])
            pushDialogAnswer(mart[3])
        else
            talkToNpcOnCell(mart[1], mart[2])
        end
    end
end

-- true if has enought money to buy amount of item
local function canBuy(itemCost, amount)
    return getMoney() > itemCost * amount
end

-- move to nearest PM and buy
local function UseNearestPokemart(item, amount)
    assert(ItemList[item], "BuyItem: Item does not exist in the list, this is case sensitive.")
    if not canBuy(ItemList[item].value, amount) then
        log("Not enough money to buy " .. amount .. " " .. item)
        return false
    end
    if pf.MoveTo(Table.getKeys(ItemList[item].maps)) then
        return true
    end
    return usePokemart(item, amount)
end

return {
    MoveToPC = MoveToPC,
    UseNearestPokecenter = UseNearestPokecenter,
    UseNearestPokemart = UseNearestPokemart,
    MoveToMapCell = MoveToMapCell,
    MoveTo = pf.MoveTo,
    EnableBikePath = pf.EnableBikePath,
    DisableBikePath = pf.DisableBikePath,
    EnableDigPath = pf.EnableDigPath,
    DisableDigPath = pf.DisableDigPath,
}
