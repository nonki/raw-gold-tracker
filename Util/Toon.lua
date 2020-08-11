local R = RawGoldTracker
local U = R.Util or {}

-- Upvalues
local UnitName = _G.UnitName
local UnitGUID = _G.UnitGUID
local GetRealmName = _G.GetRealmName

function U.ToonInfo()
    return {
        playerName = UnitName("player"),
        id = UnitGUID("player"),
        realm = GetRealmName(),
    }
end

RawGoldTracker.Util = U
