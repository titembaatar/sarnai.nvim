--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you.
--]]
local M = {}

M.url="https://github.com/folke/which-key.nvim"

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local transparent_bg = opts.transparent and "NONE" or nil
	local p = colors.palette
	local ui = colors.ui
	local sem = colors.semantic
	local syntax = colors.syntax

	return {
		WhichKey           = { fg = syntax._function },
		WhichKeyBorder     = { fg = ui.border, bg = transparent_bg or ui.bg },
		WhichKeyDesc       = { fg = ui.fg },
		WhichKeyGroup      = { fg = p.mus },
		WhichKeyIcon       = { fg = p.nuur },
		WhichKeyIconAzure  = { fg = syntax._function },
		WhichKeyIconBlue   = { fg = sem.info },
		WhichKeyIconCyan   = { fg = sem.hint },
		WhichKeyIconGreen  = { fg = sem.ok },
		WhichKeyIconGrey   = { fg = p.subtle },
		WhichKeyIconOrange = { fg = sem.warn },
		WhichKeyIconPurple = { fg = syntax.constant },
		WhichKeyIconRed    = { fg = sem.error },
		WhichKeyIconYellow = { fg = sem.warn },
		WhichKeyNormal     = { fg = ui.fg, bg     = ui.bg },
		WhichKeySeparator  = { fg = p.muted },
		WhichKeyTitle      = { fg = ui.border },
		WhichKeyValue      = { fg = syntax.comment },
	}
end

return M
