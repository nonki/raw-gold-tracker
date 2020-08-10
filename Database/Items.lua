local _, addon = ...

local I = addon.items or {}
local C = addon.constants

I.INSTANCES = {
    BRF = {
        name = "Blackrock Foundry",
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    HFC = {
        name = "Hellfire Citadel",
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    }
}

addon.items = I
