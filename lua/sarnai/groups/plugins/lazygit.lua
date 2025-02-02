local M = {}

function M.get_highlights(palette)
	return {
		LazygitNormal     = { fg = palette.text, bg = palette.base },
		LazygitBorder     = { fg = palette.muted },
		LazygitGitAdded   = { fg = palette.green },
		LazygitGitChanged = { fg = palette.yellow },
		LazygitGitRemoved = { fg = palette.red },
	}
end

return M
