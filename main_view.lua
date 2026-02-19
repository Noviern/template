ADDON:ImportObject(OBJECT.Button)
ADDON:ImportObject(OBJECT.EmptyWidget)
ADDON:ImportObject(OBJECT.ImageDrawable)
ADDON:ImportObject(OBJECT.NinePartDrawable)
ADDON:ImportObject(OBJECT.TextStyle)
ADDON:ImportObject(OBJECT.Window)

WINDOW = {
  WIDTH               = 680,
  HEIGHT              = 680,
  MARGIN              = 20,
  CLOSE_BUTTON_OFFSET = 3,
}

---Sets up the view of the addon window.
---@return Window
function SetViewOfAddon()
  local window = UIParent:CreateWidget("window", "addon", "UIParent")
  window:AddAnchor("CENTER", "UIParent", 0, 0)
  window:SetExtent(WINDOW.WIDTH, WINDOW.HEIGHT)

  local windowBackground = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg", "background")
  windowBackground:AddAnchor("TOPLEFT", window, -5, -5)
  windowBackground:AddAnchor("BOTTOMRIGHT", window, 5, 5)

  local windowBackgroundDecoration = window:CreateDrawable(TEXTURE_PATH.DEFAULT, "main_bg_deco", "background")
  windowBackgroundDecoration:AddAnchor("TOPLEFT", window, 0, -5)
  windowBackgroundDecoration:AddAnchor("TOPRIGHT", window, 0, -5)

  local titleBar = window:CreateChildWidget("window", "titleBar", 0, true)
  titleBar.titleStyle:SetAlign(ALIGN_CENTER)
  titleBar.titleStyle:SetSnap(true)
  titleBar.titleStyle:SetFont(FONT_PATH.SUB, FONT_SIZE.XLARGE)
  titleBar.titleStyle:SetColorByKey("title")
  titleBar:AddAnchor("TOPLEFT", window, 0, 0)
  titleBar:AddAnchor("TOPRIGHT", window, 0, 0)
  titleBar:SetTitleText(locale.addon.name)
  titleBar:EnableDrag(true)
  titleBar:SetHeight(45)

  local closeButton = titleBar:CreateChildWidget("button", "closeButton", 0, true)
  closeButton:AddAnchor("TOPRIGHT", titleBar, WINDOW.CLOSE_BUTTON_OFFSET, -WINDOW.CLOSE_BUTTON_OFFSET)
  closeButton:SetStyle("btn_close_default")

  local contentFrame = window:CreateChildWidget("emptywidget", "contentFrame", 0, true)
  contentFrame:AddAnchor("TOPLEFT", titleBar, "BOTTOMLEFT", WINDOW.MARGIN, 0)
  contentFrame:AddAnchor("BOTTOMRIGHT", window, "BOTTOMRIGHT", -WINDOW.MARGIN, -WINDOW.MARGIN)

  return window
end
