local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
	local p = colors.palette
	local sem = colors.semantic
	local ui = colors.ui

	return {
		-- Dashboard
		SnacksDashboardDir      = { fg = p.mus },
		SnacksDashboardKey      = { fg = p.nuur },
		SnacksDashboardDesc     = { fg = ui.fg },
		SnacksDashboardIcon     = { fg = ui.accent },
		SnacksDashboardFooter   = { fg = p.subtle },
		SnacksDashboardHeader   = { fg = ui.accent },
		SnacksDashboardSpecial  = { fg = p.chatsalgan },
		SnacksDashboardTitle    = { fg = ui.accent },
		SnacksDashboardFile     = { fg = ui.fg },
		SnacksDashboardNormal   = { fg = ui.fg },
		SnacksDashboardTerminal = { fg = ui.bg },

		-- Notifier
		SnacksNotifierInfo        = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierIconInfo    = { fg = sem.info },
		SnacksNotifierTitleInfo   = { fg = sem.info },
		SnacksNotifierBorderInfo  = { fg = sem.info, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierWarn        = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierIconWarn    = { fg = sem.warn },
		SnacksNotifierTitleWarn   = { fg = sem.warn },
		SnacksNotifierBorderWarn  = { fg = sem.warn, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierDebug       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierIconDebug   = { fg = sem.hint },
		SnacksNotifierTitleDebug  = { fg = sem.hint },
		SnacksNotifierBorderDebug = { fg = p.subtle, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierError       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierIconError   = { fg = sem.error },
		SnacksNotifierTitleError  = { fg = sem.error },
		SnacksNotifierBorderError = { fg = sem.error, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierTrace       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
		SnacksNotifierIconTrace   = { fg = sem.ok },
		SnacksNotifierTitleTrace  = { fg = sem.ok },
		SnacksNotifierBorderTrace = { fg = sem.ok, bg = opts.transparent and colors.none or ui.bg },
	}
end

return M
