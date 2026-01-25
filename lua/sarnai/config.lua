---@class StyleConfig
---@field italic? boolean
---@field bold? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class PluginsConfig
---@field all boolean # Enable all plugins when not using lazy.nvim
---@field auto boolean # Use lazy.nvim to enable plugins
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
---@field style Style # "khavar" (dark) or "ovol" (light)
---@field transparent boolean # transparent backgrounds
---@field terminal_colors boolean
---@field styles table<string, boolean|StyleConfig>
---@field plugins PluginsConfig
---@field cache boolean
---@field on_colors? fun(colors: ColorPalette): nil # override colors
---@field on_highlights? fun(highlights: table, colors: ColorPalette): nil # override highlights

local M = {}

---@type SarnaiConfig
M.defaults = {
	style = "khavar",
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
		all = package.loaded.lazy == nil,
		auto = true,
	},
	cache = true,
}

return M
