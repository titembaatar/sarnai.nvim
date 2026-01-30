local Config = require("sarnai.config")
local Colors = require("sarnai.colors")
local Term = require("sarnai.terminal")
local Groups = require("sarnai.groups")

local M = {}


---@param opts? SarnaiConfig
function M.load(opts)
	opts = require("sarnai.config").extend(opts)

	local c = Colors.get(opts)
	local g = Groups.get(c, opts)
	Groups.setup(g)
	if vim.o.termguicolors and opts.terminal_colors then
		Term.setup(c)
	end

  if vim.g.colors_name then vim.cmd("hi clear") end
	vim.o.termguicolors = true
  vim.g.colors_name = "sarnai-" .. opts.style
end

M.setup = Config.setup

return M

