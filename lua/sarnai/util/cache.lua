---@class HighlightsCache
---@field highlights Highlights
---@field palette ColorPalette

local M = {}

-- Cache storage
---@type table<string, HighlightsCache>
M._cache = {}

-- Generate a cache key from config options
---@param opts SarnaiConfig
---@return string
function M.get_cache_key(opts)
  local parts = {
    "style=" .. (opts.style or "khavar"),
    "transparent=" .. tostring(opts.transparent or false),
  }

  -- Add style options to cache key
  if opts.styles then
    for group, style in pairs(opts.styles) do
      parts[#parts + 1] = group .. "=" .. vim.inspect(style)
    end
  end

  -- Add plugin config to cache key
  if opts.plugins then
    local plugins_str = "plugins="
    for k, v in pairs(opts.plugins) do
      if type(v) == "boolean" then
        plugins_str = plugins_str .. k .. "=" .. tostring(v) .. ","
      end
    end
    parts[#parts + 1] = plugins_str
  end

  -- Add any custom overrides to the cache key
  if opts.on_colors or opts.on_highlights then
    parts[#parts + 1] = "custom=true"
  end

  return table.concat(parts, ",")
end

-- Store highlights in cache
---@param key string Cache key
---@param highlights Highlights
---@param palette ColorPalette
function M.store(key, highlights, palette)
  M._cache[key] = {
    highlights = highlights,
    palette = palette
  }
end

-- Get highlights from cache
---@param key string Cache key
---@return HighlightsCache|nil
function M.get(key)
  return M._cache[key]
end

-- Check if cache has key
---@param key string Cache key
---@return boolean
function M.has(key)
  return M._cache[key] ~= nil
end

-- Clear the highlights cache
function M.clear()
  M._cache = {}
end

return M
