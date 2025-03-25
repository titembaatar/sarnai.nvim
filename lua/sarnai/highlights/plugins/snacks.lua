local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Dashboard elements
    SnacksDashboardHeader = { fg = c.sarnai, style = { bold = true } },
    SnacksDashboardCenter = { fg = c.bright },
    SnacksDashboardShortcut = { fg = c.nuur, style = { bold = true } },
    SnacksDashboardFooter = { fg = c.muted, style = { italic = true } },
    SnacksDashboardKey = { fg = c.chatsalgan, bg = c.depth, style = { bold = true } },
    SnacksDashboardDesc = { fg = c.text },
    SnacksDashboardIcon = { fg = c.sarnai },
    SnacksDashboardSectionTitle = { fg = c.subtle, bg = c.depth },
    SnacksDashboardNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    SnacksDashboardAction = { fg = c.uvs, style = { underline = true } },
    SnacksDashboardSession = { fg = c.els, style = { italic = true } },
    SnacksDashboardSeparator = { fg = c.muted },
    SnacksDashboardBorder = { fg = c.depth, bg = transparent_bg or c.shadow },

    -- Notification elements
    SnacksNotifierNormal = { fg = c.text, bg = transparent_bg or c.surface },
    SnacksNotifierBorder = { fg = c.shadow, bg = transparent_bg or c.surface },
    SnacksNotifierTitle = { fg = c.bright, bg = transparent_bg or c.depth, style = { bold = true } },
    SnacksNotifierIcon = { fg = c.sarnai },
    SnacksNotifierActionButton = { fg = c.base, bg = c.nuur, style = { bold = true } },
    SnacksNotifierContent = { fg = c.text },
    SnacksNotifierContentInfo = { fg = c.nuur },
    SnacksNotifierContentWarn = { fg = c.chatsalgan },
    SnacksNotifierContentError = { fg = c.anis },
    SnacksNotifierContentSuccess = { fg = c.uvs },
    SnacksNotifierProgress = { fg = c.sarnai },
    SnacksNotifierProgressDone = { fg = c.uvs },
    SnacksNotifierFooter = { fg = c.faded, style = { italic = true } },
    SnacksNotifierCloseButton = { fg = c.anis },

    -- LazyGit integration (if snacks provides custom UI for it)
    SnacksLazyGitNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    SnacksLazyGitHeader = { fg = c.bright, bg = transparent_bg or c.depth, style = { bold = true } },
    SnacksLazyGitBorder = { fg = c.depth, bg = transparent_bg or c.shadow },
    SnacksLazyGitTitle = { fg = c.sarnai, style = { bold = true } },
  }
end

return M
