local _, addon = ...

local I = addon.items or {}
local C = addon.constants

I.INSTANCES = {
    -- WOD
    ["HFC"] = {
        name = "Hellfire Citadel",
        id = 1448,
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["BRF"] = {
        name = "Blackrock Foundry",
        id = 1205,
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["HM"] = {
        name = "Highmaul",
        id = 1228,
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["SKYREACH"] = {
        name = "Skyreach",
        category = C.ITEM_CATEGORIES.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.NORMAL_DUNGEON,
            C.INSTANCE_DIFFICULTIES.HEROIC_DUNGEON,
        },
    },
    -- MOP
    ["SoO"] = {
        name = "Siege of Orgrimmar",
        id = 1136,
        category = C.ITEM_CATEGORIES.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["ToT"] = {
        name = "Throne of Thunder",
        id = 1098,
        category = C.ITEM_CATEGORIES.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["TOES"] = {
        name = "Terrace of Endless Spring",
        id = 996,
        category = C.ITEM_CATEGORIES.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["MSV"] = {
        name = "Mogu'shan Vaults",
        id = 1008,
        category = C.ITEM_CATEGORIES.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LEGACY_LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    -- CATA
    ["DS"] = {
        name = "Dragon Soul",
        id = 967,
        category = C.ITEM_CATEGORIES.CATA,
        versions = {
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["FL"] = {
        name = "Firelands",
        id = 720,
        category = C.ITEM_CATEGORIES.CATA,
        versions = {
            C.INSTANCE_DIFFICULTIES.RAID_25_NORMAL,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
}

I.INSTANCES_INDEX = {
    "HFC", "BRF", "HM", "SoO", "ToT", "TOES", "MSV", "DS", "FL"
}

addon.items = I
