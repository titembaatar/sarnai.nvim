local Util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local styles = opts.styles or {}
	local transparent_bg = opts.transparent and "NONE" or nil
	local p = colors.palette
	local ui = colors.ui
	local sem = colors.semantic
	local special = colors.special
	local syntax = colors.syntax
	local git = colors.git

	return {
		-- Treesitter syntax groups
		-- See :h treesitter-highlight-groups
		["@variable"]           = { fg = syntax.variable, style = styles.variables },
		["@variable.builtin"]   = { fg = syntax.builtin, style = styles.variables },
		["@variable.parameter"] = { fg = syntax.parameter, style = styles.variables },
		["@variable.member"]    = {fg = syntax.property },

		["@string"]                = { link = "String" },
		["@string.documentation"]  = { fg = syntax.comment, italic = styles.italic },
		["@string.regexp"]         = { fg = syntax.regex },
		["@string.escape"]         = { fg = syntax.escape },
		["@string.special"]        = { fg = special.character },
		["@string.special.symbol"] = { fg = special.symbol },
		["@string.special.url"]    = { fg = special.link, underline = styles.underline },

		["@character"]         = { link = "Character" },
		["@character.special"] = { fg = special.character },

		["@boolean"]      = { link = "Boolean" },
		["@constant"]     = { link = "Constant" },
		["@number"]       = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@float"]        = { link = "Float" },

		["@type"]            = { link = "Type" },
		["@type.builtin"]    = { fg = syntax.builtin, italic = styles.italic },
		["@type.definition"] = { fg = syntax.type, bold = styles.bold },
		["@type.qualifier"]  = { fg = syntax.storage, italic = styles.italic },
		["@attribute"]       = { fg = syntax.decorator, bold = styles.bold },
		["@property"]        = { fg = syntax.property, italic = styles.italic },

		["@function"]             = { link = "Function" },
		["@function.builtin"]     = { fg = syntax.builtin, italic = styles.italic },
		["@function.macro"]       = { fg = syntax.macro, bold = styles.bold },
		["@function.call"]        = { fg = syntax._function },
		["@function.method"]      = { fg = syntax.method },
		["@function.method.call"] = { fg = syntax.method },
		["@constructor"]          = { fg = syntax.type, bold = styles.bold },
		["@operator"]             = { link = "Operator" },

		["@keyword"]             = { link = "Keyword" },
		["@keyword.function"]    = { fg = syntax.keyword, style = styles.keywords },
		["@keyword.operator"]    = { fg = syntax.operator },
		["@keyword.import"]      = { fg = syntax.import },
		["@keyword.storage"]     = { fg = syntax.storage },
		["@keyword.repeat"]      = { fg = syntax.control },
		["@keyword.return"]      = { fg = syntax._return, italic = styles.italic },
		["@keyword.debug"]       = { fg = sem.error },
		["@keyword.exception"]   = { fg = sem.error },
		["@keyword.conditional"] = { fg = syntax.control },
		["@keyword.directive"]   = { fg = syntax.macro },

		["@punctuation.delimiter"] = { fg = syntax.punctuation },
		["@punctuation.bracket"]   = { fg = syntax.punctuation },
		["@punctuation.special"]   = { fg = syntax.punctuation, bold = styles.bold },

		["@comment"]               = { link = "Comment" },
		["@comment.documentation"] = { fg = syntax.comment, italic = styles.italic },
		["@comment.error"]         = { fg = sem.error, style = styles.comments },
		["@comment.warning"]       = { fg = sem.warn, style = styles.comments },
		["@comment.todo"]          = { fg = special.todo, style = styles.comments },
		["@comment.note"]          = { fg = special.note, style = styles.comments },

		["@markup.heading"]       = { fg = syntax.type, bold = styles.bold },
		["@markup.strong"]        = { bold = styles.bold },
		["@markup.italic"]        = { italic = styles.italic},
		["@markup.underline"]     = { underline = styles.underline },
		["@markup.strikethrough"] = { strikethrough = true },

		["@markup.link"]               = { fg = special.link, underline = styles.underline },
		["@markup.link.label"]         = { fg = syntax.variable },
		["@markup.link.url"]           = { fg = special.link, underline = styles.underline },
		["@markup.link.url.markdown"]  = { fg = special.link, underline = styles.underline },
		["@markup.link.text.markdown"] = { fg = syntax.string },

		["@markup.raw"]                 = { fg = syntax.string },
		["@markup.raw.block.markdown"]  = { fg = syntax.string, bg = transparent_bg or Util.darken(ui.bg, 0.1) },
		["@markup.raw.block.language"]  = { fg = syntax.keyword, bold = styles.bold },
		["@markup.raw.markdown_inline"] = { bg = Util.darken(p.base, 0.1), fg = p.nuur },

		["@markup.list"]                    = { fg = syntax.keyword },
		["@markup.list.checked"]            = { fg = sem.ok },
		["@markup.list.unchecked"]          = { fg = syntax.variable },
		["@markup.list.checked.markdown"]   = { fg = sem.ok },
		["@markup.list.unchecked.markdown"] = { fg = p.subtle },

		["@markup.quote"]          = { fg = syntax.variable, italic = styles.italic },
		["@markup.quote.markdown"] = { fg = syntax.comment, italic = styles.italic },

		["@markup.math"]                             = { fg = special.special },
		["@markup.environment"]                      = { fg = syntax.macro},
		["@markup.environment.frontmatter.markdown"] = { fg = syntax.type },

		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },

		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		["@tag"]           = { link = "Tag" },
		["@tag.attribute"] = { fg = syntax.property },
		["@tag.delimiter"] = { fg = syntax.punctuation },

		["@diff.plus"]  = { fg = git.git_add },
		["@diff.minus"] = { fg = git.git_delete },
		["@diff.delta"] = { fg = git.git_change },

		["@module"]    = { fg = syntax.import },
		["@namespace"] = { link = "Include" },

		["@definition"] = { underline = styles.underline },
		["@scope"]      = { fg = syntax.punctuation },
		["@reference"]  = { fg = syntax.variable },

		["@error"]      = { fg = sem.error },
		["@diagnostic"] = { undercurl = true, sp = sem.error },

		["@conceal"] = { fg = p.muted },

		-- LSP tokens
		-- These should always link to treesitter highlight groups
		["@lsp.type.class"]         = { link= "@type" },
		["@lsp.type.comment"]       = { link = "@comment" },
		["@lsp.type.decorator"]     = { link = "@attribute" },
		["@lsp.type.enum"]          = { link = "@type" },
		["@lsp.type.enumMember"]    = { link = "@constant" },
		["@lsp.type.function"]      = { link = "@function" },
		["@lsp.type.interface"]     = { link = "@type" },
		["@lsp.type.keyword"]       = { link = "@keyword" },
		["@lsp.type.macro"]         = { link= "@function.macro" },
		["@lsp.type.method"]        = { link = "@function.method" },
		["@lsp.type.namespace"]     = { link = "@namespace" },
		["@lsp.type.number"]        = { link = "@number" },
		["@lsp.type.operator"]      = { link = "@operator" },
		["@lsp.type.parameter"]     = { link = "@variable.parameter" },
		["@lsp.type.property"]      = { link = "@property" },
		["@lsp.type.string"]        = { link = "@string" },
		["@lsp.type.struct"]        = { link = "@type" },
		["@lsp.type.type"]          = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type" },
		["@lsp.type.variable"]      = { link = "@variable" },

		-- Additional LSP semantic tokens
		["@lsp.type.boolean"]             = { link = "@boolean" },
		["@lsp.type.builtinType"]         = { link = "@type.builtin" },
		["@lsp.type.constant"]            = { link = "Constant" },
		["@lsp.type.escapeSequence"]      = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"]     = { link = "@punctuation.special" },
		["@lsp.type.lifetime"]            = { link = "@keyword.storage" },
		["@lsp.type.regexp"]              = { link = "@string.regexp" },
		["@lsp.type.selfParameter"]       = { link = "@variable.builtin" },
		["@lsp.type.typeAlias"]           = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { link = "@error" },
		["@lsp.mod.controlFlow"]          = { italic = styles.italic },
		["@lsp.mod.mutable"]              = { underline = styles.underline },
		["@lsp.mod.callable"]             = { bold = styles.bold },
	}
end

return M
