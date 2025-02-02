local M = {}

function M.get_highlights(palette)
	return {
		MiniStatuslineModeNormal  = { fg = palette.base, bg = palette.pink },
		MiniStatuslineModeInsert  = { fg = palette.base, bg = palette.yellow },
		MiniStatuslineModeVisual  = { fg = palette.base, bg = palette.green },
		MiniStatuslineModeReplace = { fg = palette.base, bg = palette.red },
		MiniStatuslineModeCommand = { fg = palette.base, bg = palette.teal },
		MiniStatuslineModeOther   = { fg = palette.base, bg = palette.blue },
		MiniStatuslineDevinfo     = { fg = palette.text, bg = palette.surface },
		MiniStatuslineFilename    = { fg = palette.subtle, bg = palette.overlay },
		MiniStatuslineFileinfo    = { fg = palette.text, bg = palette.surface },
		MiniStatuslineInactive    = { fg = palette.muted, bg = palette.surface },
	}
end

return M
