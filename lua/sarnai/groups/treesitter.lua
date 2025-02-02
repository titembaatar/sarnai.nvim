local config = require("sarnai.config").extend()

local M = {}

function M.get_highlights(palette)
	local styles = config.opts.styles

	return {
		["@comment"]                        = { fg = palette.muted, italic = styles.italic },
		["@string"]                         = { fg = palette.yellow },
		["@function"]                       = { fg = palette.pink, bold = styles.bold },
		["@keyword"]                        = { fg = palette.red },
		["@type"]                           = { fg = palette.green },
		["@variable"]                       = { fg = palette.blue },
		["@operator"]                       = { fg = palette.text },
		["@parameter"]                      = { fg = palette.blue },
		["@field"]                          = { fg = palette.green },
		["@constant"]                       = { fg = palette.teal },
		["@constructor"]                    = { fg = palette.pink },

		-- Markdown-specific Treesitter groups
		["@text.heading.h1"]                = { fg = palette.blue, bold = styles.bold },
		["@text.heading.h2"]                = { fg = palette.green, bold = styles.bold },
		["@text.heading.h3"]                = { fg = palette.yellow, bold = styles.bold },
		["@text.heading.h4"]                = { fg = palette.red, bold = styles.bold },
		["@text.heading.h5"]                = { fg = palette.pink, bold = styles.bold },
		["@text.heading.h6"]                = { fg = palette.teal, bold = styles.bold },
		["@text.title"]                     = { fg = palette.blue, bold = true },
		["@text.emphasis"]                  = { italic = styles.italic },
		["@text.strong"]                    = { bold = styles.bold },
		["@text.uri"]                       = { fg = palette.pink, underline = true },
		["@text.literal"]                   = { bg = palette.surface, fg = palette.yellow },
		["@text.reference"]                 = { fg = palette.red, underline = true },
		["@text.quote"]                     = { fg = palette.muted, italic = true },
		["@punctuation.delimiter.markdown"] = { fg = palette.muted },
		["@text.codeblock"]                 = { bg = palette.overlay, fg = palette.yellow },
	}
end

return M
