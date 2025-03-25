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
    -- Dashboard elements
    SnacksDashboardHeader = { fg = groups.hint, bold = styles.bold },
    SnacksDashboardCenter = { fg = c.text },
    SnacksDashboardShortcut = { fg = groups.info, bold = styles.bold },
    SnacksDashboardFooter = { fg = c.muted, italic = styles.italic },
    SnacksDashboardKey = { fg = groups.warn, bold = styles.bold },
    SnacksDashboardDesc = { fg = c.text },
    SnacksDashboardIcon = { fg = groups.hint },
    SnacksDashboardSectionTitle = { fg = c.subtle, bg = c.base },
    SnacksDashboardNormal = { fg = c.text, bg = transparent_bg or c.base },
    SnacksDashboardAction = { fg = groups.ok, underline = styles.underline },
    SnacksDashboardSession = { fg = c.els, italic = styles.italic },
    SnacksDashboardSeparator = { fg = c.muted },
    SnacksDashboardBorder = { fg = groups.border, bg = transparent_bg or c.base },

    -- Notification elements
    SnacksNotifierNormal = { fg = c.text, bg = transparent_bg or c.surface },
    SnacksNotifierBorder = { fg = groups.border, bg = transparent_bg or c.surface },
    SnacksNotifierTitle = { fg = c.text, bg = transparent_bg or c.base, bold = styles.bold },
    SnacksNotifierIcon = { fg = groups.hint },
    SnacksNotifierActionButton = { fg = c.base, bg = groups.info, bold = styles.bold },
    SnacksNotifierContent = { fg = c.text },
    SnacksNotifierContentInfo = { fg = groups.info },
    SnacksNotifierContentWarn = { fg = groups.warn },
    SnacksNotifierContentError = { fg = groups.error },
    SnacksNotifierContentSuccess = { fg = groups.ok },
    SnacksNotifierProgress = { fg = groups.hint },
    SnacksNotifierProgressDone = { fg = groups.ok },
    SnacksNotifierFooter = { fg = c.muted, italic = styles.italic },
    SnacksNotifierCloseButton = { fg = groups.error },

    -- LazyGit integration (if snacks provides custom UI for it)
    SnacksLazyGitNormal = { fg = c.text, bg = transparent_bg or c.base },
    SnacksLazyGitHeader = { fg = c.text, bg = transparent_bg or c.base, bold = styles.bold },
    SnacksLazyGitBorder = { fg = groups.border, bg = transparent_bg or c.base },
    SnacksLazyGitTitle = { fg = groups.hint, bold = styles.bold },
  }
end

return M

