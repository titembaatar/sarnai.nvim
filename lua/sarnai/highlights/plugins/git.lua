local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil


  return {
    -- Gitsigns
    GitSignsAdd = { fg = groups.git_add },             -- Line added
    GitSignsChange = { fg = groups.git_change },       -- Line changed
    GitSignsDelete = { fg = groups.git_delete },       -- Line deleted
    GitSignsChangedelete = { fg = groups.git_change }, -- Line changed and deleted
    GitSignsTopdelete = { fg = groups.git_delete },    -- Top deleted
    GitSignsUntracked = { fg = groups.git_untracked }, -- Untracked lines

    -- Gitsigns blame
    GitSignsCurrentLineBlame = { fg = c.muted, italic = styles.italic },

    -- Git word diff
    GitSignsAddInline = { bg = util.blend(groups.git_add, c.base, 0.3) },
    GitSignsChangeInline = { bg = util.blend(groups.git_change, c.base, 0.3) },
    GitSignsDeleteInline = { bg = util.blend(groups.git_delete, c.base, 0.3) },

    -- Git preview
    GitSignsAddPreview = { bg = util.blend(groups.git_add, c.base, 0.2) },
    GitSignsDeletePreview = { bg = util.blend(groups.git_delete, c.base, 0.2) },

    -- LazyGit
    LazyGitNormal = { fg = c.text, bg = transparent_bg or c.base },
    LazyGitBorder = { fg = groups.border, bg = transparent_bg or c.base },
    LazyGitBranch = { fg = groups.git_branch or c.yargui, bg = c.base, bold = styles.bold },
    LazyGitHeader = { fg = c.subtle, bg = transparent_bg or c.base },
    LazyGitFileName = { fg = c.text, bold = styles.bold },
    LazyGitCommit = { fg = groups.git_branch or c.yargui },
    LazyGitCommitAuthor = { fg = groups.git_text or c.sarnai },
    LazyGitCommitDate = { fg = c.muted },
    LazyGitStatusAdded = { fg = groups.git_add },
    LazyGitStatusModified = { fg = groups.git_change },
    LazyGitStatusDeleted = { fg = groups.git_delete },
    LazyGitStatusRenamed = { fg = groups.git_rename },
    LazyGitStatusUntracked = { fg = groups.git_untracked, italic = styles.italic },
    LazyGitInlineTitle = { fg = groups.git_text or c.sarnai, bold = styles.bold },
    LazyGitDiffAdd = { link = "DiffAdd" },
    LazyGitDiffChange = { link = "DiffChange" },
    LazyGitDiffDelete = { link = "DiffDelete" },
    LazyGitDiffText = { link = "DiffText" },

    -- Git commit message
    gitcommitSummary = { fg = c.text },
    gitcommitComment = { fg = c.subtle, bg = c.base, italic = styles.italic },
    gitcommitOnBranch = { fg = c.subtle, italic = styles.italic },
    gitcommitBranch = { fg = groups.git_branch or c.yargui, bg = c.base, bold = styles.bold },
    gitcommitHeader = { fg = c.subtle },
    gitcommitSelected = { fg = groups.git_add },
    gitcommitDiscarded = { fg = c.muted },
    gitcommitSelectedType = { fg = groups.git_add },
    gitcommitDiscardedType = { fg = c.muted },
    gitcommitUntrackedFile = { fg = groups.git_untracked, italic = styles.italic },
    gitcommitSelectedFile = { fg = groups.git_add, bold = styles.bold },
    gitcommitDiscardedFile = { fg = groups.git_delete, italic = styles.italic },
    gitcommitOverflow = { fg = groups.warn },
  }
end

return M

