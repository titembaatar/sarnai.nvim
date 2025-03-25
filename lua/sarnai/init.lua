local config = require("sarnai.config")
local colors = require("sarnai.colors")
local util = require("sarnai.util")
local highlights = require("sarnai.highlights")

local M = {}

---@param opts? SarnaiConfig
function M.setup(opts)
  -- Store the options for later use
  M.options = vim.tbl_deep_extend("force", config.defaults, opts or {})
end

---@param opts? SarnaiConfig
---@return ColorPalette
function M.load(opts)
  -- Load the colorscheme with given options
  opts = vim.tbl_deep_extend("force", M.options or config.defaults, opts or {})

  -- Check if caching is enabled
  local use_cache = opts.cache ~= false

  -- Generate a cache key for the current config
  local cache_key = use_cache and util.get_cache_key(opts) or nil

  -- Check if we have cached highlights for this config
  if use_cache and cache_key and util.has(cache_key) then
    local cached = util.get(cache_key)
    highlights.set(cached.highlights)
    vim.g.colors_name = "sarnai-" .. opts.style
    return cached.palette
  end

  -- Get the color palette
  local palette = colors.get_colors(opts.style)

  -- Apply user's color overrides if provided
  if opts.on_colors and type(opts.on_colors) == "function" then
    opts.on_colors(palette)
  end

  -- Clear any existing highlights if not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  -- Set terminal colors if enabled
  vim.o.termguicolors = true
  if opts.terminal_colors ~= false then
    util.set_terminal_colors(palette)
  end

  -- Get all highlights
  local hl = highlights.get(palette, opts)

  -- Apply highlights
  highlights.set(hl)

  -- Set colorscheme name
  vim.g.colors_name = "sarnai-" .. opts.style

  -- Cache the highlights if caching is enabled
  if use_cache and cache_key then
    util.store(cache_key, hl, palette)
  end

  return palette
end

-- Clear the highlights cache
function M.clear_cache()
  util.clear()
end

return M
