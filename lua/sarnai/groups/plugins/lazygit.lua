local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		LazygitNormal     = { fg = palette.text, bg = palette.base },
		LazygitBorder     = { fg = palette.muted },
		LazygitGitAdded   = { fg = palette.uvs },
		LazygitGitChanged = { fg = palette.els },
		LazygitGitRemoved = { fg = palette.anis },
	}
end

return M
