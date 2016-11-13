local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local pf             = require (cppdpath .. "Lib/MoveTo/MoveTo")
local Table          = require (cppdpath .. "Lib/Table")
local ItemList       = require (cppdpath .. "Maps/Items/Items")
local PokemartList   = require (cppdpath .. "Maps/Pokemarts/Pokemarts")

-- move to npc and use shop
local function usePokemart(map, item, amount)
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
local function useNearestPokemart(map, item, amount)
    assert(ItemList[item], "BuyItem: Item does not exist in the list, this is case sensitive.")
    if not canBuy(ItemList[item].value, amount) then
        log("Not enough money to buy " .. amount .. " " .. item)
        return false
    end
    if pf.moveTo(map, Table.getKeys(ItemList[item].maps)) then
        return true
    end
    return usePokemart(map, item, amount)
end

return { useNearestPokemart = useNearestPokemart }
