local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		TelescopeNormal       = { fg = palette.text, bg = palette.base },
		TelescopeBorder       = { fg = palette.muted },
		TelescopePromptNormal = { fg = palette.test, bg = palette.base },
		TelescopeSelection    = { fg = palette.text, bg = palette.low },
		TelescopeMatching     = { fg = palette.sarnai, bold = true },
	}
end

return M
