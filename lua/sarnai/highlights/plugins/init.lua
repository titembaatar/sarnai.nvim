local M = {}

---@type table<string, string>
M.plugins = {
	-- In use
	["blink.cmp"]            = "blink_cmp",
	["snacks.nvim"]          = "snacks",
	["mini.nvim"]            = "mini",
	["render-markdown.nvim"] = "render_markdown",
	["trouble.nvim"]         = "trouble",

	-- Stopped maintenance
	["fzf-lua"]        = "fzf_lua",
	["gitsigns.nvim"]  = "git",
	["nvim-dap"]       = "dap",
	["telescope.nvim"] = "telescope",
	["which-key.nvim"] = "which_key",
}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
	---@type Highlights
	local highlights = {}

	---@type table<string, boolean>
	local loaded = {}

	for lazy_name, module_name in pairs(M.plugins) do
		if loaded[module_name] then goto continue end

		if require("sarnai.util.plugins").is_enabled(lazy_name, module_name, config) then
			local success, plugin_highlights = pcall(require, "sarnai.highlights.plugins." .. module_name)

			if success and type(plugin_highlights.get) == "function" then
				highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights.get(palette, config))
				loaded[module_name] = true
			end
		end

		::continue::
	end

	return highlights
end

return M
