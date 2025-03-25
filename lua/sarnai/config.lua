---@class StyleConfig
---@field italic? boolean
---@field bold? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class SarnaiConfig
---@field style Style # The theme style: "khavar" (dark) or "ovol" (light)
---@field transparent boolean # Whether to use transparent backgrounds
---@field terminal_colors boolean # Whether to set terminal colors
---@field styles table<string, StyleConfig> # Styling for different elements
---@field on_colors? fun(colors: ColorPalette): nil # Function to override colors
---@field on_highlights? fun(highlights: table, colors: ColorPalette): nil # Function to override highlights

local M = {}

-- Default configuration
---@type SarnaiConfig
M.defaults = {
  style = "khavar", -- The theme comes in 2 styles: "khavar" (dark) and "ovol" (light)
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
}

return M
