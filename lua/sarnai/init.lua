local config = require("sarnai.config")
local colors = require("sarnai.colors")
local util = require("sarnai.util")
local highlights = require("sarnai.highlights")

local M = {}

---@param opts? SarnaiConfig
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", config.defaults, opts or {})
end

---@param opts? SarnaiConfig
---@return ColorPalette
function M.load(opts)
	opts = vim.tbl_deep_extend("force", M.options or config.defaults, opts or {})

	local use_cache = opts.cache ~= false
	local cache_key = use_cache and util.get_cache_key(opts) or nil

	if use_cache and cache_key and util.has(cache_key) then
		local cached = util.get(cache_key)

		highlights.set(cached.highlights)
		vim.g.colors_name = "sarnai-" .. opts.style
		vim.o.background = opts.style == "ovol" and "light" or "dark"

		return cached.palette
	end

	local palette = colors.get_colors(opts.style)

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(palette)
	end

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.background = opts.style == "ovol" and "light" or "dark"

	vim.o.termguicolors = true
	if opts.terminal_colors ~= false then
		util.set_terminal_colors(palette)
	end

	local hl = highlights.get(palette, opts)

	highlights.set(hl)

	vim.g.colors_name = "sarnai-" .. opts.style

	if use_cache and cache_key then
		util.store(cache_key, hl, palette)
	end

	return palette
end

function M.clear_cache()
	util.clear()
end

return M

