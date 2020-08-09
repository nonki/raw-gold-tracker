RawGoldTracker = LibStub("AceAddon-3.0"):NewAddon("RawGoldTracker", "AceEvent-3.0", "AceConsole-3.0")

function RawGoldTracker:GetMyMessage(_)
    return self.db.profile.greeting
end

function RawGoldTracker:SetMyMessage(_, input)
    self.db.profile.greeting = input
end

function RawGoldTracker:OnInitialize()
    local defaults = {
        profile = { },
    }

    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)

    RawGoldTracker:Print(RawGoldTracker:GetMyMessage())

    local options = {
        name = "RawGoldTracker",
        handler = RawGoldTracker,
        type = 'group',
        args = { },
    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable("RawGoldTracker", options, {"rgt", "rawgoldtracker"})
end

function RawGoldTracker:OnEnable()
end

function RawGoldTracker.OnDisable()
end
