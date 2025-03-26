local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  return {
    DapStoppedLine = { bg = util.blend(p.semantic.warn, p.ui.bg, 0.1) },
  }
end

return M
