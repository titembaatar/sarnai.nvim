local util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local sem = colors.semantic
  local ui = colors.ui

  return {
    DapStoppedLine = { bg = util.blend(sem.warn, ui.bg, 0.1) },
  }
end

return M
