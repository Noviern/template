SETTINGS_WINDOW = {
  WIDTH               = 680,
  HEIGHT              = 680,
  MARGIN              = 20,
  CLOSE_BUTTON_OFFSET = 3,
}

---Sets up the view of the example addon settings window.
---@return Window
function SetViewOfAddonSettings()
  local window = UIParent:CreateWidget("window", "addonSettings", "UIParent")
  window:AddAnchor("CENTER", "UIParent", 0, 0)
  window:SetExtent(SETTINGS_WINDOW.WIDTH, SETTINGS_WINDOW.HEIGHT)

  local background = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg", "background")
  background:AddAnchor("TOPLEFT", window, -5, -5)
  background:AddAnchor("BOTTOMRIGHT", window, 5, 5)

  local decoration = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg_deco", "background")
  decoration:AddAnchor("TOPLEFT", window, 0, -5)
  decoration:AddAnchor("TOPRIGHT", window, 0, -5)

  local titleBar = window:CreateChildWidget("window", "titleBar", 0, true)
  titleBar.titleStyle:SetAlign(ALIGN_CENTER)
  titleBar.titleStyle:SetSnap(true)
  titleBar.titleStyle:SetFont(FONT_PATH.SUB, FONT_SIZE.XLARGE)
  titleBar.titleStyle:SetColorByKey("title")
  titleBar:AddAnchor("TOPLEFT", window, 0, 0)
  titleBar:AddAnchor("TOPRIGHT", window, 0, 0)
  titleBar:SetTitleText(locale.addon.name .. " - " .. X2Locale:LocalizeUiText(COMMON_TEXT, "option"))
  titleBar:EnableDrag(true)
  titleBar:SetHeight(45)

  local closeButton = titleBar:CreateChildWidget("button", "closeButton", 0, true)
  closeButton:SetStyle("btn_close_default")
  closeButton:AddAnchor("TOPRIGHT", titleBar, SETTINGS_WINDOW.CLOSE_BUTTON_OFFSET, -SETTINGS_WINDOW.CLOSE_BUTTON_OFFSET)

  local contentFrame = window:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:AddAnchor("TOPLEFT", titleBar, "BOTTOMLEFT", SETTINGS_WINDOW.MARGIN, 0)
  contentFrame:AddAnchor("BOTTOMRIGHT", window, "BOTTOMRIGHT", -SETTINGS_WINDOW.MARGIN, -SETTINGS_WINDOW.MARGIN)

  return window
end
