local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
    cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local PathFinder    = require (cdpath .. "Lib/MoveTo/MoveTo")
local DialogSolver  = require (cdpath .. "Lib/MoveTo/DialogSolver")
local moveToMapCell = require (cdpath .. "Lib/MoveTo/MoveToMapCell")
local Pokecenter    = require (cdpath .. "Lib/MoveTo/Pokecenter")
local Pokemart      = require (cdpath .. "Lib/MoveTo/Pokemart")

return {
    getPath = PathFinder.getPath,
    moveTo = PathFinder.moveTo,
    moveToMapCell = moveToMapCell.moveToMapCell,
    useNearestPokemart = Pokemart.useNearestPokemart,
    moveToPC = Pokecenter.moveToPC,
    useNearestPokecenter = Pokecenter.useNearestPokecenter,
    isDigPathEnabled = PathFinder.isDigPathEnabled,
    enableDigPath = PathFinder.enableDigPath,
    disableDigPath = PathFinder.disableDigPath,
}
