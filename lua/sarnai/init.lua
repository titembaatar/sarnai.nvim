local config = require("sarnai.config")

local M = {}
---@type {light?: string, dark?: string}
M.styles = {}

---@param opts? sarnai.Config
function M.load(opts)
	opts = require("sarnai.config").extend(opts)
	local bg = vim.o.background
	local style_bg = opts.style == "ovol" and "light" or "dark"

	if bg ~= style_bg then
		if vim.g.colors_name == "sarnai-" .. opts.style then
			opts.style = bg == "light" and (M.styles.light or "day") or (M.styles.dark or "khavar")
		else
			vim.o.background = style_bg
		end
	end
	M.styles[vim.o.background] = opts.style
	return require("sarnai.theme").setup(opts)
end

M.setup = config.setup

return M
