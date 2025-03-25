local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil
  local styles = config.styles or {}

  return {
    -- Gitsigns
    GitSignsAdd = { fg = c.uvs },                 -- Line added
    GitSignsChange = { fg = c.els },              -- Line changed
    GitSignsDelete = { fg = c.anis },             -- Line deleted
    GitSignsChangedelete = { fg = c.chatsalgan }, -- Line changed and deleted
    GitSignsTopdelete = { fg = c.anis },          -- Top deleted
    GitSignsUntracked = { fg = c.muted },         -- Untracked lines

    -- Gitsigns blame
    GitSignsCurrentLineBlame = { fg = c.muted, style = { italic = styles.italic } },

    -- Git word diff
    GitSignsAddInline = { bg = util.blend(c.uvs, c.base, 0.3) },
    GitSignsChangeInline = { bg = util.blend(c.els, c.base, 0.3) },
    GitSignsDeleteInline = { bg = util.blend(c.anis, c.base, 0.3) },

    -- Git preview
    GitSignsAddPreview = { bg = util.blend(c.uvs, c.base, 0.2) },
    GitSignsDeletePreview = { bg = util.blend(c.anis, c.base, 0.2) },

    -- LazyGit
    LazyGitNormal = { fg = c.text, bg = transparent_bg or c.base },
    LazyGitBorder = { fg = c.sarnai, bg = transparent_bg or c.base },
    LazyGitBranch = { fg = c.yargui, bg = c.base, style = { bold = styles.bold } },
    LazyGitHeader = { fg = c.subtle, bg = transparent_bg or c.base },
    LazyGitFileName = { fg = c.text, style = { bold = styles.bold } },
    LazyGitCommit = { fg = c.yargui },
    LazyGitCommitAuthor = { fg = c.sarnai },
    LazyGitCommitDate = { fg = c.muted },
    LazyGitStatusAdded = { fg = c.uvs },
    LazyGitStatusModified = { fg = c.els },
    LazyGitStatusDeleted = { fg = c.anis },
    LazyGitStatusRenamed = { fg = c.nuur },
    LazyGitStatusUntracked = { fg = c.muted, style = { italic = styles.italic } },
    LazyGitInlineTitle = { fg = c.sarnai, style = { bold = styles.bold } },
    LazyGitDiffAdd = { link = "DiffAdd" },
    LazyGitDiffChange = { link = "DiffChange" },
    LazyGitDiffDelete = { link = "DiffDelete" },
    LazyGitDiffText = { link = "DiffText" },

    -- Git commit message
    gitcommitSummary = { fg = c.text },
    gitcommitComment = { fg = c.subtle, bg = c.base, style = { italic = styles.italic } },
    gitcommitOnBranch = { fg = c.subtle, style = { italic = styles.italic } },
    gitcommitBranch = { fg = c.yargui, bg = c.base, style = { bold = styles.bold } },
    gitcommitHeader = { fg = c.subtle },
    gitcommitSelected = { fg = c.uvs },
    gitcommitDiscarded = { fg = c.muted },
    gitcommitSelectedType = { fg = c.uvs },
    gitcommitDiscardedType = { fg = c.muted },
    gitcommitUntrackedFile = { fg = c.muted, style = { italic = styles.italic } },
    gitcommitSelectedFile = { fg = c.uvs, style = { bold = styles.bold } },
    gitcommitDiscardedFile = { fg = c.anis, style = { italic = styles.italic } },
    gitcommitOverflow = { fg = c.chatsalgan },
  }
end

return M
