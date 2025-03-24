local util = require("sarnai.util")
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

  -- Add terminal colors
  colors.terminal = util.get_terminal_colors(colors)

  return colors
end

-- Function to get the ovol (light) theme
function M.get_ovol()
  -- Use the conversion utility to generate light theme
  return util.to_light_theme(M.get_khavar())
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
