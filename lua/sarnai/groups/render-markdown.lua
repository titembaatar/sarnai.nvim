local Util = require("sarnai.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	local ret = {
		RenderMarkdownBullet     = { fg = c.sarnai }, -- horizontal rule
		RenderMarkdownCode       = { bg = c.base },
		RenderMarkdownDash       = { fg = c.els },  -- horizontal rule
		RenderMarkdownTableHead  = { fg = c.anis },
		RenderMarkdownTableRow   = { fg = c.els },
		RenderMarkdownCodeInline = "@markup.raw.markdown_inline",
	}
	for i, color in ipairs(c.rainbow) do
		ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.2) }
		ret["RenderMarkdownH" .. i] = { fg = color, bold = true }
	end
	return ret
end

return M
