RawGoldTracker = LibStub("AceAddon-3.0"):NewAddon("RawGoldTracker", "AceEvent-3.0")

function RawGoldTracker:GetMyMessage(info)
    return self.db.profile.greeting
end

function RawGoldTracker:SetMyMessage(info, input)
    self.db.profile.greeting = input
end

function RawGoldTracker:OnInitialize()
    local defaults = {
        profile = {
            greeting = 'Wassup, Bitch'
        }
    }

    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)

    RawGoldTracker:Print(RawGoldTracker:GetMyMessage())

    local options = {
        name = "RawGoldTracker",
        handler = RawGoldTracker,
        type = 'group',
        args = {
            msg = {
                type = 'input',
                name = 'My Message',
                desc = 'The message for my addon',
                set = 'SetMyMessage',
                get = 'GetMyMessage',
            },
        },
    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable("RawGoldTracker", options, {"rgt"})
end

function RawGoldTracker:OnEnable()
end

function RawGoldTracker:OnDisable()
end
