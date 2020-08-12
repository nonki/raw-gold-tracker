local addonName, addon = ...

local R = RawGoldTracker

local M = RawGoldTracker.Monitor or {}

local AceGUI = LibStub("AceGUI-3.0")

local function RenderCharacter(container, _)
    container:ReleaseChildren()
    local items = R.Tracking.GetAllTrackedItems()
    for k, v in pairs(items) do
        local l = AceGUI:Create("Label")
        local instance, version = nil

        -- horrible hack, please remove
        for inst, vers in k:gmatch("([^_]+)_([0-9]+)") do
            instance = tostring(inst)
            version = tonumber(vers)
        end

        local niceItem = addon.items.INSTANCES[instance].name
        local niceVersion = addon.constants.INSTANCE_DIFFICULTIES_STRINGS[version]

        l:SetText(format("%s - %s", niceItem, niceVersion))
        l:SetFullWidth(true)

        if v.isCompleted then
            l:SetColor(0, 1, 0)
        else
            l:SetColor(1, 0, 0)
        end

        container:AddChild(l)
    end
end

--luacheck: no unused args
function M:ShowFrame(parent)
    local t = AceGUI:Create("TabGroup")
    local playerName = R.Util.ToonInfo().playerName
    local tabs = {{text = playerName, value = playerName}}
    t:SetTabs(tabs)
    t:SetLayout("Flow")
    t:SetCallback("OnGroupSelected", RenderCharacter)
    t:SelectTab(playerName)

    if parent then return parent:AddChild(t) end

    local f = AceGUI:Create("Frame")
    f:SetTitle(addonName)
    f:SetLayout("Fill")
    f:AddChild(t)
end

RawGoldTracker.Monitor = M
