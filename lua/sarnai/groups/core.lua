local config = require("sarnai.config").extend()

local M = {}

function M.get_highlights(palette)
	local styles = config.styles

	return {
		-- Editor basics
		Normal       = { fg = palette.text, bg = palette.base },
		Comment      = { fg = palette.muted, italic = styles.italic },
		Constant     = { fg = palette.teal },
		String       = { fg = palette.yellow },
		Identifier   = { fg = palette.blue },
		Function     = { fg = palette.pink },
		Statement    = { fg = palette.blue },
		Type         = { fg = palette.green },
		-- Visual and selection
		Visual       = { bg = palette.overlay },
		VisualNOS    = { bg = palette.overlay },
		CursorLine   = { bg = palette.surface },
		CursorColumn = { bg = palette.surface },
		-- Line numbers and cursor
		LineNr       = { fg = palette.muted },
		CursorLineNr = { fg = palette.text },
		-- Statusline and pop-up menus
		StatusLine   = { fg = palette.text, bg = palette.surface },
		StatusLineNC = { fg = palette.muted, bg = palette.base },
		Pmenu        = { fg = palette.text, bg = palette.surface },
		PmenuSel     = { fg = palette.base, bg = palette.blue },
	}
end

return M
