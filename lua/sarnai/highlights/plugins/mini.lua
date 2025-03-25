local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil
  local styles = config.styles

  return {
    -- mini.ai (text objects)
    MiniAiIndicator = { fg = c.text, bg = c.overlay },

    -- mini.bracketed (bracket navigation)
    MiniBracketed = { fg = c.sarnai },

    -- mini.bufremove (buffer deletion)
    MiniBufremoveVirtText = { fg = c.anis, style = { italic = styles.italic } },

    -- mini.comment (commenting)
    MiniCommenter = { link = "Comment" },
    MiniCommenterPrefix = { fg = c.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { underline = styles.underline },
    MiniCursorwordCurrent = { underline = styles.underline },

    -- mini.diff (git diffs)
    MiniDiffSign = { fg = c.muted },
    MiniDiffSignAdd = { fg = c.uvs },
    MiniDiffSignChange = { fg = c.els },
    MiniDiffSignDelete = { fg = c.anis },

    -- mini.files (file browser)
    MiniFilesNormal = { fg = c.text, bg = c.base },
    MiniFilesTitle = { fg = c.sarnai, bg = c.base, style = { bold = styles.bold } },
    MiniFilesTitleFocused = { fg = c.text, bg = c.overlay, style = { bold = styles.bold } },
    MiniFilesFile = { fg = c.text },
    MiniFilesDirectory = { fg = c.mus, style = { bold = styles.bold } },
    MiniFilesSymlink = { fg = c.nuur, style = { italic = styles.italic } },

    -- mini.git (git status)
    MiniGitSignAdd = { link = "MiniDiffSignAdd" },
    MiniGitSignChange = { link = "MiniDiffSignChange" },
    MiniGitSignDelete = { link = "MiniDiffSignDelete" },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = c.base, bg = c.anis, style = { bold = styles.bold } },
    MiniHipatternsHack = { fg = c.base, bg = c.chatsalgan, style = { bold = styles.bold } },
    MiniHipatternsNote = { fg = c.base, bg = c.nuur, style = { bold = styles.bold } },
    MiniHipatternsTodo = { fg = c.base, bg = c.sarnai, style = { bold = styles.bold } },
    MiniHipatternsDeprecated = { strikethrough = true, fg = c.muted },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = c.base },
    MiniIndentscopePrefix = { fg = c.none }, -- No highlighting for prefix

    -- mini.jump (movement)
    MiniJump = { fg = c.sarnai, style = { bold = styles.bold, underline = styles.underline } },
    MiniJump2d = { fg = c.base, bg = c.sarnai, style = { bold = styles.bold } },

    -- mini.jump2d (2D movement)
    MiniJump2dSpot = { fg = c.base, bg = c.sarnai, style = { bold = styles.bold } },
    MiniJump2dDim = { fg = util.darken(c.text, 0.5) },
    MiniJump2dDimStart = { fg = util.darken(c.text, 0.6) },

    -- mini.statusline (status line)
    MiniStatuslineFileName = { fg = c.text, style = { bold = styles.bold } },
    MiniStatuslineFileNameModified = { fg = c.sarnai, style = { bold = styles.bold } },
    MiniStatuslineDevInfo = { fg = c.subtle },
    MiniStatuslineFilename = { fg = c.subtle },
    MiniStatuslineInactive = { fg = c.subtle, bg = c.base },
    MiniStatuslineModeNormal = { fg = c.base, bg = c.mus, style = { bold = styles.bold } },
    MiniStatuslineModeInsert = { fg = c.base, bg = c.uvs, style = { bold = styles.bold } },
    MiniStatuslineModeVisual = { fg = c.base, bg = c.sarnai, style = { bold = styles.bold } },
    MiniStatuslineModeReplace = { fg = c.base, bg = c.anis, style = { bold = styles.bold } },
    MiniStatuslineModeCommand = { fg = c.base, bg = c.els, style = { bold = styles.bold } },
    MiniStatuslineModeOther = { fg = c.base, bg = c.nuur, style = { bold = styles.bold } },

    -- mini.surround (surround operations)
    MiniSurround = { fg = c.base, bg = c.sarnai },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = c.text, bg = transparent_bg or c.surface, style = { bold = styles.bold } },
    MiniTablineVisible = { fg = c.text, bg = transparent_bg or c.base },
    MiniTablineHidden = { fg = c.faded, bg = transparent_bg or c.base },
    MiniTablineModifiedCurrent = { fg = c.sarnai, bg = transparent_bg or c.surface, style = { bold = styles.bold } },
    MiniTablineModifiedVisible = { fg = c.sarnai, bg = transparent_bg or c.base },
    MiniTablineModifiedHidden = { fg = c.sarnai, bg = transparent_bg or c.base, style = { italic = styles.italic } },
    MiniTablineFill = { bg = transparent_bg or c.base },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = c.anis },
  }
end

return M
