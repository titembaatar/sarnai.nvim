---@alias ColorPalette table<string, HEX|string|table>
---@alias Style "khavar" | "ovol"

local util = require("sarnai.util")

local M = {}

-- Core base colors
---@type table<string, HEX>
M.base = {
  base = "#172620",
  surface = "#21362d",
  overlay = "#2d493d",
  muted = "#4e7e6b",
  subtle = "#90bbaa",
  text = "#dfece7",
}

-- Core accent colors
---@type table<string, HEX>
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
---@return ColorPalette
function M.get_khavar()
  local colors = vim.tbl_deep_extend("force", M.base, M.accents)

  -- Additional utility colors
  ---@type table<string, HEX|string>
  colors.groups = {
    border = "sarnai",
    link = "yargui",
    panel = "surface",

    error = "anis",
    hint = "yargui",
    info = "mus",
    ok = "uvs",
    warn = "chatsalgan",
    note = "nuur",
    todo = "sarnai",

    git_add = "mus",
    git_change = "sarnai",
    git_delete = "anis",
    git_dirty = "sarnai",
    git_ignore = "muted",
    git_merge = "yargui",
    git_rename = "nuur",
    git_stage = "yargui",
    git_text = "sarnai",
    git_untracked = "subtle",

    h1 = "sarnai",
    h2 = "mus",
    h3 = "yargui",
    h4 = "uvs",
    h5 = "nuur",
    h6 = "uvs",
  }

  colors.none = "NONE"

  -- Add terminal colors
  colors.terminal = util.get_terminal_colors(colors)

  return colors
end

-- Function to get the ovol (light) theme
---@return ColorPalette
function M.get_ovol()
  -- Use the conversion utility to generate light theme
  return util.to_light_theme(M.get_khavar())
end

-- Get colors based on style
---@param style Style
---@return ColorPalette
function M.get_colors(style)
  if style == "ovol" then
    return M.get_ovol()
  else
    return M.get_khavar()
  end
end

return M
