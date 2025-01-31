local M = {}

local colors = require("sarnai.colors")
local highlights = require("sarnai.highlights")

-- apply the colorscheme
function M.apply(variant)
	local selected_colors = colors.get_colors(variant)
end

return M
