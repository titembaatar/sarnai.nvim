local hsluv = require("sarnai.util.hsluv")
local color = require("sarnai.util.color")

local M = {}

-- Convert theme to light mode
---@param colors BasePalette
---@return BasePalette
function M.to_light_theme(colors)
  local light = {}

  -- Map inverted colors with reverse progression
  local base_map = {
    base = "text",
    surface = "subtle",
    overlay = "muted",
    muted = "overlay",
    subtle = "surface",
    text = "base",
  }

  -- Convert base colors with proper mapping
  for light_name, dark_name in pairs(base_map) do
    light[light_name] = color.invert_color(colors[dark_name])
  end

  -- Convert accent colors
  for name, hex in pairs(colors) do
    if not light[name] and name ~= "none" and type(hex) == "string" and hex:sub(1, 1) == "#" then
      light[name] = color.invert_color(hex)

      -- Additional contrast checks for accent colors
      local accent_hsl = hsluv.hex_to_hsluv(light[name])
      local bg_hsl = hsluv.hex_to_hsluv(light.text)

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

        light[name] = hsluv.hsluv_to_hex(accent_hsl.h, accent_hsl.s, accent_hsl.l)
      end
    end
  end

  -- Keep special values
  light.none = "NONE"

  return light
end

return M
