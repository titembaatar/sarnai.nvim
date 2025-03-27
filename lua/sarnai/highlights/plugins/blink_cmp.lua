local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local ui = colors.ui
  local t = colors.terminal

  return {
    BlinkCmpDoc                 = { fg = ui.fg, bg = ui.bg_float },
    BlinkCmpDocBorder           = { fg = ui.border, bg = ui.bg_float },
    BlinkCmpGhostText           = { fg = t.bright_black },
    BlinkCmpKindCodeium         = { fg = p.mus, bg = colors.none },
    BlinkCmpKindCopilot         = { fg = p.mus, bg = colors.none },
    BlinkCmpKindDefault         = { fg = p.subtle, bg = colors.none },
    BlinkCmpKindSupermaven      = { fg = p.mus, bg = colors.none },
    BlinkCmpKindTabNine         = { fg = p.mus, bg = colors.none },
    BlinkCmpLabel               = { fg = ui.fg, bg = colors.none },
    BlinkCmpLabelDeprecated     = { fg = p.muted, bg = colors.none, strikethrough = true },
    BlinkCmpLabelMatch          = { fg = ui.accent, bg = colors.none },
    BlinkCmpMenu                = { fg = ui.fg, bg = ui.bg_float },
    BlinkCmpMenuBorder          = { fg = ui.border, bg = ui.bg_float },
    BlinkCmpSignatureHelp       = { fg = ui.fg, bg = ui.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = ui.border, bg = ui.bg_float },
  }
end

return M
