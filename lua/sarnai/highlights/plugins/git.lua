local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- Gitsigns
    GitSignsAdd = { fg = c.uvs },                 -- Line added
    GitSignsChange = { fg = c.els },              -- Line changed
    GitSignsDelete = { fg = c.anis },             -- Line deleted
    GitSignsChangedelete = { fg = c.chatsalgan }, -- Line changed and deleted
    GitSignsTopdelete = { fg = c.anis },          -- Top deleted
    GitSignsUntracked = { fg = c.muted },         -- Untracked lines

    -- Gitsigns blame
    GitSignsCurrentLineBlame = { fg = c.faded, bg = c.depth, style = { italic = true } },

    -- Git word diff
    GitSignsAddInline = { bg = util.blend(c.uvs, c.shadow, 0.3) },
    GitSignsChangeInline = { bg = util.blend(c.els, c.shadow, 0.3) },
    GitSignsDeleteInline = { bg = util.blend(c.anis, c.shadow, 0.3) },

    -- Git preview
    GitSignsAddPreview = { bg = util.blend(c.uvs, c.depth, 0.2) },
    GitSignsDeletePreview = { bg = util.blend(c.anis, c.depth, 0.2) },

    -- LazyGit
    LazyGitNormal = { fg = c.text, bg = transparent_bg or c.shadow },
    LazyGitBorder = { fg = c.depth, bg = transparent_bg or c.shadow },
    LazyGitBranch = { fg = c.yargui, bg = c.depth, style = { bold = true } },
    LazyGitHeader = { fg = c.subtle, bg = transparent_bg or c.depth },
    LazyGitFileName = { fg = c.bright, style = { bold = true } },
    LazyGitCommit = { fg = c.sarnai },
    LazyGitCommitAuthor = { fg = c.nuur },
    LazyGitCommitDate = { fg = c.muted },
    LazyGitStatusAdded = { fg = c.uvs },
    LazyGitStatusModified = { fg = c.els },
    LazyGitStatusDeleted = { fg = c.anis },
    LazyGitStatusRenamed = { fg = c.nuur },
    LazyGitStatusUntracked = { fg = c.muted, style = { italic = true } },
    LazyGitInlineTitle = { fg = c.sarnai, style = { bold = true } },
    LazyGitDiffAdd = { link = "DiffAdd" },
    LazyGitDiffChange = { link = "DiffChange" },
    LazyGitDiffDelete = { link = "DiffDelete" },
    LazyGitDiffText = { link = "DiffText" },

    -- Git commit message
    gitcommitSummary = { fg = c.bright },
    gitcommitComment = { fg = c.faded, bg = c.depth, style = { italic = true } },
    gitcommitOnBranch = { fg = c.subtle, style = { italic = true } },
    gitcommitBranch = { fg = c.yargui, bg = c.shadow, style = { bold = true } },
    gitcommitHeader = { fg = c.subtle },
    gitcommitSelected = { fg = c.uvs },
    gitcommitDiscarded = { fg = c.muted },
    gitcommitSelectedType = { fg = c.uvs },
    gitcommitDiscardedType = { fg = c.muted },
    gitcommitUntrackedFile = { fg = c.muted, style = { italic = true } },
    gitcommitSelectedFile = { fg = c.uvs, style = { bold = true } },
    gitcommitDiscardedFile = { fg = c.anis, style = { italic = true } },
    gitcommitOverflow = { fg = c.chatsalgan },
  }
end

return M
