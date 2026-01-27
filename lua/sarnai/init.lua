local Config = require("sarnai.config")
local Colors = require("sarnai.colors")
local Cache = require("sarnai.cache")
local Term = require("sarnai.terminal")
local Groups = require("sarnai.groups")

local M = {}

---@param opts? SarnaiConfig
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", Config.defaults, opts or {})
end

---@param opts? SarnaiConfig
---@return ColorPalette
function M.load(opts)
	opts = vim.tbl_deep_extend("force", M.options or Config.defaults, opts or {})

	local is_cache = opts.cache ~= false
	local cache_key = is_cache and Cache.generate(opts) or nil

	if is_cache and cache_key and Cache.exists(cache_key) then
		local stored = Cache.get(cache_key)

		vim.g.colors_name = "sarnai-" .. opts.style
		vim.o.background = opts.style == "ovol" and "light" or "dark"

		if stored ~= nil then
			Groups.set(stored)
			return stored.palette
		end
	end

	local palette = Colors.get(opts.style)

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(palette)
	end

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.background = opts.style == "ovol" and "light" or "dark"

	vim.o.termguicolors = true
	if opts.terminal_colors ~= false then
		Term.set_colors(palette)
	end

	local hl = Groups.get(palette, opts)

	Groups.set(hl)

	vim.g.colors_name = "sarnai-" .. opts.style

	if is_cache and cache_key then
		Cache.store(cache_key, hl, palette)
	end

	return palette
end

function M.clear_cache()
	Cache.clear()
end

return M

