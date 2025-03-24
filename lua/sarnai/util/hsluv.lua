---@alias HSLuv {h: number, s: number, l: number}

-- Adapted from hsluv.org

local hsluv = {}

-- Constants
hsluv.m = {
  { 3.240969941904521, -1.537383177570093, -0.498610760293 },
  { -0.96924363628087, 1.87596750150772,   0.041555057407175 },
  { 0.055630079696993, -0.20397695888897,  1.056971514242878 }
}

hsluv.minv = {
  { 0.41239079926595,  0.35758433938387, 0.18048078840183 },
  { 0.21263900587151,  0.71516867876775, 0.072192315360733 },
  { 0.019330818715591, 0.11919477979462, 0.95053215224966 }
}

hsluv.refY = 1.0
hsluv.refU = 0.19783000664283
hsluv.refV = 0.46831999493879
hsluv.kappa = 903.2962962
hsluv.epsilon = 0.0088564516

-- Helper functions
---@param line {slope: number, intercept: number}
---@return number
local function distance_line_from_origin(line)
  return math.abs(line.intercept) / math.sqrt(line.slope * line.slope + 1)
end

---@param theta number
---@param line {slope: number, intercept: number}
---@return number
local function length_of_ray_until_intersect(theta, line)
  return line.intercept / (math.sin(theta) - line.slope * math.cos(theta))
end

-- Conversion functions
---@param l number
---@return {slope: number, intercept: number}[]
function hsluv.get_bounds(l)
  local result = {}
  local sub1 = ((l + 16) ^ 3) / 1560896
  local sub2 = sub1 > hsluv.epsilon and sub1 or l / hsluv.kappa

  for i = 1, 3 do
    local m1 = hsluv.m[i][1]
    local m2 = hsluv.m[i][2]
    local m3 = hsluv.m[i][3]

    for t = 0, 1 do
      local top1 = (284517 * m1 - 94839 * m3) * sub2
      local top2 = (838422 * m3 + 769860 * m2 + 731718 * m1) * l * sub2 - 769860 * t * l
      local bottom = (632260 * m3 - 126452 * m2) * sub2 + 126452 * t
      table.insert(result, { slope = top1 / bottom, intercept = top2 / bottom })
    end
  end
  return result
end

---@param l number
---@return number
function hsluv.max_safe_chroma_for_l(l)
  local bounds = hsluv.get_bounds(l)
  local min = math.huge

  for i = 1, 6 do
    local length = distance_line_from_origin(bounds[i])
    if length >= 0 then
      min = math.min(min, length)
    end
  end
  return min
end

---@param l number
---@param h number
---@return number
function hsluv.max_safe_chroma_for_lh(l, h)
  local hrad = h / 360 * math.pi * 2
  local bounds = hsluv.get_bounds(l)
  local min = math.huge

  for i = 1, 6 do
    local bound = bounds[i]
    local length = length_of_ray_until_intersect(hrad, bound)
    if length >= 0 then
      min = math.min(min, length)
    end
  end
  return min
end

---@param c number
---@return number
function hsluv.from_linear(c)
  if c <= 0.0031308 then
    return 12.92 * c
  else
    return 1.055 * (c ^ (1 / 2.4)) - 0.055
  end
end

---@param c number
---@return number
function hsluv.to_linear(c)
  if c > 0.04045 then
    return ((c + 0.055) / 1.055) ^ 2.4
  else
    return c / 12.92
  end
end

---@param a number[]
---@param b number[]
---@return number
function hsluv.dot_product(a, b)
  local sum = 0
  for i = 1, 3 do
    sum = sum + a[i] * b[i]
  end
  return sum
end

-- Main conversion functions
---@param hsl HSLuv
---@return HEX
function hsluv.hsluv_to_hex(hsl)
  local h, s, l = hsl.h, hsl.s, hsl.l

  if l > 99.9999 then
    return "#ffffff"
  end

  if l < 0.00001 then
    return "#000000"
  end

  local max_chroma = hsluv.max_safe_chroma_for_lh(l, h)
  local c = max_chroma * s / 100
  local hrad = h / 360 * 2 * math.pi
  local u = math.cos(hrad) * c
  local v = math.sin(hrad) * c

  local x, y, z
  if l == 0 then
    x, y, z = 0, 0, 0
  else
    y = l / 100
    if y <= 0.008856 then
      y = y / 903.3
    else
      y = (y + 0.16) / 1.16
    end

    u = u / (13 * l) + hsluv.refU
    v = v / (13 * l) + hsluv.refV

    x = 9 * y * u / (4 * v)
    z = -x / 3 - 5 * y + 3
  end

  local r = hsluv.from_linear(3.2404542 * x - 1.5371385 * y - 0.4985314 * z)
  local g = hsluv.from_linear(-0.9692660 * x + 1.8760108 * y + 0.0415560 * z)
  local b = hsluv.from_linear(0.0556434 * x - 0.2040259 * y + 1.0572252 * z)

  r = math.max(0, math.min(1, r))
  g = math.max(0, math.min(1, g))
  b = math.max(0, math.min(1, b))

  return string.format("#%02x%02x%02x",
    math.floor(r * 255 + 0.5),
    math.floor(g * 255 + 0.5),
    math.floor(b * 255 + 0.5))
end

---@param hex HEX
---@return HSLuv
function hsluv.hex_to_hsluv(hex)
  hex = hex:gsub("#", "")
  local r = tonumber(hex:sub(1, 2), 16) / 255
  local g = tonumber(hex:sub(3, 4), 16) / 255
  local b = tonumber(hex:sub(5, 6), 16) / 255

  -- RGB to XYZ
  r = hsluv.to_linear(r)
  g = hsluv.to_linear(g)
  b = hsluv.to_linear(b)

  local x = 0.4124564 * r + 0.3575761 * g + 0.1804375 * b
  local y = 0.2126729 * r + 0.7151522 * g + 0.0721750 * b
  local z = 0.0193339 * r + 0.1191920 * g + 0.9503041 * b

  -- XYZ to LUV
  local l
  if y <= 0.008856 then
    l = y * 903.3
  else
    l = 116 * (y ^ (1 / 3)) - 16
  end

  if l < 0.00001 then
    return { h = 0, s = 0, l = 0 }
  end

  local u = 4 * x / (x + 15 * y + 3 * z)
  local v = 9 * y / (x + 15 * y + 3 * z)

  u = 13 * l * (u - hsluv.refU)
  v = 13 * l * (v - hsluv.refV)

  -- LUV to HSLuv
  local h, s
  if math.abs(u) < 0.00001 and math.abs(v) < 0.00001 then
    h = 0
    s = 0
  else
    h = math.atan2(v, u) * 180 / math.pi
    if h < 0 then
      h = h + 360
    end

    local c = math.sqrt(u * u + v * v)
    local max_chroma = hsluv.max_safe_chroma_for_lh(l, h)
    s = c / max_chroma * 100
  end

  return { h = h, s = s, l = l }
end

return hsluv
