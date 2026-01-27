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
	["fzf-lua"]              = "fzf_lua",
	["gitsigns.nvim"]        = "git",
	["nvim-dap"]             = "dap",
	["telescope.nvim"]       = "telescope",
	["which-key.nvim"]       = "which_key",
}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local plugins = {}

	if opts.plugins.all then
		for _, group in pairs(M.plugins) do
			plugins[group] = true
		end
	elseif opts.plugins.auto and package.loaded.lazy then
		local lazy_plugins = require("lazy.core.config").plugins
		for plugin, group in pairs(M.plugins) do
			if lazy_plugins[plugin] then
				plugins[group] = true
			end
		end
	end

	for plugin, group in pairs(M.plugins) do
		local use = opts.plugins[group]
		use = use == nil and opts.plugins[plugin] or use
		if use ~= nil then
			plugins[group] = use
		end
	end

	local groups = {}

	for plugin_module, enabled in pairs(plugins) do
		if enabled then
			local ok, plugin = pcall(require, "sarnai.groups.plugins." .. plugin_module)
			if ok and type(plugin.get) == "function" then
				local group = plugin.get(colors, opts)
				groups = vim.tbl_extend("force", groups, group)
			end
		end
	end

	return groups
end

return M
