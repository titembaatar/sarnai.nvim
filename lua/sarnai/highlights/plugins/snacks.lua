local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  return {
    -- Dashboard
    SnacksDashboardDesc       = { fg = p.ui.fg },
    SnacksDashboardFooter     = { fg = p.palette.subtle },
    SnacksDashboardHeader     = { fg = p.ui.accent },
    SnacksDashboardIcon       = { fg = p.ui.accent },
    SnacksDashboardKey        = { fg = p.palette.nuur },
    SnacksDashboardSpecial    = { fg = p.palette.chatsalgan },
    SnacksDashboardDir        = { fg = p.palette.mus },

    -- Notifier
    SnacksNotifierDebug       = { fg = p.ui.fg, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierBorderDebug = { fg = p.palette.subtle, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierIconDebug   = { fg = p.semantic.hint },
    SnacksNotifierTitleDebug  = { fg = p.semantic.hint },
    SnacksNotifierError       = { fg = p.ui.fg, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierBorderError = { fg = p.semantic.error, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierIconError   = { fg = p.semantic.error },
    SnacksNotifierTitleError  = { fg = p.semantic.error },
    SnacksNotifierInfo        = { fg = p.ui.fg, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierBorderInfo  = { fg = p.semantic.info, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierIconInfo    = { fg = p.semantic.info },
    SnacksNotifierTitleInfo   = { fg = p.semantic.info },
    SnacksNotifierTrace       = { fg = p.ui.fg, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierBorderTrace = { fg = p.semantic.ok, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierIconTrace   = { fg = p.semantic.ok },
    SnacksNotifierTitleTrace  = { fg = p.semantic.ok },
    SnacksNotifierWarn        = { fg = p.ui.fg, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierBorderWarn  = { fg = p.semantic.warn, bg = opts.transparent and p.none or p.ui.bg },
    SnacksNotifierIconWarn    = { fg = p.semantic.warn },
    SnacksNotifierTitleWarn   = { fg = p.semantic.warn },
  }
end

return M
