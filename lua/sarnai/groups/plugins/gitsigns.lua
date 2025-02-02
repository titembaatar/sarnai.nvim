local M = {}

function M.get_highlights(palette)
	return {
		GitSignsAdd    = { fg = palette.green, bg = palette.base },
		GitSignsChange = { fg = palette.yellow, bg = palette.base },
		GitSignsDelete = { fg = palette.red, bg = palette.base },
	}
end

return M
