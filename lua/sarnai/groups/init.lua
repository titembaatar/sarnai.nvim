local Config = require("sarnai.config")
local Util = require("sarnai.util")

local M = {}

-- stylua: ignore
M.plugins = {
	["lazy.nvim"]            = "lazy",
	["mini.nvim"]      = "mini",
	["telescope.nvim"]       = "telescope",
	-- ["blink.cmp"]            = "blink",
	-- ["neo-tree.nvim"]        = "neo-tree",
	-- ["nvim-tree.lua"]        = "nvim-tree",
	-- ["render-markdown.nvim"] = "render-markdown",
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
	---@type {get: sarnai.HighlightsFn, url: string}
	return Util.mod("sarnai.groups." .. name)
end

---@param colors ColorScheme
---@param opts sarnai.Config
function M.get(name, colors, opts)
	local mod = M.get_group(name)
	return mod.get(colors, opts)
end

---@param colors ColorScheme
---@param opts sarnai.Config
function M.setup(colors, opts)
	local groups = {
		base = true,
		kinds = true,
		semantic_tokens = true,
		treesitter = true,
	}

	if opts.plugins.all then
		for _, group in pairs(M.plugins) do
			groups[group] = true
		end
	elseif opts.plugins.auto and package.loaded.lazy then
		local plugins = require("lazy.core.config").plugins
		for plugin, group in pairs(M.plugins) do
			if plugins[plugin] then
				groups[group] = true
			end
		end
	end

	-- manually enable/disable plugins
	for plugin, group in pairs(M.plugins) do
		local use = opts.plugins[group]
		use = use == nil and opts.plugins[plugin] or use
		if use ~= nil then
			if type(use) == "table" then
				use = use.enabled
			end
			groups[group] = use or nil
		end
	end

	local names = vim.tbl_keys(groups)
	table.sort(names)

	local cache_key = opts.style
	local cache = opts.cache and Util.cache.read(cache_key)

	local inputs = {
		colors = colors,
		plugins = names,
		version = Config.version,
		opts = { transparent = opts.transparent, styles = opts.styles, dim_inactive = opts.dim_inactive },
	}

	local ret = cache and vim.deep_equal(inputs, cache.inputs) and cache.groups

	if not ret then
		ret = {}
		-- merge highlights
		for group in pairs(groups) do
			for k, v in pairs(M.get(group, colors, opts)) do
				ret[k] = v
			end
		end
		Util.resolve(ret)
		if opts.cache then
			Util.cache.write(cache_key, { groups = ret, inputs = inputs })
		end
	end
	opts.on_highlights(ret, colors)

	return ret, groups
end

return M
