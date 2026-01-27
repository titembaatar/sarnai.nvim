--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you. And sorry TJ.
--]]
local M = {}

M.url="https://github.com/nvim-telescope/telescope.nvim"

---@param colors ColorPalette
---@return Groups
function M.get(colors)
	local p = colors.palette
	local ui = colors.ui

	return {
		TelescopeBorder         = { fg = ui.border, bg = ui.bg_float },
		TelescopeNormal         = { fg = ui.fg, bg = ui.bg_float },
		TelescopePromptBorder   = { fg = ui.accent, bg = ui.bg_float },
		TelescopePromptTitle    = { fg = ui.accent, bg = ui.bg_float },
		TelescopeResultsComment = { fg = p.muted },
	}
end

return M
