local addonName = ...

RawGoldTracker = LibStub("AceAddon-3.0"):NewAddon(
    addonName,
    "AceEvent-3.0",
    "AceConsole-3.0"
)

local version = GetAddOnMetadata(addonName, "version")

RawGoldTracker.VERSION = version
