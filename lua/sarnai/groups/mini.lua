local M = {}

M.url = "https://github.com/echasnovski/mini.nvim"

---@type sarnai.HighlightsFn
function M.get(c)
	-- stylua: ignore
	return {
    -- mini.statusline:
		MiniStatuslineDevinfo     = { fg = c.text, bg = c.overlay },
		MiniStatuslineFileinfo    = { fg = c.text, bg = c.overlay },
		MiniStatuslineFilename    = { fg = c.text, bg = c.surface },
		MiniStatuslineInactive    = { fg = c.subtle, bg = c.base },
		MiniStatuslineModeCommand = { fg = c.base, bg = c.mus, bold = true },
		MiniStatuslineModeInsert  = { fg = c.base, bg = c.els, bold = true },
		MiniStatuslineModeNormal  = { fg = c.base, bg = c.sarnai, bold = true },
		MiniStatuslineModeOther   = { fg = c.base, bg = c.uvs, bold = true },
		MiniStatuslineModeReplace = { fg = c.base, bg = c.anis, bold = true },
		MiniStatuslineModeVisual  = { fg = c.base, bg = c.nuur, bold = true },

    -- mini.cursorword:
    MiniCursorword = { fg = c.base, bg = c.yargui, underline = false }, -- Words matching the one under cursor
    MiniCursorwordCurrent = { fg = c.base, bg = c.text, underline = false }, -- Current word under cursor (optional)

    -- mini.hipatterns:
    MiniHipatternsFixme = { fg = c.base, bg = c.chatsalgan }, -- TODO, FIXME
    MiniHipatternsHack = { fg = c.base, bg = c.yargui }, -- HACK
    MiniHipatternsNote = { fg = c.base, bg = c.mus }, -- NOTE
    MiniHipatternsDeprecated = { fg = c.base, bg = c.subtle }, -- DEPRECATED

    -- mini.jump2d:
    MiniJump2dSpot = { fg = c.base, bg = c.yargui }, -- All spots
    MiniJump2dSpotAhead = { fg = c.base, bg = c.yargui }, -- Spots ahead of cursor
    MiniJump2dSpotUnique = { fg = c.base, bg = c.chatsalgan }, -- Spot for unique labels

    -- mini.trailspace:
    MiniTrailspace = { fg = c.anis }, -- Trailing space highlighting

    -- mini.tabline:
    MiniTablineCurrent = { fg = c.base, bg = c.sarnai }, -- Current tab
    MiniTablineVisible = { fg = c.text, bg = c.surface }, -- Visible but not current tab
    MiniTablineHidden = { fg = c.subtle, bg = c.surface }, -- Hidden tab
    MiniTablineFill = { bg = c.base }, -- Empty tabline area
    MiniTablineModifiedCurrent = { fg = c.base, bg = c.yargui }, -- Modified current tab
    MiniTablineModifiedVisible = { fg = c.yargui, bg = c.base }, -- Modified visible tab
    MiniTablineModifiedHidden = { fg = c.text, bg = c.surface }, -- Modified hidden tab

    -- mini.indentscope:
    MiniIndentscopeSymbol = { fg = c.muted }, -- Thin vertical line marking scope
    MiniIndentscopePrefix = { fg = c.anis }, -- Prefix connecting vertical line and current line

  }
end

return M
