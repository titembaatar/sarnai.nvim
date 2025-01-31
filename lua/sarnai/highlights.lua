local M = {}

function M.set_highlights(colors)
	local highlight = vim.api.nvim_set_hl

	-- General UI
	highlight(0, "Normal", { fg = colors.text, bg = colors.base })
	highlight(0, "NormalFloat", { fg = colors.text, bg = colors.surface })
	highlight(0, "Comment", { fg = colors.muted, italic = true })

	-- Syntax
	highlight(0, "Keyword", { fg = colors.blue, bold = true })
	highlight(0, "Function", { fg = colors.pink, bold = true })
	highlight(0, "String", { fg = colors.yellow })
	highlight(0, "Type", { fg = colors.teal, bold = true })
	highlight(0, "Constant", { fg = colors.red })

	-- UI Elements
	highlight(0, "CursorLine", { bg = colors.overlay })
	highlight(0, "Visual", { bg = colors.low })
	highlight(0, "Search", { fg = colors.base, bg = colors.high })
	highlight(0, "Pmenu", { fg = colors.text, bg = colors.surface })

	-- Diagnostics
	highlight(0, "Error", { fg = colors.red, bold = true })
	highlight(0, "Warning", { fg = colors.yellow })
	highlight(0, "Information", { fg = colors.blue })
	highlight(0, "Hint", { fg = colors.green })
end

return M
