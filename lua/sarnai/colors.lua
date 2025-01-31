local M = {}

M.palette = require("sarnai.palette")

function M.get_colors(variant)
	return M.palette[variant] or M.palette["shono"]
end

return M
