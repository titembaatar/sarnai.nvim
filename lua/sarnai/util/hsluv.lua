local M = {}

local hexChars = "0123456789abcdef"

local function hex_to_rgb(hex)
  hex = string.lower(hex)
  local ret = {}
  for i = 0, 2 do
    local char1 = string.sub(hex, i * 2 + 2, i * 2 + 2)
    local char2 = string.sub(hex, i * 2 + 3, i * 2 + 3)
    local digit1 = string.find(hexChars, char1) - 1
    local digit2 = string.find(hexChars, char2) - 1
    ret[i + 1] = (digit1 * 16 + digit2) / 255.0
  end
  return ret
end

local function rgb_to_hex(rgb)
  local hex = "#"
  for i = 1, 3 do
    local c = rgb[i] * 255.0
    c = math.min(math.max(math.floor(c + 0.5), 0), 255)
    local digit1 = math.floor(c / 16)
    local digit2 = math.floor(c % 16)
    hex = hex .. string.sub(hexChars, digit1 + 1, digit1 + 1)
    hex = hex .. string.sub(hexChars, digit2 + 1, digit2 + 1)
  end
  return hex
end

-- http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
-- sRGB conversion matrices
local m = {
  { 3.240969941904521, -1.537383177570093, -0.498610760293 },
  { -0.96924363628087, 1.87596750150772,   0.041555057407175 },
  { 0.055630079696993, -0.20397695888897,  1.056971514242878 },
}
local min = {
  { 0.41239079926595, 0.35758433938387, 0.18048078840183 },
  { 0.21263900587151, 0.71516867876775, 0.07219231536073 },
  { 0.01933082871559, 0.11919477979462, 0.95053215224966 },
}

local function dot_product(a, b)
  local ret = 0
  for i = 1, 3 do
    ret = ret + a[i] * b[i]
  end
  return ret
end

local function rgb_to_xyz(rgb)
  local r = rgb[1]
  local g = rgb[2]
  local b = rgb[3]
  -- gamma correction, assume sRGB
  r = (r > 0.04045) and (((r + 0.055) / 1.055) ^ 2.4) or (r / 12.92)
  g = (g > 0.04045) and (((g + 0.055) / 1.055) ^ 2.4) or (g / 12.92)
  b = (b > 0.04045) and (((b + 0.055) / 1.055) ^ 2.4) or (b / 12.92)

  return { dot_product(min[1], { r, g, b }), dot_product(min[2], { r, g, b }), dot_product(min[3], { r, g, b }) }
end

local refY = 1.0
local refU = 0.19783000664283
local refV = 0.46831999493879

local kappa = 903.2962962
local epsilon = 0.0088564516

local function xyz_to_luv(xyz)
  local x = xyz[1]
  local y = xyz[2]
  local z = xyz[3]

  local l
  if y <= epsilon then
    l = y * kappa
  else
    l = 116 * math.pow(y, 1.0 / 3.0) - 16
  end

  local vars = { x, y, z }
  if vars[1] == 0 and vars[2] == 0 and vars[3] == 0 then
    return { 0, 0, 0 }
  end

  local varU = (4 * vars[1]) / (vars[1] + (15 * vars[2]) + (3 * vars[3]))
  local varV = (9 * vars[2]) / (vars[1] + (15 * vars[2]) + (3 * vars[3]))
  local u = 13 * l * (varU - refU)
  local v = 13 * l * (varV - refV)

  return { l, u, v }
end

local function luv_to_lch(luv)
  local l = luv[1]
  local u = luv[2]
  local v = luv[3]
  local c = math.sqrt(u * u + v * v)
  local h
  if c < 0.00000001 then
    h = 0
  else
    h = math.atan2(v, u) * 180.0 / math.pi
    if h < 0 then
      h = 360 + h
    end
  end
  return { l, c, h }
end

local function lch_to_husl(lch)
  local l = lch[1]
  local c = lch[2]
  local h = lch[3]
  if l > 99.9999999 then
    return { h, 0, 100 }
  end
  if l < 0.00000001 then
    return { h, 0, 0 }
  end

  local max_c = M.max_chroma_for_lh(l, h)
  local s = c / max_c * 100.0

  return { h, s, l }
end

local function get_bounds(l)
  local sub1 = math.pow(l + 16, 3) / 1560896
  local sub2 = sub1 > epsilon and sub1 or l / kappa
  local ret = {}

  for channel = 1, 3 do
    local m1 = m[channel][1]
    local m2 = m[channel][2]
    local m3 = m[channel][3]

    for t = 0, 1 do
      local top1 = (284517 * m1 - 94839 * m3) * sub2
      local top2 = (838422 * m3 + 769860 * m2 + 731718 * m1) * l * sub2 - 769860 * t * l
      local bottom = (632260 * m3 - 126452 * m2) * sub2 + 126452 * t
      table.insert(ret, { top1 / bottom, top2 / bottom })
    end
  end
  return ret
end

function M.max_chroma_for_lh(l, h)
  local hrad = h / 360 * math.pi * 2
  local bounds = get_bounds(l)
  local min = 1.0e6

  for i = 1, 6 do
    local length = M.length_of_ray_until_intersect(hrad, bounds[i])
    if length > 0 then
      min = math.min(min, length)
    end
  end
  return min
end

function M.length_of_ray_until_intersect(theta, line)
  return line[2] / (math.sin(theta) - line[1] * math.cos(theta))
end

function M.hsluv_to_hex(h, s, l)
  if l <= 0.0001 then
    return "#000000"
  end
  if l >= 99.9999 then
    return "#ffffff"
  end
  h = h % 360
  local lch = { l, M.max_chroma_for_lh(l, h) * s / 100, h }
  return M.lch_to_hex(lch)
end

function M.hex_to_hsluv(hex)
  local rgb = hex_to_rgb(hex)
  local xyz = rgb_to_xyz(rgb)
  local luv = xyz_to_luv(xyz)
  local lch = luv_to_lch(luv)
  local hsluv = lch_to_husl(lch)
  return { h = hsluv[1], s = hsluv[2], l = hsluv[3] }
end

function M.lch_to_hex(lch)
  return M.luv_to_hex(M.lch_to_luv(lch))
end

function M.lch_to_luv(lch)
  local l = lch[1]
  local c = lch[2]
  local h = lch[3] / 360.0 * 2 * math.pi
  return { l, math.cos(h) * c, math.sin(h) * c }
end

function M.luv_to_hex(luv)
  return M.xyz_to_hex(M.luv_to_xyz(luv))
end

function M.luv_to_xyz(luv)
  local l = luv[1]
  local u = luv[2]
  local v = luv[3]
  if l <= 0.00000001 then
    return { 0, 0, 0 }
  end

  local varU = u / (13 * l) + refU
  local varV = v / (13 * l) + refV

  local y
  if l <= 8.0 then
    y = l / kappa
  else
    y = math.pow((l + 16) / 116, 3)
  end

  local x = y * (9 * varU) / (4 * varV)
  local z = y * (12 - 3 * varU - 20 * varV) / (4 * varV)
  return { x, y, z }
end

function M.xyz_to_hex(xyz)
  return rgb_to_hex(M.xyz_to_rgb(xyz))
end

function M.xyz_to_rgb(xyz)
  local x = xyz[1]
  local y = xyz[2]
  local z = xyz[3]

  local rgb = {}
  rgb[1] = dot_product(m[1], xyz)
  rgb[2] = dot_product(m[2], xyz)
  rgb[3] = dot_product(m[3], xyz)

  for i = 1, 3 do
    rgb[i] = (rgb[i] <= 0.0031308) and (12.92 * rgb[i]) or (1.055 * math.pow(rgb[i], 1.0 / 2.4) - 0.055)
  end
  return rgb
end

-- Convenience function for our colorscheme usage
function M.hsluv_to_hex_obj(hsl)
  return M.hsluv_to_hex(hsl.h, hsl.s, hsl.l)
end

return M
