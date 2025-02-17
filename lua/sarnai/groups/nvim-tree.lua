local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	return {
		NvimTreeFolderIcon   = { bg = c.none, fg = c.nuur },
		NvimTreeGitDeleted   = { fg = c.git.delete },
		NvimTreeGitDirty     = { fg = c.git.change },
		NvimTreeGitNew       = { fg = c.git.add },
		NvimTreeImageFile    = { fg = c.fg_sidebar },
		NvimTreeIndentMarker = { fg = c.text },
		NvimTreeNormal       = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NvimTreeNormalNC     = { fg = c.fg_sidebar, bg = c.bg_sidebar },
		NvimTreeOpenedFile   = { bg = c.high },
		NvimTreeRootFolder   = { fg = c.nuur, bold = true },
		NvimTreeSpecialFile  = { fg = c.sarnai, underline = true },
		NvimTreeSymlink      = { fg = c.nuur },
		NvimTreeWinSeparator = { fg = opts.styles.sidebars == "transparent" and c.border or c.bg_sidebar, bg = c.bg_sidebar },
	}
end

return M
