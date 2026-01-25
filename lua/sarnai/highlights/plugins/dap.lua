--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you.
--]]
local util = require("sarnai.util")

local M = {}

M.url="https://github.com/mfussenegger/nvim-dap"

---@param colors ColorPalette
---@return Highlights
function M.get(colors)
	local sem = colors.semantic
	local ui = colors.ui

	return {
		DapStoppedLine = { bg = util.blend(sem.warn, ui.bg, 0.1) },
	}
end

return M
