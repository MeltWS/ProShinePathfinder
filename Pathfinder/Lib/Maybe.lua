-- -- maybeMap : (a -> b) -> Maybe a -> Maybe b
-- local function maybeMap(f)
--     return function(x)
--         if x ~= nil
--         then return f(x)
--         else return nil
--         end
--     end
-- end

-- -- maybeBind : Maybe a -> (a -> Maybe b) -> Maybe b
-- local function maybeBind(x)
--     return function(f)
--         if x ~= nil
--         then return f(x)
--         else return nil
--         end
--     end
-- end

-- -- maybeApply : Maybe (a -> b) -> Maybe a -> Maybe b
-- local function maybeApply(f)
--     return function(x)
--         if f ~= nil
--         then if x ~= nil
--              then return f(x)
--              else return nil
--              end
--         else return nil
--         end
--     end
-- end

-- -- maybe : b -> (a -> b) -> Maybe a -> b
-- local function maybe(default)
--     return function(f)
--         return function(x)
--             if x ~= nil
--             then return f(x)
--             else return default
--             end
--         end
--     end
-- end

-- isJust : Maybe a -> Bool
-- local function isJust(x)
--     return x ~= nil
-- end

-- isNothing : Maybe a -> Bool
local function isNothing(x)
    return x == nil
end

-- -- fromMaybe : a -> Maybe a -> a
-- local function fromMaybe(default)
--     return function(x)
--         if x ~= nil
--         then return x
--         else return default
--         end
--     end
-- end

-- -- arrayToMaybe : {a} -> Maybe a
-- local function arrayToMaybe(xs)
--     if #xs
--     then return xs[1]
--     else return nil
--     end
-- end

-- -- maybeToArray : Maybe a -> {a}
-- local function maybeToArray(x)
--     if x ~= nil
--     then return {x}
--     else return {}
--     end
-- end

-- -- catMaybes : {Maybe a} -> {a}
-- local function catMaybes(xs)
--     local ret = {}
--     for _, x in ipairs(xs) do
--         if x ~= nil
--         then table.insert(ret, x)
--         else
--         end
--     end
--     return ret
-- end

-- -- mapMaybe : (a -> Maybe b) -> {a} -> {b}
-- local function mapMaybe(f)
--     return function(xs)
--         local ret = {}
--         for _, x in ipairs(xs) do
--             local y = f(x)
--             if y ~= nil
--             then table.insert(ret, y)
--             else
--             end
--         end
--     end
-- end

-- -- maybeElem : Eq a => a -> Maybe a -> Bool
-- local function maybeElem(x)
--     return function(y)
--         if y ~= nil
--         then return x == y
--         else return false
--         end
--     end
-- end

-- -- maybeTraverse : (a -> {b}) -> Maybe a -> {Maybe b}
-- local function maybeTraverse(f)
--     return function(x)
--         if x ~= nil
--         then return f(x)
--         else return {nil}
--         end
--     end
-- end

-- -- maybeSequence : Maybe {a} -> {Maybe a}
-- local function(x)
--     if x ~= nil
--     then return x
--     else return {nil}
--     end
-- end

return {
    -- maybeMap = maybeMap,
--     maybeBind = maybeBind,
--     maybeApply = maybeApply,
--     maybe = maybe,
    -- isJust = isJust,
    isNothing = isNothing,
--     fromMaybe = fromMaybe,
--     arrayToMaybe = arrayToMaybe,
--     maybeToArray = maybeToArray,
--     catMaybes = catMaybes,
--     mapMaybe = mapMaybe,
--     maybeElem = maybeElem,
--     maybeTraverse = maybeTraverse,
--     maybeSequence = maybeSequence
}