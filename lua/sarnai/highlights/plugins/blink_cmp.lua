local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  return {
    BlinkCmpDoc                 = { fg = p.ui.fg, bg = p.ui.bg_float },
    BlinkCmpDocBorder           = { fg = p.ui.border, bg = p.ui.bg_float },
    BlinkCmpGhostText           = { fg = p.terminal.bright_black },
    BlinkCmpKindCodeium         = { fg = p.palette.mus, bg = p.none },
    BlinkCmpKindCopilot         = { fg = p.palette.mus, bg = p.none },
    BlinkCmpKindDefault         = { fg = p.palette.subtle, bg = p.none },
    BlinkCmpKindSupermaven      = { fg = p.palette.mus, bg = p.none },
    BlinkCmpKindTabNine         = { fg = p.palette.mus, bg = p.none },
    BlinkCmpLabel               = { fg = p.ui.fg, bg = p.none },
    BlinkCmpLabelDeprecated     = { fg = p.palette.muted, bg = p.none, strikethrough = true },
    BlinkCmpLabelMatch          = { fg = p.ui.accent, bg = p.none },
    BlinkCmpMenu                = { fg = p.ui.fg, bg = p.ui.bg_float },
    BlinkCmpMenuBorder          = { fg = p.ui.border, bg = p.ui.bg_float },
    BlinkCmpSignatureHelp       = { fg = p.ui.fg, bg = p.ui.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = p.ui.border, bg = p.ui.bg_float },
  }
end

return M
