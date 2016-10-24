local Table = {}

function Table.concat(t1, t2)
    for i = 1, #t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function Table.tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- return keys from table
function Table.getKeys(tab)
    local keys = {}
    for k, v in pairs(tab) do
        table.insert(keys, k)
    end
    return keys
end

return Table
