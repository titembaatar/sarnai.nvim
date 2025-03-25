---@alias ColorPalette table<string, HEX|table>

local hsluv = require("sarnai.util.hsluv")
local color = require("sarnai.util.color")

local M = {}

-- Generate palette
---@param hue? number # Main color hue (default: 156)
---@param min_l? number # Minimum lightness (default: 8)
---@param max_l? number # Maximum lightness (default: 90)
---@return ColorPalette
function M.generate_palette(hue, min_l, max_l)
  hue = hue or 156
  min_l = min_l or 8
  max_l = max_l or 90

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
    palette[name] = hsluv.hsluv_to_hex(hue, s, l)
  end

  return palette
end

-- Safe color access for type safety
---@param colors ColorPalette
---@param key string
---@return HEX
local function get_color_safe(colors, key)
  local clr = colors[key]
  if type(clr) == "string" then
    return clr
  end
  return "#000000" -- Fallback color
end

-- Convert theme to light mode
---@param colors ColorPalette
---@return ColorPalette
function M.to_light_theme(colors)
  local light = {}

  -- Map inverted colors with reverse progression
  local base_map = {
    depth = "bright",
    shadow = "text",
    base = "subtle",
    surface = "faded",
    overlay = "muted",
    muted = "overlay",
    faded = "surface",
    subtle = "base",
    text = "shadow",
    bright = "depth"
  }

  -- Convert base colors with proper mapping
  for light_name, dark_name in pairs(base_map) do
    light[light_name] = color.invert_color(get_color_safe(colors, dark_name))
  end

  -- Convert accent colors
  for name, hex in pairs(colors) do
    if not light[name] and name ~= "none" and type(hex) == "string" and hex:sub(1, 1) == "#" then
      light[name] = color.invert_color(hex)

      -- Additional contrast checks for accent colors
      local accent_hsl = hsluv.hex_to_hsluv(light[name])
      local bg_hsl = hsluv.hex_to_hsluv(get_color_safe(light, "text"))

      -- Ensure enough lightness contrast with text color
      if math.abs(accent_hsl.l - bg_hsl.l) < 30 then
        -- Adjust lightness to ensure contrast
        if accent_hsl.l > 50 then
          accent_hsl.l = math.max(15, accent_hsl.l - 40)
        else
          accent_hsl.l = math.min(85, accent_hsl.l + 40)
        end
        -- Boost saturation for better distinction
        accent_hsl.s = math.min(100, accent_hsl.s * 1.5)

        light[name] = hsluv.hsluv_to_hex_obj(accent_hsl)
      end
    end
  end

  -- Keep special values
  light.none = "NONE"

  return light
end

return M
