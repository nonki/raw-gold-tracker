local _, addon = ...

local C = addon.constants or {}

C.EXPANSIONS = {
    CLASSIC = "BASE",
    TBC     = "TBC",
    WOTLK   = "WOTLK",
    CATA    = "CATA",
    MOP     = "MOP",
    WOD     = "WOD",
    LEGION  = "LEGION",
    BFA     = "BFA",
    HOLIDAY = "HOLIDAY",
}

C.INSTANCE_DIFFICULTIES = {
    NORMAL_DUNGEON      = 1,
    HEROIC_DUNGEON      = 2,
    RAID_10_NORMAL      = 3,
    RAID_25_NORMAL      = 4,
    RAID_10_HEROIC      = 5,
    RAID_25_HEROIC      = 6,
    LEGACY_LFR          = 7,
    NORMAL_RAID         = 14,
    HEROIC_RAID         = 15,
    MYTHIC_RAID         = 16,
    LFR                 = 17,
    MYTHIC_DUNGEON      = 23,
    TIMEWALKING_DUNGEON = 24,
    TIMEWALKING_RAID    = 33,
}

C.INSTANCE_DIFFICULTIES_STRINGS = {
    [C.INSTANCE_DIFFICULTIES.NORMAL_DUNGEON]      = "Normal Dungeon",
    [C.INSTANCE_DIFFICULTIES.HEROIC_DUNGEON]      = "Heroic Dungeon",
    [C.INSTANCE_DIFFICULTIES.RAID_10_NORMAL]      = "10 Man Normal",
    [C.INSTANCE_DIFFICULTIES.RAID_25_NORMAL]      = "25 Man Normal",
    [C.INSTANCE_DIFFICULTIES.RAID_10_HEROIC]      = "10 Man Heroic",
    [C.INSTANCE_DIFFICULTIES.RAID_25_HEROIC]      = "25 Man Heroic",
    [C.INSTANCE_DIFFICULTIES.LEGACY_LFR]          = "LFR (Legacy)",
    [C.INSTANCE_DIFFICULTIES.NORMAL_RAID]         = "Normal Raid",
    [C.INSTANCE_DIFFICULTIES.HEROIC_RAID]         = "Heroic Raid",
    [C.INSTANCE_DIFFICULTIES.MYTHIC_RAID]         = "Mythic Raid",
    [C.INSTANCE_DIFFICULTIES.LFR]                 = "LFR",
    [C.INSTANCE_DIFFICULTIES.MYTHIC_DUNGEON]      = "Mythic Dungeon",
}

addon.constants = C
