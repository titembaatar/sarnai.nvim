local util = require("sarnai.util")
local hsluv = require("sarnai.hsluv")
local M = {}

-- Core accent colors
M.accents = {
  sarnai = "#f0c3cb",
  anis = "#ff6b6b",
  chatsalgan = "#e5951a",
  els = "#cca24d",
  uvs = "#80b946",
  nuur = "#2b879e",
  mus = "#9deaea",
  yargui = "#d5b3e5",
}

-- Function to get the khavar (dark) theme
function M.get_khavar()
  -- Generate intermediate colors with hue 156°
  -- From dark (8%) to light (90%)
  local base_colors = util.generate_palette(156, 8, 90)

  -- Combine with accent colors
  local colors = vim.tbl_deep_extend("force", base_colors, M.accents)

  -- Additional utility colors
  colors.none = "NONE"

  return colors
end

-- Function to get the ovol (light) theme
function M.get_ovol()
  -- Using HSLuv to intelligently convert dark theme to light
  local khavar = M.get_khavar()
  local ovol = {}

  -- Invert the base color relationships
  ovol.depth = util.hsluv(156, 15, 95)  -- Very light
  ovol.bright = util.hsluv(156, 15, 98) -- Brightest
  ovol.text = util.hsluv(156, 25, 15)   -- Dark text
  ovol.shadow = util.hsluv(156, 25, 8)  -- Darkest

  -- Intermediate colors work in reverse
  ovol.subtle = util.hsluv(156, 25, 85)
  ovol.faded = util.hsluv(156, 25, 75)
  ovol.muted = util.hsluv(156, 25, 65)
  ovol.overlay = util.hsluv(156, 25, 50)
  ovol.surface = util.hsluv(156, 25, 40)
  ovol.base = util.hsluv(156, 25, 25)

  -- Adjust accent colors for light theme
  -- Convert to HSLuv, adjust lightness, convert back
  for name, hex in pairs(M.accents) do
    local color = hsluv.hex_to_hsluv(hex)
    -- Make darker and more saturated
    color.l = math.max(30, math.min(80, color.l - 15))
    color.s = math.min(100, color.s + 10)
    ovol[name] = hsluv.hsluv_to_hex(color)
  end

  -- Additional utility colors
  ovol.none = "NONE"

  return ovol
end

-- Get colors based on style
function M.get_colors(style)
  if style == "ovol" then
    return M.get_ovol()
  else
    return M.get_khavar()
  end
end

return M

