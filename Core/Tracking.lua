local _, addon = ...

local R = RawGoldTracker

-- Upvalues
local tostring = _G.tostring
local GetNumSavedInstances = _G.GetNumSavedInstances
local GetSavedInstanceInfo = _G.GetSavedInstanceInfo

local T = {}

function T.GetToons()
    return R.db.global.toons
end

function T.IsItemTracked(itemId, char)
    local item = T.GetItem(itemId, char)
    return item and item.isTracked
end

function T.GetItem(itemId, char)
    if char then return R.db.global.toons[char].items[itemId] end

    return R.db.global.toons[addon.toon.id].items[itemId]
end

function T.GetItems(char)
    if char then return R.db.global.toons[char].Items end

    return R.db.global.toons[addon.toon.id].items
end

function T.GetTrackedItems(char)
    local trackedItems = {}
    local allItems = T.GetItems(char)
    for k, v in pairs(allItems) do
        if v.isTracked then trackedItems[k] = v end
    end

    return trackedItems
end

function T.UpdateItem(itemId, char, data)
    R.Log.Debug("updating %s for %s", itemId, char or addon.toon.id)
    local item = T.GetItem(itemId, char)

    for k, v in pairs(data) do
        item[k] = v
    end
end

function T.TrackItem(itemId, char)
    T.UpdateItem(itemId, char, {isTracked = true})
    R.Log.Debug(itemId.." tracked")
end

function T.UntrackItem(itemId, char)
    T.UpdateItem(itemId, char, {isTracked = false})
    R.Log.Debug(itemId.." untracked")
end

function T.CompleteItem(itemId, char)
    T.UpdateItem(itemId, char, {isCompleted = true})
    R.Log.Debug("Completed %s", itemId)
end

function T.UncompleteItem(itemId, char)
    T.UpdateItem(itemId, char, {isCompleted = false})
    R.Log.Debug("Uncompleted %s", itemId)
end

function T.IsItemCompleted(itemId, char)
    local item = T.GetItem(itemId, char)

    return item and item.isCompleted
end

function T.DebugItem(itemId, char)
    local item = T.GetItem(itemId, char)
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
