local M = {}

function M.get_highlights(palette)
	return {
		WhichKey          = { fg = palette.blue, bold = true },
		WhichKeyGroup     = { fg = palette.green },
		WhichKeySeparator = { fg = palette.muted },
		WhichKeyDesc      = { fg = palette.text },
	}
end

return M
