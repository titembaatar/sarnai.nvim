local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		MiniStatuslineModeNormal  = { fg = palette.base, bg = palette.sarnai },
		MiniStatuslineModeInsert  = { fg = palette.base, bg = palette.els },
		MiniStatuslineModeVisual  = { fg = palette.base, bg = palette.uvs },
		MiniStatuslineModeReplace = { fg = palette.base, bg = palette.anis },
		MiniStatuslineModeCommand = { fg = palette.base, bg = palette.mus },
		MiniStatuslineModeOther   = { fg = palette.base, bg = palette.nuur },
		MiniStatuslineDevinfo     = { fg = palette.text, bg = palette.surface },
		MiniStatuslineFilename    = { fg = palette.subtle, bg = palette.overlay },
		MiniStatuslineFileinfo    = { fg = palette.text, bg = palette.surface },
		MiniStatuslineInactive    = { fg = palette.muted, bg = palette.surface },
	}
end

return M
