local util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
	local p = colors.palette
	local ui = colors.ui
	local git = colors.git
	local r = colors.rainbow
	local sem = colors.semantic
	local syntax = colors.syntax
	local special = colors.special

	local styles = opts.styles or {}
	local transparent_bg = opts.transparent and "NONE" or nil

	local highlights = {
		-- Core UI elements
		Normal      = { fg = ui.fg, bg = transparent_bg or ui.bg },
		NormalNC    = { fg = p.subtle, bg = transparent_bg or util.darken(ui.bg, 0.1) },
		NormalFloat = { fg = ui.fg, bg = transparent_bg or ui.bg_float },

		-- Line numbers
		LineNr       = { fg = p.muted },
		CursorLineNr = { fg = ui.accent },

		-- Cursor
		Cursor       = { fg = ui.bg, bg = ui.fg },
		CursorIM     = { link = "Cursor" },
		CursorLine   = { bg = transparent_bg or util.lighten(ui.bg, 0.05) },
		CursorColumn = { link = "CursorLine" },

		-- Status line
		StatusLine   = { fg = ui.fg, bg = ui.bg },
		StatusLineNC = { fg = p.muted, bg = ui.bg },

		-- Window separators
		VertSplit    = { fg = util.darken(ui.bg, 0.1) },
		WinSeparator = { link = "VertSplit" },

		-- Search highlighting
		Search    = { fg = ui.fg, bg = util.blend(ui.accent, ui.bg, 0.2) },
		IncSearch = { fg = ui.bg, bg = ui.accent },

		-- Visual mode
		Visual    = { bg = p.overlay },
		VisualNOS = { link = "Visual" },

		-- Folding
		Folded     = { fg = ui.fg, bg = colors.none },
		FoldColumn = { fg = p.muted },

		-- Tab line
		TabLine     = { fg = p.subtle, bg = p.surface },
		TabLineFill = { bg = ui.bg },
		TabLineSel  = { fg = ui.fg, bg = p.overlay },
		SignColumn  = { fg = ui.fg, bg = colors.none },

		-- Popup menu
		Pmenu      = { fg= p.subtle, bg = ui.bg_float },
		PmenuSel   = { fg = ui.fg, bg = ui.bg_popup },
		PmenuSbar  = { bg = ui.bg_float },
		PmenuThumb = { bg = ui.bg_popup },

		-- Messages
		ErrorMsg   = { fg = sem.error },
		WarningMsg = { fg = sem.warn },
		MoreMsg    = { fg = sem.ok },
		Question   = { fg = sem.info },

		-- Diff
		DiffAdd    = { bg = util.blend(git.git_add, ui.bg, 0.2) },
		DiffChange = { bg = util.blend(git.git_change, ui.bg, 0.2) },
		DiffDelete = { bg = util.blend(git.git_delete, ui.bg, 0.2) },
		DiffText   = { bg = util.blend(git.git_text, ui.bg, 0.4) },

		-- Matching parenthesis
		MatchParen = { fg = ui.accent, bg = util.blend(ui.accent, ui.bg, 0.3), bold = styles.bold },

		-- Special characters
		NonText    = { fg = p.muted },
		SpecialKey = { fg = syntax.escape },

		-- Spell checking
		SpellBad   = { sp = sem.error, undercurl = true },
		SpellCap   = { sp = sem.warn, undercurl = true },
		SpellLocal = { sp = sem.ok, undercurl = true },
		SpellRare  = { sp = sem.info, undercurl = true },

		-- Window bar
		WinBar   = { fg = p.subtle, bg = p.surface },
		WinBarNC = { fg = p.muted, bg = ui.bg },

		-- Syntax highlighting
		Comment = { fg = syntax.comment, style = styles.comments },

		Constant  = { fg = syntax.constant },
		String    = { fg = syntax.string },
		Character = { fg = special.character },
		Number    = { fg = syntax.constant },
		Boolean   = { fg = syntax.boolean },
		Float     = { fg = syntax.constant },

		Identifier = { fg = syntax.variable, style = styles.variables },
		Function   = { fg = syntax._function, style = styles.functions },

		Statement   = { fg = syntax.keyword, style = styles.keywords },
		Conditional = { fg = syntax.control, style = styles.keywords },
		Repeat      = { fg = syntax.control, style = styles.keywords },
		Label       = { fg = syntax.keyword, style = styles.keywords },
		Operator    = { fg = syntax.operator },
		Keyword     = { fg = syntax.keyword, style = styles.keywords },
		Exception   = { fg = syntax.control, style = styles.keywords },

		PreProc   = { fg = syntax.macro },
		Include   = { fg = syntax.import },
		Define    = { fg = syntax.macro },
		Macro     = { fg = syntax.macro, bold = styles.bold },
		PreCondit = { fg = syntax.macro, italic = styles.italic },

		Type         = { fg = syntax.type },
		StorageClass = { fg = syntax.storage, bold = styles.bold },
		Structure    = { fg = syntax.type, bold = styles.bold },
		Typedef      = { fg = syntax.type, italic = styles.italic },

		Special        = { fg = special.special },
		SpecialChar    = { fg = special.character },
		Tag            = { fg = special.special },
		Delimiter      = { fg = syntax.punctuation },
		SpecialComment = { fg = syntax.comment, italic = true, bold = styles.bold },
		Debug          = { fg = sem.error, bold = styles.bold },

		Underlined = { underline = styles.underline },

		Bold   = { bold = styles.bold },
		Italic = { italic = styles.italic },

		FloatBorder = { fg = ui.border },
		Title       = { fg = ui.border, bold = styles.bold },

		healthError   = { fg = sem.error },
		healthSuccess = { fg = sem.ok },
		healthWarning = { fg = sem.warn },

		htmlArg     = { fg = syntax.property },
		htmlBold    = { bold = styles.bold },
		htmlEndTag  = { fg = syntax.punctuation },
		htmlH1      = { link = "markdownH1" },
		htmlH2      = { link = "markdownH2" },
		htmlH3      = { link = "markdownH3" },
		htmlH4      = { link = "markdownH4" },
		htmlH5      = { link = "markdownH5" },
		htmlItalic  = { italic = styles.italic },
		htmlLink    = { link = "markdownUrl" },
		htmlTag     = { fg = syntax.punctuation },
		htmlTagN    = { fg = syntax.variable },
		htmlTagName = { fg = syntax.type },

		markdownDelimiter   = { fg = syntax.punctuation },
		markdownH1          = { fg = r.h1, bold = styles.bold },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2          = { fg = r.h2, bold = styles.bold },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3          = { fg = r.h3, bold = styles.bold },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4          = { fg = r.h4, bold = styles.bold },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5          = { fg = r.h5, bold = styles.bold },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6          = { fg = r.h6, bold = styles.bold },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText    = { link = "markdownUrl" },
		markdownUrl         = { fg = special.link, sp = special.link, underline = true },

		mkdCode          = { fg = syntax.string, italic = styles.italic },
		mkdCodeDelimiter = { fg = syntax.punctuation },
		mkdCodeEnd       = { fg = syntax.string },
		mkdCodeStart     = { fg = syntax.string },
		mkdFootnotes     = { fg = syntax.variable },
		mkdID            = { fg = syntax.constant, underline = true },
		mkdInlineURL     = { link = "markdownUrl" },
		mkdLink          = { link = "markdownUrl" },
		mkdLinkDef       = { link = "markdownUrl" },
		mkdListItemLine  = { fg = syntax.variable },
		mkdRule          = { fg = syntax.punctuation },
		mkdURL           = { link = "markdownUrl" },
	}

	return highlights
end

return M

