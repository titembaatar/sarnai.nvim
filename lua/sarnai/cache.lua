---@class SarnaiCache
---@field version string
---@field config table
---@field colors ColorPalette
---@field groups Groups

local Util = require("sarnai.util")

local M = {}

-- From folke/tokyonight with some modifications
local uv = vim.uv or vim.loop

---@param key Style
function M.file(key)
  return vim.fn.stdpath("cache") .. "/sarnai-" .. key .. ".json"
end

---@param key Style
function M.read(key)
  ---@type boolean, SarnaiCache
  local ok, ret = pcall(function()
    return vim.json.decode(Util.read(M.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key Style
---@param data SarnaiCache
function M.write(key, data)
  pcall(Util.write, M.file(key), vim.json.encode(data))
end

---@param cached SarnaiCache
---@param opts SarnaiConfig
---@param version string
---@return boolean
function M.is_valid(cached, opts, version)
	if not cached or not cached.config or not cached.version then
		return false
	end

	if cached.version ~= version then
		return false
	end

	local cache_cfg = cached.config
	return cache_cfg.style == opts.style
		and cache_cfg.transparent == opts.transparent
		and cache_cfg.terminal_colors == opts.terminal_colors
		and vim.deep_equal(cache_cfg.styles, opts.styles)
end

---@param opts SarnaiConfig
---@param version string
---@return ColorPalette, Groups, boolean -- colors, groups, was_cached
function M.setup(opts, version)
	local key = opts.style
	local cached = M.read(key)

	if cached and M.is_valid(cached, opts, version) then
		return cached.colors, cached.groups, true
	end

	return {}, {}, false
end

function M.clear()
  for _, style in ipairs({ "khavar", "ovol" }) do
    uv.fs_unlink(M.file(style))
  end
end

return M

