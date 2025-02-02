local config = require("sarnai.config").extend()

local M = {}

function M.get_highlights(palette)
	local styles = config.opts.styles

	return {
		-- Diagnostic highlights
		DiagnosticError             = { fg = palette.red, undercurl = styles.undercurl, sp = palette.red },
		DiagnosticWarn              = { fg = palette.yellow, undercurl = styles.undercurl, sp = palette.yellow },
		DiagnosticInfo              = { fg = palette.blue, undercurl = styles.undercurl, sp = palette.blue },
		DiagnosticHint              = { fg = palette.teal, undercurl = styles.undercurl, sp = palette.teal },

		-- LSP reference highlights
		LspReferenceText            = { bg = palette.overlay },
		LspReferenceRead            = { bg = palette.overlay },
		LspReferenceWrite           = { bg = palette.overlay },

		-- LSP signature active parameter (for example)
		LspSignatureActiveParameter = { bold = styles.bold, underline = styles.underline },
	}
end

return M
