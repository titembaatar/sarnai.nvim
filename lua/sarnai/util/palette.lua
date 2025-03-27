local hsluv = require("sarnai.util.hsluv")

local M = {}

-- Calculate WCAG contrast ratio between two colors
---@param fg string Foreground color
---@param bg string Background color
---@return number contrast ratio (1:1 to 21:1)
local function calculate_contrast_ratio(fg, bg)
  local function get_luminance(hex)
    local r, g, b

    if hex:sub(1, 1) == "#" then
      hex = hex:sub(2)
    end

    r = tonumber(hex:sub(1, 2), 16) / 255
    g = tonumber(hex:sub(3, 4), 16) / 255
    b = tonumber(hex:sub(5, 6), 16) / 255

    -- Convert RGB to relative luminance using sRGB color space formula
    r = r <= 0.03928 and r / 12.92 or ((r + 0.055) / 1.055) ^ 2.4
    g = g <= 0.03928 and g / 12.92 or ((g + 0.055) / 1.055) ^ 2.4
    b = b <= 0.03928 and b / 12.92 or ((b + 0.055) / 1.055) ^ 2.4

    return 0.2126 * r + 0.7152 * g + 0.0722 * b
  end

  local l1 = get_luminance(fg)
  local l2 = get_luminance(bg)

  -- Ensure the lighter color is l1
  if l1 < l2 then
    l1, l2 = l2, l1
  end

  return (l1 + 0.05) / (l2 + 0.05)
end

-- Adjust a color to meet WCAG AA contrast against a background
-- Returns adjusted color that meets at least 4.5:1 contrast ratio
---@param color_hex string The color to adjust
---@param bg_hex string The background to check against
---@param preserve_hue boolean Whether to strictly preserve hue
---@return string adjusted color with WCAG AA compliance
local function ensure_wcag_aa(color_hex, bg_hex, preserve_hue)
  preserve_hue = preserve_hue or false
  local ratio = calculate_contrast_ratio(color_hex, bg_hex)

  -- Already WCAG AA compliant
  if ratio >= 4.5 then
    return color_hex
  end

  local color_hsl = hsluv.hex_to_hsluv(color_hex)
  local bg_hsl = hsluv.hex_to_hsluv(bg_hex)
  local original_hue = color_hsl.h

  -- Determine if we should darken or lighten
  local should_darken = bg_hsl.l > 50

  -- Try incremental adjustments until we reach compliance
  for _ = 1, 20 do
    if should_darken then
      color_hsl.l = math.max(0, color_hsl.l - 5)
    else
      color_hsl.l = math.min(100, color_hsl.l + 5)
    end

    -- Boost saturation slightly for better differentiation
    color_hsl.s = math.min(100, color_hsl.s * 1.05)

    -- Allow slight hue shift if not preserving hue strictly
    if not preserve_hue then
      -- Shift hue slightly to enhance differentiation (max 10 degrees)
      local hue_shift = math.min(10, 30 / ratio) -- More shift for worse contrast
      color_hsl.h = (original_hue + hue_shift) % 360
    end

    local adjusted = hsluv.hsluv_to_hex_obj(color_hsl)
    ratio = calculate_contrast_ratio(adjusted, bg_hex)

    if ratio >= 4.5 then
      return adjusted
    end
  end

  -- If we couldn't reach 4.5:1 after 20 attempts, make a final stronger adjustment
  color_hsl.l = should_darken and 10 or 90
  color_hsl.s = math.min(100, color_hsl.s * 1.2)

  return hsluv.hsluv_to_hex_obj(color_hsl)
end

-- Convert theme to light mode with improved algorithm
---@param colors BasePalette
---@return BasePalette
function M.to_light_theme(colors)
  local light = {}

  -- Mathematical approach for UI colors
  -- The base relationships between light/dark themes are not arbitrary but follow principles:
  -- 1. Base, surface, overlay form a gradient with evenly spaced lightness
  -- 2. Muted, subtle, text also form a gradient with evenly spaced lightness

  -- Calculate lightness mathematically
  local bg_lightness = 95   -- Target lightness for background
  local text_lightness = 15 -- Target lightness for text

  -- Create base color with appropriate lightness
  local base_hsl = hsluv.hex_to_hsluv(colors.base)
  base_hsl.l = bg_lightness
  base_hsl.s = base_hsl.s * 0.5 -- Reduce saturation for background
  light.base = hsluv.hsluv_to_hex_obj(base_hsl)

  -- Create evenly spaced gradients
  local surface_hsl = hsluv.hex_to_hsluv(colors.surface)
  surface_hsl.h = base_hsl.h       -- Keep hue consistent
  surface_hsl.s = base_hsl.s * 1.2 -- Slightly more saturated
  surface_hsl.l = bg_lightness - 5 -- Slightly darker than base
  light.surface = hsluv.hsluv_to_hex_obj(surface_hsl)

  local overlay_hsl = hsluv.hex_to_hsluv(colors.overlay)
  overlay_hsl.h = base_hsl.h        -- Keep hue consistent
  overlay_hsl.s = base_hsl.s * 1.4  -- More saturated
  overlay_hsl.l = bg_lightness - 12 -- Darker than surface
  light.overlay = hsluv.hsluv_to_hex_obj(overlay_hsl)

  -- Text colors form another gradient
  local text_hsl = hsluv.hex_to_hsluv(colors.text)
  text_hsl.l = text_lightness
  text_hsl.s = text_hsl.s * 0.8 -- Reduce saturation for text
  light.text = hsluv.hsluv_to_hex_obj(text_hsl)

  local subtle_hsl = hsluv.hex_to_hsluv(colors.subtle)
  subtle_hsl.h = text_hsl.h          -- Keep hue consistent
  subtle_hsl.s = text_hsl.s * 0.9    -- Similar saturation
  subtle_hsl.l = text_lightness + 25 -- Lighter than text
  light.subtle = hsluv.hsluv_to_hex_obj(subtle_hsl)

  local muted_hsl = hsluv.hex_to_hsluv(colors.muted)
  muted_hsl.h = text_hsl.h          -- Keep hue consistent
  muted_hsl.s = text_hsl.s * 0.8    -- Less saturated
  muted_hsl.l = text_lightness + 50 -- Much lighter than text
  light.muted = hsluv.hsluv_to_hex_obj(muted_hsl)

  -- Track used hues to ensure differentiation
  local used_hues = {}

  -- Process accent colors with hue shifting to ensure differentiation
  for name, hex in pairs(colors) do
    if name ~= "base" and name ~= "surface" and name ~= "overlay" and
        name ~= "muted" and name ~= "subtle" and name ~= "text" and
        name ~= "none" and type(hex) == "string" and hex:sub(1, 1) == "#" then
      local hsl = hsluv.hex_to_hsluv(hex)

      -- Start with medium lightness to ensure good contrast potential
      hsl.l = 45

      -- Check if this hue is too close to already used hues
      local min_hue_distance = 25 -- Degrees

      for _, used_hue in ipairs(used_hues) do
        local hue_distance = math.abs(hsl.h - used_hue)
        hue_distance = math.min(hue_distance, 360 - hue_distance) -- Handle wrapping

        if hue_distance < min_hue_distance then
          -- Shift the hue away from the closest used hue
          local shift_amount = min_hue_distance - hue_distance + 5

          -- Determine shift direction (clockwise or counterclockwise)
          if (hsl.h > used_hue and hsl.h - used_hue < 180) or
              (hsl.h < used_hue and used_hue - hsl.h > 180) then
            hsl.h = (hsl.h + shift_amount) % 360
          else
            hsl.h = (hsl.h - shift_amount) % 360
          end
        end
      end

      -- Add this hue to used hues
      table.insert(used_hues, hsl.h)

      -- Boost saturation for better visibility on light themes
      hsl.s = math.min(100, hsl.s * 1.25)

      -- Convert back to hex
      light[name] = hsluv.hsluv_to_hex_obj(hsl)

      -- Ensure WCAG AA compliance against background
      light[name] = ensure_wcag_aa(light[name], light.base, false)
    end
  end

  -- Enhanced special handling for nuur and mus to make them more distinct
  if light.nuur and light.mus then
    local nuur_hsl = hsluv.hex_to_hsluv(light.nuur)
    local mus_hsl = hsluv.hex_to_hsluv(light.mus)

    -- Force a much larger hue difference between these specific colors
    -- Make nuur more blue and mus more cyan/turquoise

    -- Shift nuur toward blue (around 240 degrees)
    local target_nuur_hue = 240
    nuur_hsl.h = target_nuur_hue
    nuur_hsl.s = math.min(100, nuur_hsl.s * 1.5) -- Significantly boost saturation
    nuur_hsl.l = 45                              -- Good lightness for contrast

    -- Shift mus toward cyan/turquoise (around 180 degrees)
    local target_mus_hue = 180
    mus_hsl.h = target_mus_hue
    mus_hsl.s = math.min(100, mus_hsl.s * 1.6) -- Even more saturation
    mus_hsl.l = 55                             -- Slightly lighter for differentiation

    -- Apply changes
    light.nuur = hsluv.hsluv_to_hex_obj(nuur_hsl)
    light.mus = hsluv.hsluv_to_hex_obj(mus_hsl)

    -- Re-check WCAG compliance
    light.nuur = ensure_wcag_aa(light.nuur, light.base, true)
    light.mus = ensure_wcag_aa(light.mus, light.base, true)
  end

  -- Keep special values
  light.none = "NONE"

  return light
end

return M

