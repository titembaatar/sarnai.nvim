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

---@param lazy_name string
---@param module_name string
---@param config SarnaiConfig
---@return boolean
function M.is_enabled(lazy_name, module_name, config)
	local plugins = config.plugins or {}

	if plugins[module_name] ~= nil then
		return plugins[module_name]
	end

	local is_lazy = package.loaded["lazy"] ~= nil

	if plugins.auto ~= false and is_lazy then
		local loaded_plugins = {}
		for _, p in ipairs(require("lazy").plugins()) do
			loaded_plugins[p.name] = true
		end

		if loaded_plugins[lazy_name] then
			return true
		end

		if lazy_name == "mini.nvim" then
			local rtp = vim.opt.runtimepath:get()
			for _, path in ipairs(rtp) do
				if path:match("mini%.nvim") then
					return true
				end
			end
		end
	end

	if plugins.all ~= false and not is_lazy then
		return true
	end

	local ok, _ = pcall(require, lazy_name:gsub("%.nvim$", ""):gsub("-", "."))
	return ok
end

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

		if M.is_enabled(lazy_name, module_name, config) then
			local success, plugin_highlights = pcall(require, "sarnai.groups.plugins." .. module_name)

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
