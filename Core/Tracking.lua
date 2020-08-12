local _, addon = ...

local R = RawGoldTracker

-- Upvalues
local tostring = _G.tostring
local GetNumSavedInstances = _G.GetNumSavedInstances
local GetSavedInstanceInfo = _G.GetSavedInstanceInfo

local T = {}

function T.IsItemTracked(itemId)
    return T.GetItem(itemId).isTracked
end

function T.GetItem(itemId)
    return R.db.profile.Items[itemId]
end

function T.GetItems()
    return R.db.profile.Items
end

function T.GetTrackedItems()
    local trackedItems = {}
    local allItems = T.GetItems()
    for k, v in pairs(allItems) do
        if v.isTracked then trackedItems[k] = v end
    end

    return trackedItems
end


function T.TrackItem(itemId)
    R.Log.Debug(itemId.." tracked")
    local item = T.GetItem(itemId)
    item.isTracked = true
end

function T.UntrackItem(itemId)
    R.Log.Debug(itemId.." untracked")
    local item = T.GetItem(itemId)
    item.isTracked = false
end

function T.CompleteItem(itemId)
    local item = T.GetItem(itemId)
    item.isCompleted = true
    R.Log.Debug("Completed %s", itemId)
end

function T.IsItemCompleted(itemId)
    return T.GetItem(itemId).isCompleted
end

function T.UncompleteItem(itemId)
    local item = T.GetItem(itemId)
    item.isCompleted = false
    R.Log.Debug("Uncompleted %s", itemId)
end

function T.DebugItem(itemId)
    local item = T.GetItem(itemId)
    R.Log.Debug("isTracked: %s - IsCompleted: %s", tostring(item.isTracked), tostring(item.isCompleted))
end

function T.ScanInstanceLocks()
    R.Log.Debug("Scanning Instance Locks")

    local savedInstanceCount = GetNumSavedInstances()

    for i = 1, savedInstanceCount do
        T.ScanInstanceLock(i)
    end

    R.Log.Debug("Finished Scanning Instance Locks")
end

function T.ScanInstanceLock(index)
    local instanceName, _, instanceReset, instanceDifficulty,
        _, _, _, _, _, _, totalEncounters, encountersFinished =
            GetSavedInstanceInfo(index)

    local instanceKey = addon.items.SAVED_INSTANCES_LOOKUP[instanceName]

    if not instanceKey then return end

    local itemId = instanceKey .. "_" .. tostring(instanceDifficulty)
    if instanceReset <= 0 then return T.UncompleteItem(itemId) end

    if totalEncounters > encountersFinished then return T.UncompleteItem(itemId) end

    T.CompleteItem(itemId)
end

RawGoldTracker.Tracking = T
