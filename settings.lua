local addonSettingsWindow

---Create a addon settings window.
---@return Window
local function CreateAddonSettingsWindow()
  local window      = SetViewOfAddonSettings()
  local titleBar    = window.titleBar ---@type Window
  local closeButton = titleBar.closeButton ---@type Button

  window:SetSounds("bag")
  window:SetCloseOnEscape(true)
  window:EnableHidingIsRemove(true)
  window:SetAlphaAnimation(0, 1, .1, .1)
  window:SetStartAnimation(true, true)
  window:SetUILayer("system")

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

---Toggles the addon settings window.
---@param show boolean|nil
local function ToggleAddonSettingsWindow(show)
  -- If the window should be shown.
  if show == nil then
    show = addonSettingsWindow == nil or not addonSettingsWindow:IsVisible()
  end

  -- If the window should be shown and doesn't exist, create it.
  if show == true and addonSettingsWindow == nil then
    addonSettingsWindow = CreateAddonSettingsWindow()

    addonSettingsWindow:SetDeletedHandler(function ()
      addonSettingsWindow = nil
    end)
  end

  -- If the window exists, Show or Hide it.
  if addonSettingsWindow:IsValidUIObject() then
    addonSettingsWindow:Show(show)
  end
end

UIParent:SetEventHandler("UI_ADDON", ToggleAddonSettingsWindow)

-- ToggleAddonSettingsWindow()
