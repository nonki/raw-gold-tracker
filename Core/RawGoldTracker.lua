local addonName, addon = ...

local R = RawGoldTracker

-- Upvalues
local string = string
local tostring = tostring
local LibStub = LibStub

--
-- Lifecyle
--

--luacheck: no unused args
function R:OnInitialize()
end

function R:OnEnable()
    local defaults = {
        global = {
            Config = {
                ['*'] = true
            },
            toons = {
                ['*'] = {
                    items = {
                        ['*'] = {
                            isTracked = true,
                            isCompleted = false
                        }
                    }
                }
            }
        },
    }

    self.db = LibStub("AceDB-3.0"):New("RawGoldTrackerDB", defaults)

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
        handler = R,
        type = "group",
        get = function(info)
            return self.db.global.Config[info[#info]]
        end,
        set = function(info, value)
            self.db.global.Config[info[#info]] = value
            self.Log.Debug(info[#info].." set to: "..tostring(value))
        end,
        args = {
            General = {
                name = "General Settings",
                type = "group",
                desc = function() return string.format("Version: %s %s", addonName, self.VERSION) end,
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
                    return R.Tracking.IsItemTracked(info[#info])
                end,
                set = function(info, value)
                    if value then return R.Tracking.TrackItem(info[#info]) end

                    return R.Tracking.UntrackItem(info[#info])
                end,
                args = items(),
            },
            Debug = {
                name = "debug",
                type = "input",
                get = function(itemId)
                    return self.Tracking.DebugItem(itemId)
                end,
                set = function(_, itemId)
                    return self.Tracking.DebugItem(itemId)
                end
            },
            show = {
                name = "show",
                type = "execute",
                func = function()
                    R.Monitor:ShowFrame()
                end,
            },
        },
    }

    self.Log.Debug("Initializing addon...")

    self:InitializeItems()

    LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options, {"rgt", "rawgoldtracker"})
    local AceConfigDialog = LibStub("AceConfigDialog-3.0")
    AceConfigDialog:AddToBlizOptions(addonName, nil, nil, "General")
    AceConfigDialog:AddToBlizOptions(addonName, "Items", addonName, "Items")

    self.Events.RegisterEvents()

    self.Log.Debug("Loaded successfully")
end

function R.OnDisable()
end

function R:InitializeItems()
    self.db.global.toons[addon.toon.id].name = addon.toon.name
    self.db.global.toons[addon.toon.id].realm = addon.toon.realm
    self.db.global.toons[addon.toon.id].id = addon.toon.id
end

function R:DebugDB()
    for k, v in pairs(self.db.global.toons) do
        print(format("%s: %s %s", k, tostring(v.name), tostring(v.realm), tostring(v.id)))
        for i, l in pairs(v.items) do
            print(format("%s: %s", tostring(i), tostring(l.isTracked), tostring(l.isCompleted)))
        end
    end
end
