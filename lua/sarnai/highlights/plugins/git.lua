local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local git = colors.git
  local ui = colors.ui

  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- Gitsigns
    GitSignsAdd = { fg = git.git_add },
    GitSignsChange = { fg = git.git_change },
    GitSignsDelete = { fg = git.git_delete },

    -- LazyGit
    LazyGitFloat = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
    LazyGitBorder = { fg = ui.border, bg = transparent_bg or ui.bg_float },
  }
end

return M
