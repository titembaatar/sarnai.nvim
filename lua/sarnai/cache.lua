---@class SarnaiCache
---@field version string
---@field config table
---@field colors ColorPalette
---@field groups Groups

local Util = require("sarnai.util")

local M


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

---@param opts SarnaiConfig
---@return ColorPalette, Groups
function M.setup(opts)
	local key = opts.style
	local cached = M.read(key)

	if cached then
		return cached.colors, cached.groups
	end

	return {}, {}
end

function M.clear()
  for _, style in ipairs({ "khavar", "ovol" }) do
    uv.fs_unlink(M.file(style))
  end
end

return M


