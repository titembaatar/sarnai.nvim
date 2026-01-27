local Config = require("sarnai.config")
local Colors = require("sarnai.colors")
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

	local palette = Colors.get(opts.style)

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(palette)
	end

	if vim.g.colors_name then vim.cmd("hi clear") end

	vim.o.background = opts.style == "ovol" and "light" or "dark"

	if vim.o.termguicolors and opts.terminal_colors then
		Term.set_colors(palette)
	end

	Groups.setup(palette, opts)

	vim.g.colors_name = "sarnai-" .. opts.style

	return palette
end

return M

