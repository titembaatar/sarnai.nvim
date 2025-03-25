local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil


  return {
    -- mini.ai (text objects)
    MiniAiIndicator = { fg = c.text, bg = c.overlay },

    -- mini.bracketed (bracket navigation)
    MiniBracketed = { fg = groups.hint },

    -- mini.bufremove (buffer deletion)
    MiniBufremoveVirtText = { fg = groups.error, italic = styles.italic },

    -- mini.comment (commenting)
    MiniCommenter = { link = "Comment" },
    MiniCommenterPrefix = { fg = c.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { fg = c.text, bg = c.surface, underline = false },
    MiniCursorwordCurrent = { fg = c.text, bg = c.surface, underline = false },

    -- mini.diff (git diffs)
    MiniDiffSign = { fg = c.muted },
    MiniDiffSignAdd = { fg = groups.git_add },
    MiniDiffSignChange = { fg = groups.git_change },
    MiniDiffSignDelete = { fg = groups.git_delete },

    -- mini.files (file browser)
    MiniFilesNormal = { fg = c.text, bg = c.base },
    MiniFilesTitle = { fg = groups.border, bg = c.base, bold = styles.bold },
    MiniFilesTitleFocused = { fg = c.text, bg = c.overlay, bold = styles.bold },
    MiniFilesFile = { fg = c.text },
    MiniFilesDirectory = { fg = c.mus, bold = styles.bold },
    MiniFilesSymlink = { fg = groups.link, italic = styles.italic },

    -- mini.git (git status)
    MiniGitSignAdd = { link = "MiniDiffSignAdd" },
    MiniGitSignChange = { link = "MiniDiffSignChange" },
    MiniGitSignDelete = { link = "MiniDiffSignDelete" },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = c.base, bg = groups.error, bold = styles.bold },
    MiniHipatternsHack = { fg = c.base, bg = groups.warn, bold = styles.bold },
    MiniHipatternsNote = { fg = c.base, bg = groups.note, bold = styles.bold },
    MiniHipatternsTodo = { fg = c.base, bg = groups.todo, bold = styles.bold },
    MiniHipatternsDeprecated = { strikethrough = true, fg = c.muted },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = c.muted },
    MiniIndentscopePrefix = { fg = c.none },

    -- mini.jump (movement)
    MiniJump = { fg = groups.hint, bold = styles.bold, underline = styles.underline },
    MiniJump2d = { fg = c.base, bg = groups.hint, bold = styles.bold },

    -- mini.jump2d (2D movement)
    MiniJump2dSpot = { fg = c.base, bg = groups.hint, bold = styles.bold },
    MiniJump2dDim = { fg = util.darken(c.text, 0.5) },
    MiniJump2dDimStart = { fg = util.darken(c.text, 0.6) },

    -- mini.statusline (status line)
    MiniStatuslineFileName = { fg = c.text, bold = styles.bold },
    MiniStatuslineFileNameModified = { fg = groups.git_dirty or groups.hint, bold = styles.bold },
    MiniStatuslineDevInfo = { fg = c.subtle },
    MiniStatuslineFilename = { fg = c.subtle },
    MiniStatuslineInactive = { fg = c.subtle, bg = c.base },
    MiniStatuslineModeNormal = { fg = c.base, bg = c.sarnai, bold = styles.bold },
    MiniStatuslineModeInsert = { fg = c.base, bg = c.mus, bold = styles.bold },
    MiniStatuslineModeVisual = { fg = c.base, bg = c.yargui, bold = styles.bold },
    MiniStatuslineModeReplace = { fg = c.base, bg = c.anis, bold = styles.bold },
    MiniStatuslineModeCommand = { fg = c.base, bg = c.els, bold = styles.bold },
    MiniStatuslineModeOther = { fg = c.base, bg = c.uvs, bold = styles.bold },

    -- mini.surround (surround operations)
    MiniSurround = { fg = c.base, bg = groups.hint },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = c.text, bg = transparent_bg or c.surface, bold = styles.bold },
    MiniTablineVisible = { fg = c.text, bg = transparent_bg or c.base },
    MiniTablineHidden = { fg = c.muted, bg = transparent_bg or c.base },
    MiniTablineModifiedCurrent = { fg = groups.git_dirty or groups.hint, bg = transparent_bg or c.surface, bold = styles.bold },
    MiniTablineModifiedVisible = { fg = groups.git_dirty or groups.hint, bg = transparent_bg or c.base },
    MiniTablineModifiedHidden = { fg = groups.git_dirty or groups.hint, bg = transparent_bg or c.base, italic = styles.italic },
    MiniTablineFill = { bg = transparent_bg or c.base },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = groups.error },
  }
end

return M

