local _, addon = ...

local I = addon.items or {}
local C = addon.constants

I.INSTANCES = {
    -- WOD
    ["HFC"] = {
        name = "Hellfire Citadel",
        id = 1448,
        tier = 3,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["BRF"] = {
        name = "Blackrock Foundry",
        id = 1205,
        tier = 2,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["HM"] = {
        name = "Highmaul",
        id = 1228,
        tier = 1,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.WOD,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["SKYREACH"] = {
        name = "Skyreach",
        category = C.EXPANSIONS.WOD,
        type = C.INSTANCE_TYPES.DUNGEON,
        versions = {
            C.INSTANCE_DIFFICULTIES.NORMAL_DUNGEON,
            C.INSTANCE_DIFFICULTIES.HEROIC_DUNGEON,
        },
    },
    -- MOP
    ["SoO"] = {
        name = "Siege of Orgrimmar",
        id = 1136,
        tier = 5,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.NORMAL_RAID,
            C.INSTANCE_DIFFICULTIES.HEROIC_RAID,
            C.INSTANCE_DIFFICULTIES.MYTHIC_RAID,
        },
    },
    ["ToT"] = {
        name = "Throne of Thunder",
        id = 1098,
        tier = 3,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["TOES"] = {
        name = "Terrace of Endless Spring",
        id = 996,
        tier = 2,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["MSV"] = {
        name = "Mogu'shan Vaults",
        id = 1008,
        tier = 1,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.MOP,
        versions = {
            C.INSTANCE_DIFFICULTIES.LFR,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    -- CATA
    ["DS"] = {
        name = "Dragon Soul",
        id = 967,
        tier = 2,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.CATA,
        versions = {
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
    ["FL"] = {
        name = "Firelands",
        id = 720,
        tier = 1,
        type = C.INSTANCE_TYPES.RAID,
        category = C.EXPANSIONS.CATA,
        versions = {
            C.INSTANCE_DIFFICULTIES.RAID_25_NORMAL,
            C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC,
        },
    },
}

I.INSTANCES_INDEX = {
    "HFC", "BRF", "HM",  "SKYREACH", "SoO", "ToT", "TOES", "MSV", "DS", "FL"
}

I.SAVED_INSTANCES_LOOKUP = {
    ["Blackrock Foundry"] = "BRF",
    ["Hellfire Citadel"] = "HFC",
    ["Highmaul"] = "HM",
    ["Siege of Orgrimmar"] = "SoO",
    ["Throne of Thunder"] = "ToT",
    ["Terrace of the Endless Spring"] = "TOES",
    ["Mogu'shan Vaults"] = "MSV",
    ["Dragon Soul"] = "DS",
    ["Firelands"] = "FL",
}

addon.items = I
