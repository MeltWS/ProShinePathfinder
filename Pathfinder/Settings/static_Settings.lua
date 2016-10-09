local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local lib = require (cpdpath .. "Lib/lib")

return function()
-- STATIC SETTINGS

-- It's possible to have setting defined for every of your bots.
-- Simply replace Default by your bot name.

-- in general if you do not care about money issue 10 is a good number.
-- if you never want to take these path use high value like 999

local Settings = {
--  Default Settings
    Default        = {
        MOUNT      = "Bicycle",
        K_SUBWAY   = 999, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 999, -- Weight for using the subway path. Johto
        H_SUBWAY   = 999, -- Weight for using the subway path. Hoenn

        J_TO_K     = 999, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 999 -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    },
--  Custom Settings, loaded if the bot name match.
    MyBotName      = {
        MOUNT      = "Latios Mount",
        K_SUBWAY   = 10, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 10, -- Weight for using the subway path. Johto
        H_SUBWAY   = 999,-- Weight for using the subway path. Hoenn

        J_TO_K     = 10, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 999 -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    },
--  Custom Settings, loaded if the bot name match.
    MyOtherBotName = {
        MOUNT      = "Arcanine Mount",
        K_SUBWAY   = 5, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 5, -- Weight for using the subway path. Johto
        H_SUBWAY   = 5, -- Weight for using the subway path. Hoenn

        J_TO_K     = 5, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 5  -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    }
}

-- End of Configuration

local BotName = getBotName()

if Settings[BotName] then
    lib.log1time("Pathfinder : Loading " .. BotName .. " settings.")
    if not hasItem(Settings[BotName].MOUNT) then
        Settings[BotName].MOUNT = "Bicycle"
    end
else
    lib.log1time("Pathfinder : Loading Default settings.")
end

return Settings[BotName] or Settings["Default"]
end