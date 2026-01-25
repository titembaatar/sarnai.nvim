local M = {}

M.url="https://github.com/Saghen/blink.cmp"

---@param colors ColorPalette
---@return Highlights
function M.get(colors)
  local p = colors.palette
  local ui = colors.ui

  return {
	BlinkCmpCursorLineMenuHack  = { bg = p.surface },
    BlinkCmpDoc                 = { fg = ui.fg, bg = ui.bg_float },
    BlinkCmpDocBorder           = { fg = ui.border, bg = ui.bg_float },
    BlinkCmpGhostText           = { fg = p.surface },
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
