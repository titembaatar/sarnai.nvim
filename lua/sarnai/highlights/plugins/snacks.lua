local util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local sem = colors.semantic
  local ui = colors.ui

  return {
    -- Dashboard
    SnacksDashboardDesc       = { fg = ui.fg },
    SnacksDashboardFooter     = { fg = p.subtle },
    SnacksDashboardHeader     = { fg = ui.accent },
    SnacksDashboardIcon       = { fg = ui.accent },
    SnacksDashboardKey        = { fg = p.nuur },
    SnacksDashboardSpecial    = { fg = p.chatsalgan },
    SnacksDashboardDir        = { fg = p.mus },

    -- Notifier
    SnacksNotifierDebug       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierBorderDebug = { fg = p.subtle, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierIconDebug   = { fg = sem.hint },
    SnacksNotifierTitleDebug  = { fg = sem.hint },
    SnacksNotifierError       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierBorderError = { fg = sem.error, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierIconError   = { fg = sem.error },
    SnacksNotifierTitleError  = { fg = sem.error },
    SnacksNotifierInfo        = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierBorderInfo  = { fg = sem.info, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierIconInfo    = { fg = sem.info },
    SnacksNotifierTitleInfo   = { fg = sem.info },
    SnacksNotifierTrace       = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierBorderTrace = { fg = sem.ok, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierIconTrace   = { fg = sem.ok },
    SnacksNotifierTitleTrace  = { fg = sem.ok },
    SnacksNotifierWarn        = { fg = ui.fg, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierBorderWarn  = { fg = sem.warn, bg = opts.transparent and colors.none or ui.bg },
    SnacksNotifierIconWarn    = { fg = sem.warn },
    SnacksNotifierTitleWarn   = { fg = sem.warn },
  }
end

return M
