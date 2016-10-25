local Settings = nil

local function initSettings()
-----------------------
-- USER CUSTOM SETTINGS
-----------------------

-- It's possible to have setting defined for every of your bots.
-- Simply replace Default by your bot name.
-- Omitted settings in custom profiles will be replaced by those in Default profile.

-- About Subway and Boat paths:
-- the value defines how heavy the path is.
-- if you define H_SUBWAY = 1 the bot will consider subway path in hoenn to be of lenght 1,
-- which will result in taking the subway almost all the time.
-- in general if you do not care about money issue 10 is a good number.
-- if you never want to take these path use high value like 999.

-- digpath is dynamically supported depending on your team having a pokemon with dig and happiness.

Settings = {
--  Default Settings
    default        = {
        MOUNT      = "Bicycle",

        DISCOVER   = true,  --discover items.
        HARVEST    = true,  -- harvest berries.
        HEADBUTT   = false, -- headbutt trees.
        DIG        = true,  -- dig digSpots.

        K_SUBWAY   = 999, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 999, -- Weight for using the subway path. Johto
        H_SUBWAY   = 999, -- Weight for using the subway path. Hoenn

        J_TO_K     = 999, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 999 -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    },
--  Custom Settings, loaded if the bot name match.
--  Omitted settings will be taken on Default profile.
    myBotName      = {
        MOUNT      = "Latios Mount",

        K_SUBWAY   = 10, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 10, -- Weight for using the subway path. Johto
        H_SUBWAY   = 999,-- Weight for using the subway path. Hoenn

        J_TO_K     = 10, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 999 -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    },
--  Custom Settings, loaded if the bot name match.
    myOtherBotName = {
        MOUNT      = "Arcanine Mount",

        K_SUBWAY   = 5, -- Weight for using the subway path. Kanto
        J_SUBWAY   = 5, -- Weight for using the subway path. Johto
        H_SUBWAY   = 5, -- Weight for using the subway path. Hoenn

        J_TO_K     = 5, -- Weight of the Subway from Johto to Kanto and reverse.
        H_TO_KJ    = 5  -- Weight of the Subway from Hoenn to Kanto/Johto and reverse.
    },
}

-----------------------
-- End of Configuration
-----------------------
end

local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local lib        = require (cpdpath .. "Lib/lib")
local Maybe      = require (cpdpath .. "Lib/Maybe")
local message    = ""
local loadedName = nil

local function fillOmittedSettings(botName)
    default = "default"
    for key, value in pairs(Settings[default]) do
        if Maybe.isNothing(Settings[botName][key]) then
            message = message .. "\n --> Filling omitted setting: " .. tostring(key) .. ", replacing with: " .. tostring(value) .. "."
            Settings[botName][key] = Settings[default][key]
        end
    end
end

local function validateSettings(botName)
    if not hasItem(Settings[botName].MOUNT) then
        Settings[botName].MOUNT = "Bicycle"
        message = message .. "\n -> Mount not found, setting to Bicycle."
    end
    if not lib.getPokemonNumberWithMove("Headbutt", 155) then
        Settings[botName].HEADBUTT = false
        message = message .. "\n -> No Pokemon can Headbutt trees, setting to false."
    end
    if not lib.getPokemonNumberWithMove("Dig") then
        Settings[botName].DIG = false
        message = message .. "\n -> No Pokemon can Dig, setting to false."
    end
end

return function()
    local botName = getBotName()
    if botName ~= loadedName then
        loadedName = botName
        initSettings()
        if Settings[botName] then
            message = "Pathfinder : Loading " .. botName .. " settings."
            fillOmittedSettings(botName)
            validateSettings(botName)
        else
            message = "Pathfinder : Loading default settings."
        end
        lib.log1time(message)
    end
    return Settings[botName] or Settings["default"]
end
