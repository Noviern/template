local UIC_ADDON = -1
local addonWindow

---Creates a addon window.
---@return Window
local function CreateAddonWindow()
  local window       = SetViewOfAddon()
  local titleBar     = window.titleBar ---@type Window
  local closeButton  = titleBar.closeButton ---@type Button
  local contentFrame = window.contentFrame ---@type EmptyWidget

  window:SetSounds("bag")
  window:SetCloseOnEscape(true)
  window:EnableHidingIsRemove(true)
  window:SetAlphaAnimation(0, 1, .1, .1)
  window:SetStartAnimation(true, true)
  window:SetUILayer("normal")

  window:SetHandler("OnScale", function (self)
    CorrectWidgetScreenPos(window)
  end)

  titleBar:SetHandler("OnDragStart", function ()
    window:StartMoving()
  end)

  titleBar:SetHandler("OnDragStop", function ()
    window:StopMovingOrSizing()
    CorrectWidgetScreenPos(window)
  end)

  closeButton:SetHandler("OnClick", function ()
    window:Show(false)
  end)

  return window
end

---Toggles the addon window.
---@param show boolean|nil
local function ToggleAddonWindow(show)
  -- If the window should be shown.
  if show == nil then
    show = addonWindow == nil or not addonWindow:IsVisible()
  end

  -- If the window should be shown and doesn't exist, create it.
  if show == true and addonWindow == nil then
    addonWindow = CreateAddonWindow()

    addonWindow:SetDeletedHandler(function ()
      addonWindow = nil
    end)
  end

  -- If the window exists, Show or Hide it.
  if addonWindow:IsValidUIObject() then
    addonWindow:Show(show)
  end
end

ADDON:RegisterContentTriggerFunc(UIC_ADDON, ToggleAddonWindow)
ADDON:AddEscMenuButton(5, UIC_ADDON, "optimizer", locale.addon.name)

-- ToggleAddonWindow()
