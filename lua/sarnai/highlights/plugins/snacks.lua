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
    -- Dashboard elements
    SnacksDashboardHeader = { fg = c.palette.sarnai, bold = styles.bold },
    SnacksDashboardCenter = { fg = c.ui.fg },
    SnacksDashboardShortcut = { fg = c.palette.nuur, bold = styles.bold },
    SnacksDashboardFooter = { fg = c.palette.muted, italic = styles.italic },
    SnacksDashboardKey = { fg = c.palette.chatsalgan, bold = styles.bold },
    SnacksDashboardDesc = { fg = c.ui.fg },
    SnacksDashboardIcon = { fg = c.palette.sarnai },
    SnacksDashboardSectionTitle = { fg = c.palette.subtle, bg = c.ui.bg },
    SnacksDashboardNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    SnacksDashboardAction = { fg = c.palette.uvs, underline = styles.underline },
    SnacksDashboardSession = { fg = c.palette.els, italic = styles.italic },
    SnacksDashboardSeparator = { fg = c.palette.muted },
    SnacksDashboardBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },

    -- Notification elements
    SnacksNotifierNormal = { fg = c.ui.fg, bg = transparent_bg or c.palette.surface },
    SnacksNotifierBorder = { fg = c.ui.border, bg = transparent_bg or c.palette.surface },
    SnacksNotifierTitle = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg, bold = styles.bold },
    SnacksNotifierIcon = { fg = c.palette.sarnai },
    SnacksNotifierActionButton = { fg = c.ui.bg, bg = c.palette.nuur, bold = styles.bold },
    SnacksNotifierContent = { fg = c.ui.fg },
    SnacksNotifierContentInfo = { fg = c.semantic.info },
    SnacksNotifierContentWarn = { fg = c.semantic.warn },
    SnacksNotifierContentError = { fg = c.semantic.error },
    SnacksNotifierContentSuccess = { fg = c.semantic.ok },
    SnacksNotifierProgress = { fg = c.palette.sarnai },
    SnacksNotifierProgressDone = { fg = c.palette.uvs },
    SnacksNotifierFooter = { fg = c.palette.muted, italic = styles.italic },
    SnacksNotifierCloseButton = { fg = c.palette.anis },

    -- LazyGit integration (if snacks provides custom UI for it)
    SnacksLazyGitNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    SnacksLazyGitHeader = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg, bold = styles.bold },
    SnacksLazyGitBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },
    SnacksLazyGitTitle = { fg = c.palette.sarnai, bold = styles.bold },
  }
end

return M

