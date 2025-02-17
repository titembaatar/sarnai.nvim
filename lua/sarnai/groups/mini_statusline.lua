local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

---@type sarnai.HighlightsFn
function M.get(c)
	-- stylua: ignore
	return {
		MiniStatuslineDevinfo     = { fg = c.text, bg = c.overlay },
		MiniStatuslineFileinfo    = { fg = c.text, bg = c.overlay },
		MiniStatuslineFilename    = { fg = c.text, bg = c.surface },
		MiniStatuslineInactive    = { fg = c.text, bg = c.bg_statusline },
		MiniStatuslineModeCommand = { fg = c.base, bg = c.mus, bold = true },
		MiniStatuslineModeInsert  = { fg = c.base, bg = c.els, bold = true },
		MiniStatuslineModeNormal  = { fg = c.base, bg = c.sarnai, bold = true },
		MiniStatuslineModeOther   = { fg = c.base, bg = c.uvs, bold = true },
		MiniStatuslineModeReplace = { fg = c.base, bg = c.anis, bold = true },
		MiniStatuslineModeVisual  = { fg = c.base, bg = c.nuur, bold = true },
	}
end

return M
