---@class StyleConfig
---@field italic? boolean
---@field bold? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class PluginsConfig
---@field all boolean # Enable all plugins by default when not using lazy.nvim
---@field auto boolean # Use plugin manager to automatically enable plugins (only lazy.nvim supported)
---@field mini? boolean
---@field trouble? boolean
---@field which_key? boolean
---@field telescope? boolean
---@field fzf_lua? boolean
---@field git? boolean
---@field zen_mode? boolean
---@field nvim_dap? boolean
---@field blink_cmp? boolean
---@field snacks? boolean

---@class SarnaiConfig
---@field style Style # The theme style: "khavar" (dark) or "ovol" (light)
---@field transparent boolean # Whether to use transparent backgrounds
---@field terminal_colors boolean # Whether to set terminal colors
---@field styles table<string, boolean|StyleConfig> # Styling for different elements
---@field plugins PluginsConfig # Plugin-specific configuration
---@field cache boolean # Whether to cache highlights (default: true)
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
    italic = true,
    bold = true,
    underline = true,
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
  plugins = {
    -- Enable all plugins when not using lazy.nvim
    -- Set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- Uses your plugin manager to automatically enable needed plugins
    -- Currently only lazy.nvim is supported
    auto = true,
    -- Override specific plugins here
    -- mini = true,
    -- trouble = true,
    -- etc.
  },
  cache = true, -- Enable caching by default
}

return M
