local util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local git = colors.git
  local sem = colors.semantic
  local special = colors.special
  local ui = colors.ui

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- mini.statusline (status line)
    MiniStatuslineModeNormal = { fg = ui.bg, bg = p.sarnai, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = ui.bg, bg = p.mus, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = ui.bg, bg = p.yargui, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = ui.bg, bg = p.anis, bold = styles.bold },
    MiniStatuslineModeCommand = { fg = ui.bg, bg = p.els, bold = styles.bold },
    MiniStatuslineModeOther = { fg = ui.bg, bg = p.uvs, bold = styles.bold },
    MiniStatuslineDevinfo = { fg = ui.fg, bg = ui.bg_float },
    MiniStatuslineFilename = { fg = p.subtle, bg = ui.bg_popup },
    MiniStatuslineFileinfo = { fg = ui.fg, bg = ui.bg_float },
    MiniStatuslineInactive = { fg = p.muted },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = ui.bg, bg = transparent_bg or ui.accent, bold = styles.bold },
    MiniTablineVisible = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
    MiniTablineHidden = { fg = p.subtle, bg = transparent_bg or ui.bg_float, italic = styles.italic },
    MiniTablineModifiedCurrent = { fg = ui.bg, bg = transparent_bg or p.chatsalgan, bold = styles.bold },
    MiniTablineModifiedVisible = { fg = ui.bg, bg = transparent_bg or p.chatsalgan },
    MiniTablineModifiedHidden = {
      fg = ui.bg,
      bg = transparent_bg or util.blend(p.chatsalgan, ui.bg_float, 0.7),
      italic = styles.italic
    },
    MiniTablineFill = { bg = transparent_bg or ui.bg },
    MiniTablineTabpagesection = { bg = transparent_bg or ui.bg },
    MiniTablineTrunc = { bg = transparent_bg or ui.bg },

    -- mini.files (file browser)
    MiniFilesBorder = { fg = ui.border, bg = ui.bg_float },
    MiniFilesBorderModified = { fg = p.chatsalgan, bg = ui.bg_float },
    MiniFilesCursorLine = { fg = ui.fg, bg = transparent_bg or ui.bg_popup },
    MiniFilesDirectory = { fg = p.nuur, bold = styles.bold },
    MiniFilesFile = { fg = ui.fg },
    MiniFilesNormal = { fg = ui.fg, bg = ui.bg_float },
    MiniFilesTitle = { fg = p.muted, bg = ui.bg_float },
    MiniFilesTitleFocused = { fg = ui.border, bg = ui.bg_float, bold = styles.bold },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = ui.bg, bg = sem.error, bold = styles.bold },
    MiniHipatternsHack = { fg = ui.bg, bg = sem.warn, bold = styles.bold },
    MiniHipatternsTodo = { fg = ui.bg, bg = special.todo, bold = styles.bold },
    MiniHipatternsNote = { fg = ui.bg, bg = special.note, bold = styles.bold },
    MiniHipatternsDeprecated = { fg = p.muted, strikethrough = true },

    -- mini.diff (git diffs)
    MiniDiffSignAdd = { fg = git.git_add },
    MiniDiffSignChange = { fg = git.git_change },
    MiniDiffSignDelete = { fg = git.git_delete },
    MiniDiffOverAdd = { bg = git.git_add_bg },
    MiniDiffOverChange = { fg = git.git_change_bg },
    MiniDiffOverContext = { fg = git.git_text_bg },
    MiniDiffOverDelete = { fg = git.git_delete_bg },

    -- mini.surround (surround operations)
    MiniSurround = { fg = ui.bg, bg = ui.accent },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = p.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { bg = util.blend(ui.accent, p.base, 0.05), underline = false },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = util.blend(sem.error, p.base, 0.2) },
  }
end

return M
