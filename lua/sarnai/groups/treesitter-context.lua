local Util = require("sarnai.util")

local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@type sarnai.HighlightsFn
function M.get(c)
	-- stylua: ignore
	return {
		TreesitterContext = { bg = Util.blend_bg(c.text, 0.8) },
	}
end

return M
