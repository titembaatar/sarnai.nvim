local colors = require("sarnai.colors")

local M = {}

M.highlight_groups = function(variant)
	local c = colors.get_colors(variant)

	return {
		-- 🌿 General UI
		Normal = { fg = c.text, bg = c.base },
		NormalNC = { fg = c.text, bg = c.base },
		NormalFloat = { fg = c.text, bg = c.surface },
		FloatBorder = { fg = c.subtle, bg = c.surface },
		Visual = { bg = c.low },
		CursorLine = { bg = c.overlay },
		CursorColumn = { bg = c.overlay },
		LineNr = { fg = c.muted },
		CursorLineNr = { fg = c.text, bold = true },
		ColorColumn = { bg = c.surface },
		SignColumn = { bg = c.base },
		StatusLine = { fg = c.text, bg = c.surface },
		StatusLineNC = { fg = c.muted, bg = c.overlay },

		-- 🔧 Treesitter Syntax Groups
		["@punctuation.bracket"] = { fg = c.text },
		["@constructor"] = { fg = c.teal },
		["@function"] = { fg = c.pink },
		["@keyword"] = { fg = c.blue, bold = true },
		["@string"] = { fg = c.yellow },
		["@variable"] = { fg = c.green },
		["@variable.member"] = { fg = c.teal },
		["@parameter"] = { fg = c.teal, italic = true },
		["@type"] = { fg = c.teal, bold = true },
		["@constant"] = { fg = c.red },

		-- 🔤 Syntax
		Comment = { fg = c.muted, italic = true },
		Constant = { fg = c.red },
		String = { fg = c.yellow },
		Character = { fg = c.yellow },
		Number = { fg = c.teal },
		Boolean = { fg = c.blue },
		Float = { fg = c.teal },
		Function = { fg = c.pink },
		Keyword = { fg = c.blue, bold = true },
		Identifier = { fg = c.text },
		Statement = { fg = c.blue },
		Operator = { fg = c.teal },
		Type = { fg = c.teal, bold = true },
		StorageClass = { fg = c.blue },
		Structure = { fg = c.teal },
		Typedef = { fg = c.teal },
		PreProc = { fg = c.yellow },
		Include = { fg = c.blue },
		Define = { fg = c.blue },
		Macro = { fg = c.yellow },
		Debug = { fg = c.red },
		Error = { fg = c.red, bold = true },
		Todo = { fg = c.yellow, bg = c.overlay, bold = true },

		-- 📂 File Navigation
		Directory = { fg = c.blue },

		-- 📋 Markdown / Text
		markdownHeadingDelimiter = { fg = c.yellow, bold = true },
		markdownCode = { fg = c.green },
		markdownItalic = { fg = c.teal, italic = true },
		markdownBold = { fg = c.pink, bold = true },

		-- 🛠️ LSP Diagnostics
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.green },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.green },

		-- 🛠️ LSP Semantic Tokens
		["@lsp.type.function"] = { fg = c.pink },
		["@lsp.type.variable"] = { fg = c.green },
		["@lsp.type.parameter"] = { fg = c.teal, italic = true },
		["@lsp.type.keyword"] = { fg = c.blue, bold = true },

		-- 🔍 Telescope
		TelescopeBorder = { fg = c.subtle },
		TelescopePromptBorder = { fg = c.pink },
		TelescopeMatching = { fg = c.yellow },

		-- 🗂️ Completion (nvim-cmp)
		CmpItemAbbr = { fg = c.text },
		CmpItemKind = { fg = c.teal },
		CmpItemMenu = { fg = c.subtle },

		-- 📂 Oil.nvim (File Explorer)
		OilDirectory = { fg = c.blue, bold = true },
		OilFile = { fg = c.text },

		-- 📊 Mini.nvim Statusline
		MiniStatuslineModeNormal = { fg = c.base, bg = c.pink, bold = true },
		MiniStatuslineModeInsert = { fg = c.base, bg = c.yellow, bold = true },
		MiniStatuslineModeVisual = { fg = c.base, bg = c.green, bold = true },
		MiniStatuslineModeReplace = { fg = c.base, bg = c.red, bold = true },
	}
end

function M.apply(variant, overrides)
	local hl_groups = M.highlight_groups(variant)

	if overrides then
		hl_groups = vim.tbl_extend("force", hl_groups, overrides)
	end

	for group, hl in pairs(hl_groups) do
		vim.api.nvim_set_hl(0, group, hl)
	end
end

return M
