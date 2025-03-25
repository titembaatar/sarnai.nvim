---@alias HEX string # Hex color code like "#RRGGBB"
---@alias RGB {r: number, g: number, b: number}

local util = require("sarnai.util")

local M = {}

-- Colors conversion
---@param hex HEX
---@return RGB
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16)
  }
end

---@param rgb RGB
---@return HEX
function M.rgb_to_hex(rgb)
  return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

-- Colors manipulation
---@param fg HEX
---@param bg HEX
---@param alpha number
---@return HEX
function M.blend(fg, bg, alpha)
  local bg_rgb = M.hex_to_rgb(bg)
  local fg_rgb = M.hex_to_rgb(fg)

  local result = {
    r = math.floor(fg_rgb.r * alpha + bg_rgb.r * (1 - alpha)),
    g = math.floor(fg_rgb.g * alpha + bg_rgb.g * (1 - alpha)),
    b = math.floor(fg_rgb.b * alpha + bg_rgb.b * (1 - alpha))
  }

  return M.rgb_to_hex(result)
end

---@param hex HEX
---@param amount number
---@return HEX
function M.darken(hex, amount)
  return M.blend("#000000", hex, amount)
end

---@param hex HEX
---@param amount number
---@return HEX
function M.lighten(hex, amount)
  return M.blend("#ffffff", hex, amount)
end

-- Generate a color with HSLuv values
---@param h number # Hue (0-360)
---@param s number # Saturation (0-100)
---@param l number # Lightness (0-100)
---@return HEX
function M.hsluv(h, s, l)
  -- Keep values in range
  h = h % 360
  s = math.max(0, math.min(100, s))
  l = math.max(0, math.min(100, l))

  return util.hsluv_to_hex(h, s, l)
end

-- Invert colors for light theme
---@param hex HEX
---@return HEX
function M.invert_color(hex)
  local color = util.hex_to_hsluv(hex)

  -- Invert lightness
  color.l = 100 - color.l

  -- Adjust saturation based on new lightness for better contrast
  if color.l > 80 then
    color.s = math.max(10, color.s * 0.8) -- Reduce saturation for very light colors
  elseif color.l < 20 then
    color.s = math.max(20, color.s * 1.2) -- Increase saturation for dark colors
  end

  return util.hsluv_to_hex(color)
end

return M
