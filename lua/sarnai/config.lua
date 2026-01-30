---@class StyleConfig
---@field italic? boolean
---@field bold? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field strikethrough? boolean

---@class PluginsConfig
---@field all boolean
---@field auto boolean
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
---@field style Style
---@field transparent? boolean
---@field terminal_colors? boolean
---@field styles? table<string, boolean|StyleConfig>
---@field plugins? PluginsConfig
---@field cache? boolean
---@field on_colors? fun(colors: ColorPalette): nil
---@field on_highlights? fun(highlights: table, colors: ColorPalette): nil

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
		undercurl = true,
		strikethrough = true,
		comments = { italic = true },
		keywords = {},
		functions = {},
		variables = {},
	},
	plugins = {
		all = package.loaded.lazy == nil,
		auto = true,
	},
	cache = true,
}

---@type SarnaiConfig
M.options = nil

---@param options? SarnaiConfig
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? SarnaiConfig
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

return M
