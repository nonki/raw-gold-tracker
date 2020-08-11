local R = RawGoldTracker

local RequestRaidInfo = _G.RequestRaidInfo

local E = R.Events or {}

--luacheck: no unused args
function E:RegisterEvents()
    R:RegisterEvent("BOSS_KILL", "ON_BOSS_KILL")
    R:RegisterEvent("ENCOUNTER_END", "ON_ENCOUNTER_END")
    R:RegisterEvent("UPDATE_INSTANCE_INFO", "ON_UPDATE_INSTANCE_INFO")
end

--luacheck: no unused args
function R:ON_ENCOUNTER_END(_, _, _, _, success)
    if not success then return end

    RequestRaidInfo()
end

--luacheck: no unused args
function R:ON_BOSS_KILL(_, _)
    RequestRaidInfo()
end

--luacheck: no unused args
function R:ON_UPDATE_INSTANCE_INFO()
    R.Tracking.ScanInstanceLocks()
end

R.Events = E
