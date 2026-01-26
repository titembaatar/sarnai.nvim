local M = {}

---@return boolean
function M.has_lazy()
	return package.loaded["lazy"] ~= nil
end

---@param name string
---@return boolean
function M.is_loaded(name)
	local ok, _ = pcall(require, name:gsub("%.nvim$", ""):gsub("-", "."))
	return ok
end

---@param lazy_name string
---@param module_name string
---@param config SarnaiConfig
---@return boolean
function M.is_enabled(lazy_name, module_name, config)
	local plugins = config.plugins or {}

	if plugins[module_name] ~= nil then
		return plugins[module_name]
	end

	if plugins.auto ~= false and M.has_lazy() then
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

	if plugins.all ~= false and not M.has_lazy() then
		return true
	end

	return M.is_loaded(lazy_name)
end

return M
