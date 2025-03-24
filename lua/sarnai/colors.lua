local M = {}

-- Core color palette
M.palette = {
  -- Base foundation colors (darkest to lightest)
  depth = nil,        -- Darker than shadow
  shadow = "#172620", -- Original base color
  base = nil,         -- Intermediate dark
  surface = nil,      -- Intermediate dark
  overlay = nil,      -- Intermediate medium
  muted = nil,        -- Intermediate medium
  faded = nil,        -- Intermediate light
  subtle = nil,       -- Intermediate light
  text = "#dfece7",   -- Original text color
  bright = nil,       -- Lighter than text

  -- Core accent colors
  sarnai = "#f0c3cb",
  anis = "#ff6b6b",
  chatsalgan = "#e5951a",
  els = "#cca24d",
  uvs = "#80b946",
  nuur = "#2b879e",
  mus = "#9deaea",
  yargui = "#d5b3e5",
}

-- Function to get the khavar (dark) theme
function M.get_khavar()
  local colors = vim.deepcopy(M.palette)

  -- Add placeholder intermediate colors (will implement generator later)
  colors.depth = "#0f1713"   -- Darker than shadow
  colors.base = "#1d3129"    -- Intermediate dark
  colors.surface = "#263d33" -- Intermediate dark
  colors.overlay = "#324e42" -- Intermediate dark
  colors.muted = "#4e7e6b"   -- Intermediate medium
  colors.faded = "#6a9d88"   -- Intermediate light
  colors.subtle = "#90bbaa"  -- Intermediate light
  colors.bright = "#edf7f3"  -- Lighter than text

  -- Additional utility colors
  colors.none = "NONE"

  return colors
end

-- Function to get the ovol (light) theme
function M.get_ovol()
  -- In the future, this will dynamically convert the dark theme to light
  local colors = {
    -- Base colors (from light to dark, opposite of khavar)
    depth = "#0a130f",
    shadow = "#13201b", -- Equivalent to text in dark theme
    base = "#2a3d37",
    surface = "#446f5e",
    overlay = "#5f8c79",
    muted = "#81b19e",
    faded = "#a3cbbc",
    subtle = "#c1e0d6",
    text = "#dceae4", -- Equivalent to shadow in dark theme
    bright = "#f5faf8",

    -- Core accent colors (adjusted for light theme)
    sarnai = "#b93d4d",
    anis = "#cc2929",
    chatsalgan = "#da730c",
    els = "#df9b23",
    uvs = "#4c890f",
    nuur = "#0a728c",
    mus = "#12adad",
    yargui = "#a353c6",

    -- Additional utility colors
    none = "NONE",
  }

  return colors
end

-- Get colors based on style
function M.get_colors(style)
  if style == "ovol" then
    return M.get_ovol()
  else
    return M.get_khavar()
  end
end

return M
