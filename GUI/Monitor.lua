local addonName, addon = ...

local R = RawGoldTracker

local M = RawGoldTracker.Monitor or {}

local AceGUI = LibStub("AceGUI-3.0")

local function RenderCharacter(container, _)
    container:ReleaseChildren()
    local items = R.Tracking.GetItems()
    for k, v in pairs(items) do
        repeat
            if not v.isTracked then break end
            local l = AceGUI:Create("Label")
            l:SetText(k)
            l:SetFullWidth(true)

            if v.isCompleted then
                l:SetColor(0, 1, 0)
            else
                l:SetColor(1, 0, 0)
            end

            container:AddChild(l)
            break
        until true
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
