local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		LazyGitBorder = { fg = palette.muted },
	}
end

return M
