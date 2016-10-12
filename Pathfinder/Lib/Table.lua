local Table = {}

function Table.tableConcat(t1, t2)
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

return Table