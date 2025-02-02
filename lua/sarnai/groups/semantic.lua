local config = require("sarnai.config").extend()

local M = {}

function M.get_highlights(palette)
	local styles = config.opts.styles

	return {
		["@variable.builtin"] = { fg = palette.teal },
		["@function.builtin"] = { fg = palette.pink, bold = styles.bold },
		["@method"]           = { fg = palette.blue },
		["@property"]         = { fg = palette.green },
		["@parameter"]        = { fg = palette.blue },
		["@field"]            = { fg = palette.green },
		["@constructor"]      = { fg = palette.pink },
		["@keyword.function"] = { fg = palette.red },
	}
end

return M
