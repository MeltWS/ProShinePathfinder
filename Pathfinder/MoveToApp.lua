local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local pf             = require (cdpath .. "MoveTo")
local ItemList       = require (cdpath .. "Maps/Items/Items")
local PokecenterList = require (cdpath .. "Maps/Pokecenters/Pokecenters")

-- move to closest PC
local function MoveToPC()
    return pf.MoveTo(PokecenterList)
end

-- move to closest PC and use the nurse
local function UseNearestPokecenter()
    if pf.MoveTo(PokecenterList) then
        return true
    end
    map = getMapName()
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
    map = getMapName()
    if isShopOpen() then
        if buyItem(item, amount) then
            log("Bought " .. amount .. " " .. item)
            return false -- job done
        end
    else
        if map == "Celadon Mart 2" then
            if ItemList[item]["type"] == "Pokeball" then
                talkToNpcOnCell(4,10)
            elseif ItemList[item]["type"] == "Recovery" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Evolutionary" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Miscellaneous" then
                talkToNpcOnCell(7,3)
            end
        elseif map == "Goldenrod Mart 2" then
            if ItemList[item]["type"] == "Pokeball" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Recovery" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Evolutionary" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Miscellaneous" then
                talkToNpcOnCell(7,3)
            end
        elseif map == "Lilycove Department Store 2F" then
            if ItemList[item]["type"] == "Pokeball" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Recovery" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Evolutionary" then
                talkToNpcOnCell(7,3)
            elseif ItemList[item]["type"] == "Miscellaneous" then
                talkToNpcOnCell(7,3)
            end
        elseif map == "Indigo Plateau Center" then
            talkToNpcOnCell(16, 22)
        elseif map == "Blackthorn City Pokemart" then
            talkToNpcOnCell(3, 4)
        else
            talkToNpcOnCell(3, 5)
        end
    end
    return true
end

-- true if has enought money to buy amount of item
local function canBuy(itemCost, amount)
    return getMoney() > itemCost * amount
end

-- move to nearest PM and buy
local function UseNearestPokemart(item, amount)
    map = getMapName()
    assert(ItemList[item], "Item does not exist in the list, this is case sensitive.")
    if not canBuy(ItemList[item].value, amount) then
        log("Not enough money to buy " .. amount .. " " .. item)
        return false
    end
    if pf.MoveTo(ItemList[item].maps) then
        return true
    end
    return usePokemart(item, amount)
end

return {
    MoveToPC = MoveToPC,
    UseNearestPokecenter = UseNearestPokecenter,
    UseNearestPokemart = UseNearestPokemart,
    MoveTo = pf.MoveTo,
    EnableBikePath = pf.EnableBikePath,
    DisableBikePath = pf.DisableBikePath,
    EnableDigPath = pf.EnableDigPath,
    DisableDigPath = pf.DisableDigPath,
}
