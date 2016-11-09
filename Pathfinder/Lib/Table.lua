local Table = {}

-- create a new copy of t1
function Table.clone(t1)
    local t2 = {}
    for k, v in pairs(t1) do
        if type(v) == "table" then 
            t2[k] = Table.clone(v)
        else
            t2[k] = v
        end
    end
    return t2
end

-- create a new table with both t1 and t2 keys = value pairs
function Table.merge(t1, t2)
    local t3 = {}
    t3 = table.clone(t1)
    for k, v in pairs(t2) do
        if t3[k] then
            t3[k] = Table.merge(t3[k], v)
        elseif type(v) == "table" then 
            t3[k] = Table.clone(v)
        else
            t3[k] = v
        end
    end
    return t3
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

function Table.show(tab)
    local start = true
    local ret = "["
    for k, v in pairs(tab) do
        if start then
            start = false
        else
            ret = ret .. ", "
        end
        ret = ret .. "[" .. k .. "] = "
        if type(v) == "nil"
            then ret = ret .. "Nil"
        elseif type(v) == "string"
            then ret = ret .. "\""..v.."\""
        elseif type(v) == "function"
            then ret = ret .. "Function"
        elseif type(v) == "number"
            then ret = ret .. v
        elseif type(v) == "userdata"
            then ret = ret .. "Userdata"
        elseif type(v) == "thread"
            then ret = ret .. "Thread"
        elseif type(v) == "table"
            then if type(v.show) == "function"
                 then ret = ret .. "("..v:show()..")"
                 else ret = ret .. Table.show(v)
            end
        elseif type(v) == "boolean"
            then if v
                 then ret = ret .. "True"
                 else ret = ret .. "False"
            end
        end
    end
    ret = ret .. "]"
    return ret
end

return Table
