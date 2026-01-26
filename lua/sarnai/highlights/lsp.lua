local color = require("sarnai.util.color")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
	local p = colors.palette
	local ui = colors.ui
	local sem = colors.semantic
	local special = colors.special

	local styles = opts.styles or {}
	local transparent_bg = opts.transparent and "NONE" or nil

	return {
		DiagnosticError = { fg = sem.error },
		DiagnosticWarn  = { fg = sem.warn },
		DiagnosticInfo  = { fg = sem.info },
		DiagnosticHint  = { fg = sem.hint },
		DiagnosticOk    = {fg = sem.ok },

		DiagnosticUnderlineError = { undercurl = true, sp = sem.error },
		DiagnosticUnderlineWarn  = { undercurl = true, sp = sem.warn },
		DiagnosticUnderlineInfo  = { undercurl = true, sp = sem.info },
		DiagnosticUnderlineHint  = { undercurl = true, sp = sem.hint },
		DiagnosticUnderlineOk    = { undercurl = true, sp = sem.ok },

		DiagnosticVirtualTextError = {fg = sem.error, bg = transparent_bg or sem.error_bg},
		DiagnosticVirtualTextWarn  = {fg = sem.warn, bg = transparent_bg or sem.warn_bg},
		DiagnosticVirtualTextInfo  = {fg = sem.info, bg = transparent_bg or sem.info_bg},
		DiagnosticVirtualTextHint  = {fg = sem.hint, bg = transparent_bg or sem.hint_bg},
		DiagnosticVirtualTextOk    = {fg = sem.ok, bg = transparent_bg or sem.ok_bg},

		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingWarn  = { link = "DiagnosticWarn" },
		DiagnosticFloatingInfo  = { link = "DiagnosticInfo" },
		DiagnosticFloatingHint  = { link = "DiagnosticHint" },
		DiagnosticFloatingOk    = {link = "DiagnosticOk" },

		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignWarn  = { link = "DiagnosticWarn" },
		DiagnosticSignInfo  = { link = "DiagnosticInfo" },
		DiagnosticSignHint  = { link = "DiagnosticHint" },
		DiagnosticSignOk    = {link = "DiagnosticOk" },

		DiagnosticDeprecated  = { strikethrough = true },
		DiagnosticUnnecessary = {fg = p.muted, bg = transparent_bg, italic = styles.italic},

		LspReferenceText  = { bg = p.surface },
		LspReferenceRead  = { link = "LspReferenceText" },
		LspReferenceWrite = { bg = color.blend(special.link, ui.bg, 0.2) },

		LspCodeLens          = { fg = p.muted },
		LspCodeLensSeparator = { fg = p.muted },

		LspInlayHint = { fg = p.muted, bg = transparent_bg or ui.bg, italic = styles.italic },

		LspSignatureActiveParameter = {fg = sem.warn, bg = transparent_bg or sem.warn_bg},                                                                                       -- Active parameter in signature help

		NormalFloat = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
		FloatBorder = { fg = ui.border, bg = transparent_bg or ui.bg_float },
		FloatTitle  = { fg = ui.border, bg = transparent_bg or ui.bg_float, bold = styles.bold },

		LightBulb         = { fg = sem.hint },
		LightBulbSign     = { link = "LightBulb" },
		LightBulbFloatWin = { link = "LightBulb" },

		LspRenameTitle = { fg = sem.hint, bold = styles.bold },
		LspRenameMatch = { bg = color.blend(sem.hint, ui.bg, 0.2) },

		CmpItemAbbr           = { fg = p.subtle },
		CmpItemAbbrDeprecated = { fg = p.subtle, strikethrough = true },
		CmpItemAbbrMatch      = { fg = ui.fg, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = ui.fg, bold = styles.bold },
		CmpItemKind           = { fg = p.subtle },
		CmpItemKindClass      = { link = "StorageClass" },
		CmpItemKindFunction   = { link = "Function" },
		CmpItemKindInterface  = { link = "Type" },
		CmpItemKindMethod     = { link = "PreProc" },
		CmpItemKindSnippet    = { link = "String" },
		CmpItemKindVariable   = { link = "Identifier" },
	}
end

return M
