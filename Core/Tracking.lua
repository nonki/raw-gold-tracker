local R = RawGoldTracker

-- Upvalues
local tostring = tostring

local T = {}

function T.IsItemTracked(itemId)
    return T.GetItem(itemId).isTracked
end

function T.GetItem(itemId)
    return R.db.global.Items[itemId]
end

function T.TrackItem(itemId)
    local _ = itemId
end

function T.UntrackItem(itemId)
    local _ = itemId
end

function T.CompleteItem(itemId)
    local _ = itemId
end

function T.IsItemCompleted(itemId)
    local _ = itemId
end

function T.UncompleteItem(itemId)
    local _ = itemId
end

function T.ItemResetTime(itemId)
    local _ = itemId
end

function T.DebugItem(itemId)
    local item = T.GetItem(itemId)
    R.Log.Debug("isTracked: %s - IsCompleted: %s", tostring(item.isTracked), tostring(item.isCompleted))
end

RawGoldTracker.Tracking = T
