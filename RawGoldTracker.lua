RawGoldTracker = LibStub("AceAddon-3.0"):NewAddon("RawGoldTracker", "AceConsole-3.0")

function RawGoldTracker:GetMyMessage(info)
    return 'hi'
end

function RawGoldTracker:SetMyMessage(info, input)
    myMessage = input
end

function RawGoldTracker:OnInitialize()
    RawGoldTracker:Print("Hello, World!")

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
