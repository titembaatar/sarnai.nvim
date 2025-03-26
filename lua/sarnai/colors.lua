---@alias Style "khavar" | "ovol"

---@class BasePalette
---@field base HEX Main background color
---@field surface HEX Lighter background color
---@field overlay HEX Selection background color
---@field muted HEX Muted text color
---@field subtle HEX Secondary text color
---@field text HEX Primary text color
---@field sarnai HEX Pink accent color
---@field anis HEX Red accent color
---@field chatsalgan HEX Orange accent color
---@field els HEX Yellow accent color
---@field uvs HEX Green accent color
---@field nuur HEX Blue accent color
---@field mus HEX Cyan accent color
---@field yargui HEX Purple accent color

---@class UIPalette
---@field bg HEX Main editor background
---@field bg_float HEX Floating window/popup background
---@field bg_popup HEX Selected/highlighted item background
---@field fg HEX Main text color
---@field border HEX Border color
---@field accent HEX Primary accent color

---@class SyntaxPalette
---@field punctuation HEX Punctuation, delimiters
---@field comment HEX Comments
---@field constant HEX Constants, numbers
---@field string HEX Strings
---@field functions HEX Functions, methods
---@field boolean HEX Boolean
---@field keyword HEX Keywords
---@field operator HEX Operators
---@field type HEX Types, classes
---@field variable HEX Variables

---@class SemanticPalette
---@field error HEX Errors
---@field error_bg HEX Error background
---@field warn HEX Warnings
---@field warn_bg HEX Warning background
---@field info HEX Information
---@field info_bg HEX Info background
---@field hint HEX Hints
---@field hint_bg HEX Hint background
---@field ok HEX Success/OK
---@field ok_bg HEX Hint background

---@class GitPalette
---@field git_add HEX Added content
---@field git_change HEX Changed content
---@field git_delete HEX Deleted content
---@field git_dirty HEX Dirty/unstaged changes
---@field git_ignore HEX Ignored files
---@field git_merge HEX Merge conflicts
---@field git_rename HEX Renamed content
---@field git_text HEX Git text (commit messages, etc.)

---@class SpecialPalette
---@field link HEX Links, URLs
---@field special HEX Special elements
---@field note HEX Notes in comments
---@field todo HEX TODOs in comments
---@field warning HEX Warning notes

---@class TerminalPalette
---@field black HEX Terminal black color
---@field bright_black HEX Terminal bright black color
---@field white HEX Terminal white color
---@field bright_white HEX Terminal bright white color
---@field red HEX Terminal red color
---@field bright_red HEX Terminal bright red color
---@field green HEX Terminal green color
---@field bright_green HEX Terminal bright green color
---@field yellow HEX Terminal yellow color
---@field bright_yellow HEX Terminal bright yellow color
---@field blue HEX Terminal blue color
---@field bright_blue HEX Terminal bright blue color
---@field magenta HEX Terminal magenta color
---@field bright_magenta HEX Terminal bright magenta color
---@field cyan HEX Terminal cyan color
---@field bright_cyan HEX Terminal bright cyan color

---@class ColorPalette
---@field palette BasePalette Base color palette
---@field ui UIPalette UI element colors
---@field syntax SyntaxPalette Syntax element colors
---@field semantic SemanticPalette Semantic element colors
---@field git GitPalette Git element colors
---@field special SpecialPalette Special element colors
---@field none string Special "NONE" value
---@field terminal TerminalPalette Terminal colors

local util = require("sarnai.util")

local M = {}

---Base Palette
---@type BasePalette
M.base_palette = {
  -- Core base colors
  base = "#172620",
  surface = "#21362d",
  overlay = "#2d493d",
  muted = "#4e7e6b",
  subtle = "#90bbaa",
  text = "#dfece7",

  -- Core accent colors
  sarnai = "#f0c3cb",
  anis = "#ff6b6b",
  chatsalgan = "#e5951a",
  els = "#cca24d",
  uvs = "#80b946",
  nuur = "#2b879e",
  mus = "#9deaea",
  yargui = "#d5b3e5",
}

-- Generate a color palette from a base palette
---@param p BasePalette Base palette to generate from
---@return ColorPalette Full color palette with derived colors
function M.generate_color_palette(p)
  ---@type ColorPalette
  local colors = {
    palette = p,
    ui = {
      bg = p.base,          -- Main editor background
      bg_float = p.surface, -- Floating window/popup background
      bg_popup = p.overlay, -- Selected/highlighted item background
      fg = p.text,          -- Main text color
      border = p.sarnai,    -- Border color
      accent = p.sarnai     -- Primary accent color
    },
    syntax = {
      punctuation = p.subtle, -- Punctuation, delimiters
      comment = p.muted,      -- Comments
      constant = p.els,       -- Constants, numbers
      string = p.els,         -- Strings
      functions = p.sarnai,   -- Functions, methods
      boolean = p.sarnai,     -- Booleans
      keyword = p.nuur,       -- Keywords
      operator = p.subtle,    -- Operators
      type = p.mus,           -- Types, classes
      variable = p.text,      -- Variables
    },
    semantic = {
      error = p.anis,                                   -- Errors
      error_bg = util.blend(p.anis, p.base, 0.15),      -- Error background
      warn = p.chatsalgan,                              -- Warnings
      warn_bg = util.blend(p.chatsalgan, p.base, 0.15), -- Warning background
      info = p.nuur,                                    -- Information
      info_bg = util.blend(p.nuur, p.base, 0.15),       -- Info background
      hint = p.sarnai,                                  -- Hints
      hint_bg = util.blend(p.sarnai, p.base, 0.15),     -- Hint background
      ok = p.uvs,                                       -- Success/OK
      ok_bg = util.blend(p.uvs, p.base, 0.15),          -- Success background
    },
    git = {
      git_add = p.uvs,      -- Added content
      git_change = p.els,   -- Changed content
      git_delete = p.anis,  -- Deleted content
      git_dirty = p.sarnai, -- Dirty/unstaged changes
      git_ignore = p.muted, -- Ignored files
      git_merge = p.yargui, -- Merge conflicts
      git_rename = p.nuur,  -- Renamed content
      git_text = p.sarnai,  -- Git text (commit messages, etc.)
    },
    special = {
      link = p.nuur,          -- Links, URLs
      special = p.mus,        -- Special elements
      note = p.nuur,          -- Notes in comments
      todo = p.sarnai,        -- TODOs in comments
      warning = p.chatsalgan, -- Warning notes
    },
    none = "NONE",
    terminal = util.get_terminal_colors(p),
  }

  return colors
end

-- Function to get the khavar (dark) theme
---@return ColorPalette
function M.get_khavar()
  return M.generate_color_palette(M.base_palette)
end

-- Function to get the ovol (light) theme
---@return ColorPalette
function M.get_ovol()
  local light_palette = util.to_light_theme(M.base_palette)

  return M.generate_color_palette(light_palette)
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

