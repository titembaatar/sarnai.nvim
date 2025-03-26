local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- mini.statusline (status line)
    MiniStatuslineModeNormal = { fg = p.ui.bg, bg = p.palette.sarnai, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = p.ui.bg, bg = p.palette.mus, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = p.ui.bg, bg = p.palette.yargui, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = p.ui.bg, bg = p.palette.anis, bold = styles.bold },
    MiniStatuslineModeCommand = { fg = p.ui.bg, bg = p.palette.els, bold = styles.bold },
    MiniStatuslineModeOther = { fg = p.ui.bg, bg = p.palette.uvs, bold = styles.bold },
    MiniStatuslineDevinfo = { fg = p.ui.fg, bg = p.ui.bg_float },
    MiniStatuslineFilename = { fg = p.palette.subtle, bg = p.ui.bg_popup },
    MiniStatuslineFileinfo = { fg = p.ui.fg, bg = p.ui.bg_float },
    MiniStatuslineInactive = { fg = p.palette.muted },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg, bold = styles.bold },
    MiniTablineVisible = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg },
    MiniTablineHidden = { fg = p.palette.muted, bg = transparent_bg or p.ui.bg, italic = styles.italic },
    MiniTablineModifiedCurrent = { fg = p.ui.bg, bg = transparent_bg or p.palette.chatsalgan, bold = styles.bold },
    MiniTablineModifiedVisible = { fg = p.ui.bg, bg = transparent_bg or p.palette.chatsalgan },
    MiniTablineModifiedHidden = {
      fg = p.ui.bg,
      bg = transparent_bg or util.blend(p.palette.chatsalgan, p.ui.bg, 0.9),
      italic = styles.italic
    },
    MiniTablineFill = { bg = transparent_bg or p.ui.bg_float },
    MiniTablineTabpagesection = { bg = transparent_bg or p.ui.bg },
    MiniTablineTrunc = { bg = transparent_bg or p.ui.bg },

    -- mini.files (file browser)
    MiniFilesBorder = { fg = p.ui.border },
    MiniFilesBorderModified = { fg = p.palette.chatsalgan },
    MiniFilesCursorLine = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_popup },
    MiniFilesDirectory = { fg = p.palette.mus, bold = styles.bold },
    MiniFilesFile = { fg = p.ui.fg },
    MiniFilesNormal = { fg = p.ui.fg, bg = p.ui.bg_float },
    MiniFilesTitle = { fg = p.palette.muted, },
    MiniFilesTitleFocused = { fg = p.ui.border, bold = styles.bold },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = p.ui.bg, bg = p.semantic.error, bold = styles.bold },
    MiniHipatternsHack = { fg = p.ui.bg, bg = p.semantic.warn, bold = styles.bold },
    MiniHipatternsTodo = { fg = p.ui.bg, bg = p.special.todo, bold = styles.bold },
    MiniHipatternsNote = { fg = p.ui.bg, bg = p.special.note, bold = styles.bold },
    MiniHipatternsDeprecated = { fg = p.palette.muted, strikethrough = true },

    -- mini.diff (git diffs)
    MiniDiffSignAdd = { fg = p.git.git_add },
    MiniDiffSignChange = { fg = p.git.git_change },
    MiniDiffSignDelete = { fg = p.git.git_delete },
    MiniDiffOverAdd = { bg = p.git.git_add_bg },
    MiniDiffOverChange = { fg = p.git.git_change_bg },
    MiniDiffOverContext = { fg = p.git.git_text_bg },
    MiniDiffOverDelete = { fg = p.git.git_delete_bg },

    -- mini.surround (surround operations)
    MiniSurround = { fg = p.ui.bg, bg = p.ui.accent },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = p.palette.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { fg = p.ui.fg, bg = util.blend(p.ui.accent, p.palette.base, 0.2), underline = false },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = util.blend(p.semantic.error, p.palette.base, 0.2) },
  }
end

return M
