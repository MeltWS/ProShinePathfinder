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

-- {a} -> (a, a)
function Table.join(ttx)
    local ty = {}
    for kx, tx in pairs(ttx) do
        for k, v in pairs(tx) do
            ty[k] = v
        end
    end
    return ty
end

function Table.filter(p)
    return function(tx)
        local ty = {}
        for k, v in pairs(tx) do
            if p(v) then ty[k] = v end
        end
        return ty
    end
end

--  ((a, b) -> (c, d)) -> [(a, b)] -> [(c, d)]
function Table.assocMap(t1, f)
    local t2 = {}
    for k, v in pairs(t1) do
        k2, v2 = f(k, v)
        t2[k2] = v2
    end
    return t2
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
