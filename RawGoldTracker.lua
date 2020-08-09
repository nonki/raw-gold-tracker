local addonName, addon = ...

addon = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0", "AceConsole-3.0")
RawGoldTracker = addon

local options = {
    name = addonName,
    handler = addon,
    type = "group",
    args = {
        debug = {
            type = "toggle",
            name = "Debug",
            desc = "Turn on debug logging",
            get = "GetDebug",
            set = "ToggleDebug",
        },
    },
}

function RawGoldTracker:OnInitialize()
    local defaults = {
        profile = {
            debug = false,
        },
    }

    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)
    self:LoadOptions()

    self:Info("Initializing addon...")

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options, {"rgt", "rawgoldtracker"})
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName)

    self:Info("Loaded successfully")
end

function RawGoldTracker.OnEnable()
end

function RawGoldTracker.OnDisable()
end

function RawGoldTracker:LoadOptions()
    self.debugEnabled = self.db.profile.debugEnabled

    self.db.RegisterCallback(self, "OnDatabaseShutdown", "SaveOptions")
    self.db.RegisterCallback(self, "OnProfileShutdown", "SaveOptions")
end

function RawGoldTracker:SaveOptions()
    self:Debug("Saving options...")
    self.db.profile.debugEnabled = self.debugEnabled
    self:Debug("Saved options")
end

function RawGoldTracker:GetDebug(_)
    return self.debugEnabled
end

function RawGoldTracker:ToggleDebug(_, _)
    self.debugEnabled = not self.debugEnabled

    self:Printf("Debug mode is %s", (self.debugEnabled and "enabled" or "disabled"))
end

function RawGoldTracker:Debug(...)
    if self.debugEnabled then self:Print("DEBUG:", ...) end
end

function RawGoldTracker:Info(...)
    self:Print("INFO:", ...)
end

function RawGoldTracker:Error(...)
    self:Print("ERROR:", ...)
end
