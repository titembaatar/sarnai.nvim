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

	local c = Colors.get(opts.style)

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(c)
	end

	if vim.g.colors_name then vim.cmd("hi clear") end

	vim.o.background = opts.style == "ovol" and "light" or "dark"

	if vim.o.termguicolors and opts.terminal_colors then
		Term.setup(c)
	end

	Groups.setup(c, opts)

	vim.g.colors_name = "sarnai-" .. opts.style

	return c
end

return M

