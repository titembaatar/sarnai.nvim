local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	local ret = {
		BlinkCmpDoc                 = { fg = c.text, bg = c.bg_float },
		BlinkCmpDocBorder           = { fg = c.border_highlight, bg = c.bg_float },
		BlinkCmpGhostText           = { fg = c.base },
		BlinkCmpKindCodeium         = { fg = c.mus, bg = c.none },
		BlinkCmpKindCopilot         = { fg = c.mus, bg = c.none },
		BlinkCmpKindDefault         = { fg = c.muted, bg = c.none },
		BlinkCmpKindSupermaven      = { fg = c.mus, bg = c.none },
		BlinkCmpKindTabNine         = { fg = c.mus, bg = c.none },
		BlinkCmpLabel               = { fg = c.text, bg = c.none },
		BlinkCmpLabelDeprecated     = { fg = c.subtle, bg = c.none, strikethrough = true },
		BlinkCmpLabelMatch          = { fg = c.els, bg = c.none },
		BlinkCmpMenu                = { fg = c.text, bg = c.bg_float },
		BlinkCmpMenuBorder          = { fg = c.border_highlight, bg = c.bg_float },
		BlinkCmpSignatureHelp       = { fg = c.text, bg = c.bg_float },
		BlinkCmpSignatureHelpBorder = { fg = c.border_highlight, bg = c.bg_float },
	}

	require("sarnai.groups.kinds").kinds(ret, "BlinkCmpKind%s")
	return ret
end

return M
