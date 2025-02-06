local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		BlinkCmpMenu            = { fg = palette.text, bg = palette.overlay },
		BlinkCmpMenuSelection   = { fg = palette.base, bg = palette.sarnai },

		BlinkCmpScrollBarThumb  = { bg = palette.muted },
		BlinkCmpScrollBarGutter = { bg = palette.overlay },
	}
end

return M
