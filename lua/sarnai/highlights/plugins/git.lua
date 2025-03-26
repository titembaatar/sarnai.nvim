local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Gitsigns
    GitSignsAdd = { fg = c.git.git_add },             -- Line added
    GitSignsChange = { fg = c.git.git_change },       -- Line changed
    GitSignsDelete = { fg = c.git.git_delete },       -- Line deleted
    GitSignsChangedelete = { fg = c.git.git_change }, -- Line changed and deleted
    GitSignsTopdelete = { fg = c.git.git_delete },    -- Top deleted
    GitSignsUntracked = { fg = c.git.git_ignore },    -- Untracked lines

    -- Gitsigns blame
    GitSignsCurrentLineBlame = { fg = c.palette.muted, italic = styles.italic },

    -- Git word diff
    GitSignsAddInline = { bg = util.blend(c.git.git_add, c.ui.bg, 0.3) },
    GitSignsChangeInline = { bg = util.blend(c.git.git_change, c.ui.bg, 0.3) },
    GitSignsDeleteInline = { bg = util.blend(c.git.git_delete, c.ui.bg, 0.3) },

    -- Git preview
    GitSignsAddPreview = { bg = util.blend(c.git.git_add, c.ui.bg, 0.2) },
    GitSignsDeletePreview = { bg = util.blend(c.git.git_delete, c.ui.bg, 0.2) },

    -- LazyGit
    LazyGitNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    LazyGitBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },
    LazyGitBranch = { fg = c.git.git_merge, bg = c.ui.bg, bold = styles.bold },
    LazyGitHeader = { fg = c.palette.subtle, bg = transparent_bg or c.ui.bg },
    LazyGitFileName = { fg = c.ui.fg, bold = styles.bold },
    LazyGitCommit = { fg = c.git.git_merge },
    LazyGitCommitAuthor = { fg = c.git.git_text },
    LazyGitCommitDate = { fg = c.palette.muted },
    LazyGitStatusAdded = { fg = c.git.git_add },
    LazyGitStatusModified = { fg = c.git.git_change },
    LazyGitStatusDeleted = { fg = c.git.git_delete },
    LazyGitStatusRenamed = { fg = c.git.git_rename },
    LazyGitStatusUntracked = { fg = c.git.git_ignore, italic = styles.italic },
    LazyGitInlineTitle = { fg = c.git.git_text, bold = styles.bold },
    LazyGitDiffAdd = { link = "DiffAdd" },
    LazyGitDiffChange = { link = "DiffChange" },
    LazyGitDiffDelete = { link = "DiffDelete" },
    LazyGitDiffText = { link = "DiffText" },

    -- Git commit message
    gitcommitSummary = { fg = c.ui.fg },
    gitcommitComment = { fg = c.palette.subtle, bg = c.ui.bg, italic = styles.italic },
    gitcommitOnBranch = { fg = c.palette.subtle, italic = styles.italic },
    gitcommitBranch = { fg = c.git.git_merge, bg = c.ui.bg, bold = styles.bold },
    gitcommitHeader = { fg = c.palette.subtle },
    gitcommitSelected = { fg = c.git.git_add },
    gitcommitDiscarded = { fg = c.palette.muted },
    gitcommitSelectedType = { fg = c.git.git_add },
    gitcommitDiscardedType = { fg = c.palette.muted },
    gitcommitUntrackedFile = { fg = c.git.git_ignore, italic = styles.italic },
    gitcommitSelectedFile = { fg = c.git.git_add, bold = styles.bold },
    gitcommitDiscardedFile = { fg = c.git.git_delete, italic = styles.italic },
    gitcommitOverflow = { fg = c.semantic.warn },
  }
end

return M

