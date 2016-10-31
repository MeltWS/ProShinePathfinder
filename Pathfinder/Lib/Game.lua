local Game = {}

function Game.getDistance(xa, ya, xb, yb)
    local xDist = xb - xa
    local yDist = yb - ya

    return math.sqrt((xDist ^ 2) + (yDist ^ 2))
end

function Game.getPokemonNumberWithMove(move, joy) -- optional parameter happiness
    joy = joy or 0
    for i = 1, getTeamSize() do
        if hasMove(i, move) and getPokemonHappiness(i) >= joy then
            return i
        end
    end
    return false
end

return Game