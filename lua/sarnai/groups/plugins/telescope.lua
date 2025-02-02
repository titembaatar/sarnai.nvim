local M = {}

function M.get_highlights(palette)
	return {
		TelescopeNormal       = { fg = palette.text, bg = palette.base },
		TelescopeBorder       = { fg = palette.green },
		TelescopePromptNormal = { fg = palette.test, bg = palette.base },
		TelescopeSelection    = { fg = palette.text, bg = palette.low },
		TelescopeMatching     = { fg = palette.pink, bold = true },
	}
end

return M
