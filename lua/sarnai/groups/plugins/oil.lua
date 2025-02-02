local M = {}

function M.get_highlights(palette)
	return {
		OilNormal = { fg = palette.text, bg = palette.base },
		OilBorder = { fg = palette.muted },
		OilDir    = { fg = palette.blue, bold = true },
	}
end

return M
