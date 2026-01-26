local config = require("sarnai.config")
local colors = require("sarnai.colors")
local cache = require("sarnai.util.cache")
local terminal = require("sarnai.util.terminal")
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

	local is_cache = opts.cache ~= false
	local cache_key = is_cache and cache.generate(opts) or nil

	if is_cache and cache_key and cache.exists(cache_key) then
		local stored = cache.get(cache_key)

		vim.g.colors_name = "sarnai-" .. opts.style
		vim.o.background = opts.style == "ovol" and "light" or "dark"

		if stored ~= nil then
			highlights.set(stored.highlights)
			return stored.palette
		end
	end

	local palette = colors.get(opts.style)

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(palette)
	end

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.background = opts.style == "ovol" and "light" or "dark"

	vim.o.termguicolors = true
	if opts.terminal_colors ~= false then
		terminal.set_colors(palette)
	end

	local hl = highlights.get(palette, opts)

	highlights.set(hl)

	vim.g.colors_name = "sarnai-" .. opts.style

	if is_cache and cache_key then
		cache.store(cache_key, hl, palette)
	end

	return palette
end

function M.clear_cache()
	cache.clear()
end

return M

