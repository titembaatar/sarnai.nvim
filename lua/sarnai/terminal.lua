local M = {}

function M.terminal()
	local shono = require("sarnai.palettes").shono
	local udesh = require("sarnai.palettes").udesh
	-- dark
	vim.g.terminal_color_0 = shono.base
	vim.g.terminal_color_8 = udesh.base

	-- light
	vim.g.terminal_color_7 = shono.text
	vim.g.terminal_color_15 = udesh.text

	-- colors
	vim.g.terminal_color_1 = shono.anis
	vim.g.terminal_color_9 = udesh.anis

	vim.g.terminal_color_2 = shono.uvs
	vim.g.terminal_color_10 = udesh.uvs

	vim.g.terminal_color_3 = shono.els
	vim.g.terminal_color_11 = udesh.els

	vim.g.terminal_color_4 = shono.mus
	vim.g.terminal_color_12 = udesh.mus

	vim.g.terminal_color_5 = shono.sarnai
	vim.g.terminal_color_13 = udesh.sarnai

	vim.g.terminal_color_6 = shono.nuur
	vim.g.terminal_color_14 = udesh.nuur
end

return M
