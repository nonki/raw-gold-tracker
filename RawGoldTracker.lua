local addonName, addon = ...

addon = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0", "AceConsole-3.0")
RawGoldTracker = addon

function RawGoldTracker:OnInitialize()
    self.version = GetAddOnMetadata(addonName, "version")

    local items = function()
        local args = {}
        for i = 1, #addon.items.INSTANCES_INDEX do
            local key = addon.items.INSTANCES_INDEX[i]
            local item = addon.items.INSTANCES[key]
            args[key] = {
                type = "header",
                name = item.name,
                order = i
            }

            for x = 1, #item.versions do
                local version = item.versions[x]
                args[key.."_"..version] = {
                   type = "toggle",
                   name = addon.constants.INSTANCE_DIFFICULTIES_STRINGS[version],
                   order = i + (x / 100)
                }
            end
        end

        return args
    end

    local options = {
        name = addonName,
        handler = addon,
        type = "group",
        get = function(info)
            return addon.db.global.Config[info[#info]]
        end,
        set = function(info, value)
            addon.db.global.Config[info[#info]] = value
            addon:Debug(info[#info].." set to: "..tostring(value))
        end,
        args = {
            General = {
                name = "General Settings",
                type = "group",
                desc = function() return string.format("Version: %s %s", addonName, addon.version) end,
                args = {
                    GeneralHeader = {
                        type = "header",
                        name = "General Settings",
                    },
                    Debug = {
                        type = "toggle",
                        name = "Debug logging",
                    },
                    SomeOtherValue = {
                        type = "toggle",
                        name = "Some other value",
                    },
                },
            },
            Items = {
                name = "Item Settings",
                type = "group",
                get = function(info)
                    return addon.db.global.Items[info[#info]]
                end,
                set = function(info, value)
                    addon.db.global.Items[info[#info]] = value
                    addon:Debug(info[#info].." set to: "..tostring(value))
                end,
                args = items(),
            },
        },
    }

    local defaults = {
        global = {
            Config = {
                ['*'] = true
            },
            Items = {
                ['*'] = true
            },
        },
    }

    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)

    self:Debug("Initializing addon...")

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options, {"rgt", "rawgoldtracker"})
    local AceConfigDialog = LibStub("AceConfigDialog-3.0")
    AceConfigDialog:AddToBlizOptions(addonName, nil, nil, "General")
    AceConfigDialog:AddToBlizOptions(addonName, "Items", addonName, "Items")

    self:Debug("Loaded successfully")
end

function RawGoldTracker.OnEnable()
end

function RawGoldTracker.OnDisable()
end

function RawGoldTracker:Debug(...)
    if self.db.global.Config.Debug then self:Print("DEBUG:", ...) end
end

function RawGoldTracker:Info(...)
    self:Print("INFO:", ...)
end

function RawGoldTracker:Error(...)
    self:Print("ERROR:", ...)
end
