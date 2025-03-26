local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- mini.statusline (status line)
    MiniStatuslineModeNormal = { fg = c.ui.bg, bg = c.palette.sarnai, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = c.ui.bg, bg = c.palette.mus, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = c.ui.bg, bg = c.palette.yargui, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = c.ui.bg, bg = c.palette.anis, bold = styles.bold },
    MiniStatuslineModeCommand = { fg = c.ui.bg, bg = c.palette.els, bold = styles.bold },
    MiniStatuslineModeOther = { fg = c.ui.bg, bg = c.palette.uvs, bold = styles.bold },
    MiniStatuslineDevinfo = { fg = c.ui.fg, bg = c.ui.bg_float },
    MiniStatuslineFilename = { fg = c.palette.subtle, bg = c.ui.bg_popup },
    MiniStatuslineFileinfo = { fg = c.ui.fg, bg = c.ui.bg_float },
    MiniStatuslineInactive = { fg = c.palette.muted },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg, bold = styles.bold },
    MiniTablineVisible = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    MiniTablineHidden = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg, italic = styles.italic },
    MiniTablineModifiedCurrent = { fg = c.ui.bg, bg = transparent_bg or c.palette.chatsalgan, bold = styles.bold },
    MiniTablineModifiedVisible = { fg = c.ui.bg, bg = transparent_bg or c.palette.chatsalgan },
    MiniTablineModifiedHidden = {
      fg = c.ui.bg,
      bg = transparent_bg or util.blend(c.palette.chatsalgan, c.ui.bg, 0.9),
      italic = styles.italic
    },
    MiniTablineFill = { bg = transparent_bg or c.ui.bg_float },
    MiniTablineTabpagesection = { bg = transparent_bg or c.ui.bg },
    MiniTablineTrunc = { bg = transparent_bg or c.ui.bg },

    -- mini.files (file browser)
    MiniFilesBorder = { fg = c.ui.border },
    MiniFilesBorderModified = { fg = c.palette.chatsalgan },
    MiniFilesCursorLine = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_popup },
    MiniFilesDirectory = { fg = c.palette.mus, bold = styles.bold },
    MiniFilesFile = { fg = c.ui.fg },
    MiniFilesNormal = { fg = c.ui.fg, bg = c.ui.bg_float },
    MiniFilesTitle = { fg = c.palette.muted, },
    MiniFilesTitleFocused = { fg = c.ui.border, bold = styles.bold },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = c.ui.bg, bg = c.semantic.error, bold = styles.bold },
    MiniHipatternsHack = { fg = c.ui.bg, bg = c.semantic.warn, bold = styles.bold },
    MiniHipatternsTodo = { fg = c.ui.bg, bg = c.special.todo, bold = styles.bold },
    MiniHipatternsNote = { fg = c.ui.bg, bg = c.special.note, bold = styles.bold },
    MiniHipatternsDeprecated = { fg = c.palette.muted, strikethrough = true },

    -- mini.diff (git diffs)
    MiniDiffSignAdd = { fg = c.git.git_add },
    MiniDiffSignChange = { fg = c.git.git_change },
    MiniDiffSignDelete = { fg = c.git.git_delete },
    MiniDiffOverAdd = { bg = c.git.git_add_bg },
    MiniDiffOverChange = { fg = c.git.git_change_bg },
    MiniDiffOverContext = { fg = c.git.git_text_bg },
    MiniDiffOverDelete = { fg = c.git.git_delete_bg },

    -- mini.surround (surround operations)
    MiniSurround = { fg = c.ui.bg, bg = c.ui.accent },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = c.palette.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { fg = c.ui.fg, bg = util.blend(c.ui.accent, c.palette.base, 0.2), underline = false },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = util.blend(c.semantic.error, c.palette.base, 0.2) },
  }
end

return M
