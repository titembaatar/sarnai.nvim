--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you.
--]]
local M = {}

M.url="https://github.com/lewis6991/gitsigns.nvim"

---@param colors ColorPalette
---@return Highlights
function M.get(colors)
	local git = colors.git

	return {
		-- Gitsigns
		GitSignsAdd    = { fg = git.git_add },
		GitSignsChange = { fg = git.git_change },
		GitSignsDelete = { fg = git.git_delete },
	}
end

return M
