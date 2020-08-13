local _, addon = ...

-- Upvalues
local UnitName = _G.UnitName
local UnitGUID = _G.UnitGUID
local GetRealmName = _G.GetRealmName

local function toonInfo()
    return {
        name = UnitName("player"),
        realm = GetRealmName(),
        id = UnitGUID("player"),
    }
end

addon.toon = toonInfo()
