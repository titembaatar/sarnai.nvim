local config = require("sarnai.config").extend()

local M = {}

function M.get_highlights(palette)
	local styles = config.opts.styles

	return {
		BlinkCmpMenu   = { fg = palette.text, bg = palette.overlay },
		BlinkCmpLabel  = { fg = palette.text, bg = palette.overlay },
		BlinkCmpBorder = { fg = palette.blue },
		BlinkCmpDoc    = { fg = palette.green },
		BlinkCmpMatch  = { fg = palette.pink, bold = styles.bold },
	}
end

return M
