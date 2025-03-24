local M = {}

-- Generate terminal colors from palette
function M.get_terminal_colors(palette)
  return {
    black = palette.shadow,
    bright_black = palette.surface,
    white = palette.subtle,
    bright_white = palette.text,

    red = palette.anis,
    bright_red = require("sarnai.util.color").lighten(palette.anis, 0.2),
    green = palette.uvs,
    bright_green = require("sarnai.util.color").lighten(palette.uvs, 0.2),
    yellow = palette.els,
    bright_yellow = require("sarnai.util.color").lighten(palette.els, 0.2),
    blue = palette.nuur,
    bright_blue = require("sarnai.util.color").lighten(palette.nuur, 0.2),
    magenta = palette.sarnai,
    bright_magenta = require("sarnai.util.color").lighten(palette.sarnai, 0.2),
    cyan = palette.mus,
    bright_cyan = require("sarnai.util.color").lighten(palette.mus, 0.2),
  }
end

-- Set terminal colors
function M.set_terminal_colors(palette)
  if not palette.terminal then return end

  vim.g.terminal_color_0 = palette.terminal.black
  vim.g.terminal_color_1 = palette.terminal.red
  vim.g.terminal_color_2 = palette.terminal.green
  vim.g.terminal_color_3 = palette.terminal.yellow
  vim.g.terminal_color_4 = palette.terminal.blue
  vim.g.terminal_color_5 = palette.terminal.magenta
  vim.g.terminal_color_6 = palette.terminal.cyan
  vim.g.terminal_color_7 = palette.terminal.white
  vim.g.terminal_color_8 = palette.terminal.bright_black
  vim.g.terminal_color_9 = palette.terminal.bright_red
  vim.g.terminal_color_10 = palette.terminal.bright_green
  vim.g.terminal_color_11 = palette.terminal.bright_yellow
  vim.g.terminal_color_12 = palette.terminal.bright_blue
  vim.g.terminal_color_13 = palette.terminal.bright_magenta
  vim.g.terminal_color_14 = palette.terminal.bright_cyan
  vim.g.terminal_color_15 = palette.terminal.bright_white
end

return M
