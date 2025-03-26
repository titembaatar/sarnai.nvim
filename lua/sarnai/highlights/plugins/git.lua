local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- Gitsigns
    GitSignsAdd = { fg = p.git.git_add },
    GitSignsChange = { fg = p.git.git_change },
    GitSignsDelete = { fg = p.git.git_delete },

    -- LazyGit
    LazyGitFloat = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_float },
    LazyGitBorder = { fg = p.ui.border, bg = transparent_bg or p.ui.bg_float },
  }
end

return M
