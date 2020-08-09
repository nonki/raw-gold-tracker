local addonName, addon = ...

RawGoldTracker = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0", "AceConsole-3.0")

function RawGoldTracker:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)

    self:Print("Initializing addon...")
end

function RawGoldTracker.OnEnable()
end

function RawGoldTracker.OnDisable()
end
