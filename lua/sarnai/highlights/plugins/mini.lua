local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- mini.ai (text objects)
    MiniAiIndicator = { fg = c.text, bg = c.overlay },

    -- mini.bracketed (bracket navigation)
    MiniBracketed = { fg = c.sarnai },

    -- mini.bufremove (buffer deletion)
    MiniBufremoveVirtText = { fg = c.anis, style = { italic = true } },

    -- mini.comment (commenting)
    MiniCommenter = { link = "Comment" },
    MiniCommenterPrefix = { fg = c.muted },

    -- mini.cursorword (highlight same words)
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    -- mini.diff (git diffs)
    MiniDiffSign = { fg = c.muted },
    MiniDiffSignAdd = { fg = c.uvs },
    MiniDiffSignChange = { fg = c.els },
    MiniDiffSignDelete = { fg = c.anis },

    -- mini.files (file browser)
    MiniFilesNormal = { fg = c.text, bg = c.shadow },
    MiniFilesTitle = { fg = c.sarnai, bg = c.depth, style = { bold = true } },
    MiniFilesTitleFocused = { fg = c.bright, bg = c.overlay, style = { bold = true } },
    MiniFilesFile = { fg = c.text },
    MiniFilesDirectory = { fg = c.mus, style = { bold = true } },
    MiniFilesSymlink = { fg = c.nuur, style = { italic = true } },

    -- mini.git (git status)
    MiniGitSignAdd = { link = "MiniDiffSignAdd" },
    MiniGitSignChange = { link = "MiniDiffSignChange" },
    MiniGitSignDelete = { link = "MiniDiffSignDelete" },

    -- mini.hipatterns (pattern highlighting)
    MiniHipatternsFixme = { fg = c.base, bg = c.anis, style = { bold = true } },
    MiniHipatternsHack = { fg = c.base, bg = c.chatsalgan, style = { bold = true } },
    MiniHipatternsNote = { fg = c.base, bg = c.nuur, style = { bold = true } },
    MiniHipatternsTodo = { fg = c.base, bg = c.sarnai, style = { bold = true } },
    MiniHipatternsDeprecated = { strikethrough = true, fg = c.muted },

    -- mini.indentscope (indentation guides)
    MiniIndentscopeSymbol = { fg = c.shadow },
    MiniIndentscopePrefix = { fg = c.none }, -- No highlighting for prefix

    -- mini.jump (movement)
    MiniJump = { fg = c.sarnai, style = { bold = true, underline = true } },
    MiniJump2d = { fg = c.base, bg = c.sarnai, style = { bold = true } },

    -- mini.jump2d (2D movement)
    MiniJump2dSpot = { fg = c.base, bg = c.sarnai, style = { bold = true } },
    MiniJump2dDim = { fg = util.darken(c.text, 0.5) },
    MiniJump2dDimStart = { fg = util.darken(c.text, 0.6) },

    -- mini.pairs (auto-pairs)
    -- No specific highlights needed

    -- mini.statusline (status line)
    MiniStatuslineFileName = { fg = c.bright, style = { bold = true } },
    MiniStatuslineFileNameModified = { fg = c.sarnai, style = { bold = true } },
    MiniStatuslineDevInfo = { fg = c.faded },
    MiniStatuslineFilename = { fg = c.subtle },
    MiniStatuslineInactive = { fg = c.faded, bg = c.depth },
    MiniStatuslineModeNormal = { fg = c.base, bg = c.mus, style = { bold = true } },
    MiniStatuslineModeInsert = { fg = c.base, bg = c.uvs, style = { bold = true } },
    MiniStatuslineModeVisual = { fg = c.base, bg = c.sarnai, style = { bold = true } },
    MiniStatuslineModeReplace = { fg = c.base, bg = c.anis, style = { bold = true } },
    MiniStatuslineModeCommand = { fg = c.base, bg = c.els, style = { bold = true } },
    MiniStatuslineModeOther = { fg = c.base, bg = c.nuur, style = { bold = true } },

    -- mini.surround (surround operations)
    MiniSurround = { fg = c.base, bg = c.sarnai },

    -- mini.tabline (tabs)
    MiniTablineCurrent = { fg = c.bright, bg = transparent_bg or c.surface, style = { bold = true } },
    MiniTablineVisible = { fg = c.text, bg = transparent_bg or c.shadow },
    MiniTablineHidden = { fg = c.faded, bg = transparent_bg or c.depth },
    MiniTablineModifiedCurrent = { fg = c.sarnai, bg = transparent_bg or c.surface, style = { bold = true } },
    MiniTablineModifiedVisible = { fg = c.sarnai, bg = transparent_bg or c.shadow },
    MiniTablineModifiedHidden = { fg = c.sarnai, bg = transparent_bg or c.depth, style = { italic = true } },
    MiniTablineFill = { bg = transparent_bg or c.depth },

    -- mini.trailspace (trailing whitespace)
    MiniTrailspace = { bg = c.anis },
  }
end

return M

