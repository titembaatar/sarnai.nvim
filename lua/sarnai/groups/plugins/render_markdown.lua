local M = {}

---@param palette table Style colors
function M.get(palette)
	return {
		RenderMarkdownBullet = { fg = palette.sarnai },
		RenderMarkdownChecked = { fg = palette.mus },
		RenderMarkdownCode = { bg = palette.overlay },
		RenderMarkdownCodeInline = { fg = palette.text, bg = palette.overlay },
		RenderMarkdownDash = { fg = palette.muted },
		RenderMarkdownH1Bg = { bg = palette.sarnai, blend = 20 },
		RenderMarkdownH2Bg = { bg = palette.mus, blend = 20 },
		RenderMarkdownH3Bg = { bg = palette.els, blend = 20 },
		RenderMarkdownH4Bg = { bg = palette.nuur, blend = 20 },
		RenderMarkdownH5Bg = { bg = palette.uvs, blend = 20 },
		RenderMarkdownH6Bg = { bg = palette.anis, blend = 20 },
		RenderMarkdownQuote = { fg = palette.subtle },
		RenderMarkdownTableFill = { link = "Conceal" },
		RenderMarkdownTableHead = { fg = palette.subtle },
		RenderMarkdownTableRow = { fg = palette.subtle },
		RenderMarkdownUnchecked = { fg = palette.subtle },
	}
end

return M
