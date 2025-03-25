---@alias TerminalColors {black: HEX, bright_black: HEX, white: HEX, bright_white: HEX, red: HEX, bright_red: HEX, green: HEX, bright_green: HEX, yellow: HEX, bright_yellow: HEX, blue: HEX, bright_blue: HEX, magenta: HEX, bright_magenta: HEX, cyan: HEX, bright_cyan: HEX}

local M = {}
local color = require("sarnai.util.color")

-- Generate terminal colors from palette
---@param palette ColorPalette
---@return TerminalColors
function M.get_terminal_colors(palette)
  -- Safe access function to handle potentially nil values
  ---@param key string
  ---@return HEX
  local function get_color(key)
    local clr = palette[key]
    if type(clr) == "string" then
      return clr
    end
    return "#000000" -- Fallback color
  end

  return {
    black = get_color("shadow"),
    bright_black = get_color("surface"),
    white = get_color("subtle"),
    bright_white = get_color("text"),

    red = get_color("anis"),
    bright_red = color.lighten(get_color("anis"), 0.2),
    green = get_color("uvs"),
    bright_green = color.lighten(get_color("uvs"), 0.2),
    yellow = get_color("els"),
    bright_yellow = color.lighten(get_color("els"), 0.2),
    blue = get_color("nuur"),
    bright_blue = color.lighten(get_color("nuur"), 0.2),
    magenta = get_color("sarnai"),
    bright_magenta = color.lighten(get_color("sarnai"), 0.2),
    cyan = get_color("mus"),
    bright_cyan = color.lighten(get_color("mus"), 0.2),
  }
end

-- Set terminal colors
---@param palette ColorPalette
function M.set_terminal_colors(palette)
  if not palette.terminal then return end

  -- Safe access function to handle potentially nil values
  ---@param obj table
  ---@param key string
  ---@return HEX
  local function safe_get(obj, key)
    local val = obj[key]
    if type(val) == "string" then
      return val
    end
    return "#000000" -- Fallback color
  end

  local t = palette.terminal
  if type(t) ~= "table" then return end

  vim.g.terminal_color_0 = safe_get(t, "black")
  vim.g.terminal_color_1 = safe_get(t, "red")
  vim.g.terminal_color_2 = safe_get(t, "green")
  vim.g.terminal_color_3 = safe_get(t, "yellow")
  vim.g.terminal_color_4 = safe_get(t, "blue")
  vim.g.terminal_color_5 = safe_get(t, "magenta")
  vim.g.terminal_color_6 = safe_get(t, "cyan")
  vim.g.terminal_color_7 = safe_get(t, "white")
  vim.g.terminal_color_8 = safe_get(t, "bright_black")
  vim.g.terminal_color_9 = safe_get(t, "bright_red")
  vim.g.terminal_color_10 = safe_get(t, "bright_green")
  vim.g.terminal_color_11 = safe_get(t, "bright_yellow")
  vim.g.terminal_color_12 = safe_get(t, "bright_blue")
  vim.g.terminal_color_13 = safe_get(t, "bright_magenta")
  vim.g.terminal_color_14 = safe_get(t, "bright_cyan")
  vim.g.terminal_color_15 = safe_get(t, "bright_white")
end

return M
