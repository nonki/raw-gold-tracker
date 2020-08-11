local R = RawGoldTracker

-- Upvalues
local format = format

local L = {}

function L.Debug(s, ...)
    if not R.db.global.Config.Debug then return end

    if ... then
        return R:Print(format("DEBUG: "..s, ...))
    end

    R:Print("DEBUG:", s)
end

function L.Info(s, ...)
    if ... then
        return R:Print(format("INFO: "..s, ...))
    end

    R:Print("INFO:", s)
end

function L.Error(s, ...)
    if ... then
        return R:Print(format("ERROR: "..s, ...))
    end

    R:Print("ERROR:", s)
end

RawGoldTracker.Log = L
