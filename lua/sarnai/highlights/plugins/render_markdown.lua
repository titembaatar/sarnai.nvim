local color = require("sarnai.util.color")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@param colors ColorPalette
---@return Highlights
function M.get(colors)
	local p = colors.palette
	local r = colors.rainbow

	return {
		RenderMarkdownBullet     = { fg = p.chatsalgan },
		RenderMarkdownCode       = { bg = color.darken(p.base, 0.2) },
		RenderMarkdownDash       = { fg = p.chatsalgan },
		RenderMarkdownTableHead  = { fg = p.anis },
		RenderMarkdownTableRow   = { fg = p.chatsalgan },
		RenderMarkdownCodeInline = { link = "@markup.raw.markdown_inline" },
		RenderMarkdownH1Bg       = { bg = color.blend(r.h1, p.base, 0.1) },
		RenderMarkdownH1Fg       = { fg = r.h1, bold = true },
		RenderMarkdownH2Bg       = { bg = color.blend(r.h2, p.base, 0.1) },
		RenderMarkdownH2Fg       = { fg = r.h2, bold = true },
		RenderMarkdownH3Bg       = { bg = color.blend(r.h3, p.base, 0.1) },
		RenderMarkdownH3Fg       = { fg = r.h3, bold = true },
		RenderMarkdownH4Bg       = { bg = color.blend(r.h4, p.base, 0.1) },
		RenderMarkdownH4Fg       = { fg = r.h4, bold = true },
		RenderMarkdownH5Bg       = { bg = color.blend(r.h5, p.base, 0.1) },
		RenderMarkdownH5Fg       = { fg = r.h5, bold = true },
		RenderMarkdownH6Bg       = { bg = color.blend(r.h6, p.base, 0.1) },
		RenderMarkdownH6Fg       = { fg = r.h6, bold = true },
	}
end

return M
