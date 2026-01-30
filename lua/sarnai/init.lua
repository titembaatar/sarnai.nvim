local Colors = require("sarnai.colors")
local Groups = require("sarnai.groups")

local M = {}

M.version = "1.0.0"

---@param opts? SarnaiConfig
function M.load(opts)
	opts = require("sarnai.config").extend(opts)

	local colors, groups = {}, {}

	if opts.cache then
		local c, g, was_cached = require("sarnai.cache").setup(opts, M.version)
		colors = c
		groups = g

		if not was_cached then
			colors = Colors.get(opts)
			groups = Groups.get(colors, opts)
			require("sarnai.cache").write(opts.style, {
				version = M.version,
				config = opts,
				colors = colors,
				groups = groups,
			})
		end
	else
		colors = Colors.get(opts)
		groups = Groups.get(colors, opts)
	end

	Groups.setup(groups)
	if vim.o.termguicolors and opts.terminal_colors then
		require("sarnai.terminal").setup(colors)
	end

  if vim.g.colors_name then vim.cmd("hi clear") end
	vim.o.termguicolors = true
  vim.g.colors_name = "sarnai-" .. opts.style
end

M.clear_cache = require("sarnai.cache").clear

M.setup = require("sarnai.config").setup

return M

