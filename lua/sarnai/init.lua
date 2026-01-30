local Config = require("sarnai.config")
local Colors = require("sarnai.colors")
local Term = require("sarnai.terminal")
local Groups = require("sarnai.groups")

local M = {}

M.version = "1.0.0"

---@param opts? SarnaiConfig
function M.load(opts)
	opts = require("sarnai.config").extend(opts)

	local c, g = {}, {}

	if opts.cache then
		c, g = require("sarnai.cache").setup(opts)
	end

	if not c or not g then
		c, g = Colors.get(opts), Groups.get(c, opts)

		if opts.cache then
			require("sarnai.cache").write(opts.style, {
				version = M.version,
				config = opts,
				colors = c,
				groups = g,
			})
		end
	end

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

