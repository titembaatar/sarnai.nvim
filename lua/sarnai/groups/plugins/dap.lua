--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you.
--]]
local Util = require("sarnai.util")

local M = {}

M.url="https://github.com/mfussenegger/nvim-dap"

---@param colors ColorPalette
---@return Groups
function M.get(colors)
	local ui = colors.ui
	local sem = colors.semantic

	return {
		DapStoppedLine = { bg = Util.blend(sem.warn, ui.bg, 0.1) },
	}
end

return M
