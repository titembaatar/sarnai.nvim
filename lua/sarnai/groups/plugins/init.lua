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
---@return Groups
function M.get(palette, config)
	---@type Groups
	local groups = {}

	---@type table<string, boolean>
	local loaded = {}

	for lazy_name, module_name in pairs(M.plugins) do
		if loaded[module_name] then goto continue end

		if require("lua.sarnai.util.plugin").is_enabled(lazy_name, module_name, config) then
			local success, plugin_highlights = pcall(require, "sarnai.highlights.plugins." .. module_name)

			if success and type(plugin_highlights.get) == "function" then
				groups = vim.tbl_deep_extend("force", groups, plugin_highlights.get(palette, config))
				loaded[module_name] = true
			end
		end

		::continue::
	end

	return groups
end

return M
