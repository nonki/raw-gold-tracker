local addonName, addon = ...

local R = RawGoldTracker

local M = RawGoldTracker.Monitor or {}

local AceGUI = LibStub("AceGUI-3.0")

local function RenderCharacter(container, _, toonId)
    container:ReleaseChildren()

    local scrollContainer = AceGUI:Create("SimpleGroup")
    scrollContainer:SetFullWidth(true)
    scrollContainer:SetFullHeight(true)
    scrollContainer:SetLayout("Fill")
    container:AddChild(scrollContainer)

    local scroll = AceGUI:Create("ScrollFrame")
    scroll:SetLayout("Flow")

    scrollContainer:AddChild(scroll)

    local items = {}
    for i = 1, #addon.items.INSTANCES_INDEX do
        local index = addon.items.INSTANCES_INDEX[i]
        local instance = addon.items.INSTANCES[index]

        for x = 1, #instance.versions do
            local version = instance.versions[x]
            local itemId = index.."_"..version
            local item = R.Tracking.GetItem(itemId, toonId)

            if item.isTracked then
                items[itemId] = {
                    isCompleted = item.isCompleted,
                    name = instance.name,
                    version = version
                }
            end
        end
    end

    local groupedItems = {}
    for _, item in pairs(items) do
        groupedItems[item.name] = groupedItems[item.name] or {}

        table.insert(groupedItems[item.name], item)
    end

    for group, groupItems in pairs(groupedItems) do
        local h = AceGUI:Create("Heading")
        h:SetText(group)
        h:SetFullWidth(true)
        scroll:AddChild(h)
        for _, item in pairs(groupItems) do
            local c = AceGUI:Create("CheckBox")

            c:SetLabel(format("%s", addon.constants.INSTANCE_DIFFICULTIES_STRINGS[item.version]))
            c:SetValue(item.isCompleted)
            c:SetDisabled(true)

            scroll:AddChild(c)
        end
    end
end

--luacheck: no unused args
function M:ShowFrame(parent)
    local t = AceGUI:Create("TabGroup")
    local players = R.Tracking.GetToons()
    local tabs = {}
    for _, player in pairs(players) do
        local trackedItems = R.Tracking.GetTrackedItems(player.id)
        if next(trackedItems) or player.id == addon.toon.id then
            R.Log.Debug("adding tab for player %s - %s", player.name, player.id)
            table.insert(tabs, {text = player.name, value = player.id})
        end
    end

    t:SetTabs(tabs)
    t:SetLayout("Flow")
    t:SetCallback("OnGroupSelected", RenderCharacter)
    t:SelectTab(addon.toon.id)

    if parent then return parent:AddChild(t) end

    local f = AceGUI:Create("Frame")
    f:SetTitle(addonName)
    f:SetLayout("Fill")
    f:AddChild(t)
end

RawGoldTracker.Monitor = M
