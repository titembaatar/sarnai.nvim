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
    -- mini.ai (text objects)
    MiniAiIndicator = { fg = c.ui.fg, bg = c.palette.overlay },

    -- mini.bracketed (bracket navigation)
    MiniBracketed = { fg = c.semantic.hint },

    -- mini.bufremove (buffer deletion)
    MiniBufremoveVirtText = { fg = c.semantic.error, italic = styles.italic },

    -- mini.comment (commenting)
    MiniCommenter = { link = "Comment" },
    MiniCommenterPrefix = { fg = c.palette.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { fg = c.ui.fg, bg = c.palette.surface, underline = false },
    MiniCursorwordCurrent = { fg = c.ui.fg, bg = c.palette.surface, underline = false },

    -- mini.diff (git diffs)
    MiniDiffSign = { fg = c.palette.muted },
    MiniDiffSignAdd = { fg = c.git.git_add },
    MiniDiffSignChange = { fg = c.git.git_change },
    MiniDiffSignDelete = { fg = c.git.git_delete },

    -- mini.files (file browser)
    MiniFilesNormal = { fg = c.ui.fg, bg = c.ui.bg },
    MiniFilesTitle = { fg = c.ui.border, bg = c.ui.bg, bold = styles.bold },
    MiniFilesTitleFocused = { fg = c.ui.fg, bg = c.palette.overlay, bold = styles.bold },
    MiniFilesFile = { fg = c.ui.fg },
    MiniFilesDirectory = { fg = c.palette.mus, bold = styles.bold },
    MiniFilesSymlink = { fg = c.special.link, italic = styles.italic },

    -- mini.git (git status)
    MiniGitSignAdd = { link = "MiniDiffSignAdd" },
    MiniGitSignChange = { link = "MiniDiffSignChange" },
    MiniGitSignDelete = { link = "MiniDiffSignDelete" },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = c.ui.bg, bg = c.semantic.error, bold = styles.bold },
    MiniHipatternsHack = { fg = c.ui.bg, bg = c.semantic.warn, bold = styles.bold },
    MiniHipatternsNote = { fg = c.ui.bg, bg = c.special.note, bold = styles.bold },
    MiniHipatternsTodo = { fg = c.ui.bg, bg = c.special.todo, bold = styles.bold },
    MiniHipatternsDeprecated = { strikethrough = true, fg = c.palette.muted },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = c.palette.muted },
    MiniIndentscopePrefix = { fg = c.none },

    -- mini.jump (movement)
    MiniJump = { fg = c.semantic.hint, bold = styles.bold, underline = styles.underline },
    MiniJump2d = { fg = c.ui.bg, bg = c.semantic.hint, bold = styles.bold },

    -- mini.jump2d (2D movement)
    MiniJump2dSpot = { fg = c.ui.bg, bg = c.semantic.hint, bold = styles.bold },
    MiniJump2dDim = { fg = util.darken(c.ui.fg, 0.5) },
    MiniJump2dDimStart = { fg = util.darken(c.ui.fg, 0.6) },

    -- mini.statusline (status line)
    MiniStatuslineFileName = { fg = c.ui.fg, bold = styles.bold },
    MiniStatuslineFileNameModified = { fg = c.git.git_dirty, bold = styles.bold },
    MiniStatuslineDevInfo = { fg = c.palette.subtle },
    MiniStatuslineFilename = { fg = c.palette.subtle },
    MiniStatuslineInactive = { fg = c.palette.subtle, bg = c.ui.bg },
    MiniStatuslineModeNormal = { fg = c.ui.bg, bg = c.palette.sarnai, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = c.ui.bg, bg = c.palette.mus, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = c.ui.bg, bg = c.palette.yargui, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = c.ui.bg, bg = c.palette.anis, bold = styles.bold },
    MiniStatuslineModeCommand = { fg = c.ui.bg, bg = c.palette.els, bold = styles.bold },
    MiniStatuslineModeOther = { fg = c.ui.bg, bg = c.palette.uvs, bold = styles.bold },

    -- mini.surround (surround operations)
    MiniSurround = { fg = c.ui.bg, bg = c.semantic.hint },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = c.ui.fg, bg = transparent_bg or c.palette.surface, bold = styles.bold },
    MiniTablineVisible = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    MiniTablineHidden = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg },
    MiniTablineModifiedCurrent = { fg = c.git.git_dirty, bg = transparent_bg or c.palette.surface, bold = styles.bold },
    MiniTablineModifiedVisible = { fg = c.git.git_dirty, bg = transparent_bg or c.ui.bg },
    MiniTablineModifiedHidden = { fg = c.git.git_dirty, bg = transparent_bg or c.ui.bg, italic = styles.italic },
    MiniTablineFill = { bg = transparent_bg or c.ui.bg },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = c.semantic.error },
  }
end

return M

