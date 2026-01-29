local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local styles = opts.styles or {}
	local p = colors.palette
	local ui = colors.ui

	return {
		TroubleNormal = { fg = ui.fg, bg = ui.bg_float },
		TroubleText   = { fg = p.subtle },
		TroubleCount  = { fg = ui.accent, bg = p.overlay, bold = styles.bold },
	}
end

return M
