local Util = require("sarnai.util")

local M = {}

M.url="https://github.com/nvim-mini/mini.nvim"

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local styles = opts.styles or {}
	local transparent_bg = opts.transparent and "NONE" or nil
	local p = colors.palette
	local ui = colors.ui
	local special = colors.special
	local sem = colors.semantic
	local git = colors.git

	return {
		-- mini.surround
		MiniSurround = { fg = ui.bg, bg = ui.accent },

		-- mini.diff
		MiniDiffSignAdd       = { fg = git.git_add },
		MiniDiffOverAdd       = { bg = git.git_add_bg },
		MiniDiffSignChange    = { fg = git.git_change },
		MiniDiffOverChange    = { bg = git.git_change_bg },
		MiniDiffSignDelete    = { fg = git.git_delete },
		MiniDiffOverDelete    = { bg = git.git_delete_bg },
		MiniDiffOverContextBu = { fg = git.git_text },
		MiniDiffOverContext   = { bg = git.git_text_bg },

		-- mini.files
		MiniFilesFile           = { fg = ui.fg },
		MiniFilesDirectory      = { fg = p.nuur, bold = styles.bold },
		MiniFilesTitle          = { fg = p.subtle, bg = ui.bg_float },
		MiniFilesTitleFocused   = { fg = ui.border, bg = ui.bg_float, bold = styles.bold },
		MiniFilesBorder         = { fg = ui.border, bg = ui.bg_float },
		MiniFilesBorderModified = { fg = p.chatsalgan, bg = ui.bg_float },
		MiniFilesNormal         = { fg = ui.fg, bg = ui.bg_float },
		MiniFilesCursorLine     = { fg = ui.fg, bg = transparent_bg or ui.bg_popup },

		-- mini.cursorword
		MiniCursorword = { bg = Util.blend(ui.accent, p.base, 0.1), underline = false },

		-- mini.hipatterns
		MiniHipatternsFixme      = { fg = ui.bg, bg = sem.error, bold = styles.bold },
		MiniHipatternsHack       = { fg = ui.bg, bg = sem.warn, bold = styles.bold },
		MiniHipatternsTodo       = { fg = ui.bg, bg = special.todo, bold = styles.bold },
		MiniHipatternsNote       = { fg = ui.bg, bg = special.note, bold = styles.bold },
		MiniHipatternsDeprecated = { fg = p.muted, strikethrough = true },

		-- mini.indentscope
		MiniIndentscopeSymbol = { fg = p.muted },

		-- mini.statusline
		MiniStatuslineModeNormal  = { fg = ui.bg, bg = p.sarnai, bold = styles.bold },
		MiniStatuslineModeInsert  = { fg = ui.bg, bg = p.mus, bold = styles.bold },
		MiniStatuslineModeVisual  = { fg = ui.bg, bg = p.yargui, bold = styles.bold },
		MiniStatuslineModeReplace = { fg = ui.bg, bg = p.anis, bold = styles.bold },
		MiniStatuslineModeCommand = { fg = ui.bg, bg = p.els, bold = styles.bold },
		MiniStatuslineModeOther   = { fg = ui.bg, bg = p.uvs, bold = styles.bold },
		MiniStatuslineDevinfo     = { fg = ui.fg, bg = ui.bg_float },
		MiniStatuslineFilename    = { fg = p.subtle, bg = ui.bg_popup },
		MiniStatuslineFileinfo    = { fg = ui.fg, bg = ui.bg_float },
		MiniStatuslineInactive    = { fg = p.muted },

		-- mini.tabline
		MiniTablineCurrent         = { fg = ui.bg, bg = transparent_bg or ui.accent, bold = styles.bold },
		MiniTablineVisible         = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
		MiniTablineHidden          = { fg = p.subtle, bg = transparent_bg or ui.bg_float, italic = styles.italic },
		MiniTablineModifiedCurrent = { fg = ui.bg, bg = transparent_bg or p.chatsalgan, bold = styles.bold },
		MiniTablineModifiedVisible = { fg = ui.bg, bg = transparent_bg or p.chatsalgan },
		MiniTablineModifiedHidden  = { fg = ui.bg, bg = transparent_bg or Util.blend(p.chatsalgan, ui.bg_float, 0.7), italic = styles.italic },
		MiniTablineFill            = { bg = transparent_bg or ui.bg },
		MiniTablineTabpagesection  = { bg = transparent_bg or ui.bg },
		MiniTablineTrunc           = { bg = transparent_bg or ui.bg },

		-- mini.trailspace
		MiniTrailspace = { bg = Util.blend(sem.error, p.base, 0.2) },
	}
end

return M
