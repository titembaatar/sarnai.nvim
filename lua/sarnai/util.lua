local hsluv = require("sarnai.hsluv")
local M = {}

-- Colors conversion
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16)
  }
end

function M.rgb_to_hex(rgb)
  return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

-- Colors manipulation
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

function M.darken(hex, amount)
  return M.blend("#000000", hex, amount)
end

function M.lighten(hex, amount)
  return M.blend("#ffffff", hex, amount)
end

-- Generate a color with HSLuv values
function M.hsluv(h, s, l)
  -- Keep values in range
  h = h % 360
  s = math.max(0, math.min(100, s))
  l = math.max(0, math.min(100, l))

  return hsluv.hsluv_to_hex({ h = h, s = s, l = l })
end

-- Generate palette
function M.generate_palette(hue, min_l, max_l)
  hue = hue or 156

  -- Define lightness values for each color
  local lightness = {
    depth = min_l - 3, -- Slightly darker than shadow
    shadow = min_l,    -- Start color (darkest)
    base = min_l + ((max_l - min_l) * 0.2),
    surface = min_l + ((max_l - min_l) * 0.3),
    overlay = min_l + ((max_l - min_l) * 0.4),
    muted = min_l + ((max_l - min_l) * 0.6),
    faded = min_l + ((max_l - min_l) * 0.7),
    subtle = min_l + ((max_l - min_l) * 0.8),
    text = max_l,      -- End color (lightest)
    bright = max_l + 3 -- Slightly lighter than text
  }

  -- Create the palette
  local palette = {}
  for name, l in pairs(lightness) do
    -- Adjust saturation based on lightness
    local s = 30 -- Base saturation
    if l < 20 or l > 80 then
      s = 20     -- Less saturation for very dark/light colors
    end

    -- Use HSLuv for better perceptual uniformity
    palette[name] = M.hsluv(hue, s, l)
  end

  return palette
end

return M
