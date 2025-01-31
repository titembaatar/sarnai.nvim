local M = {}

M.palette = require("sarnai.palette")

-- get colors based on theme name
function M.get_colors(variant)
	variant = variant or "shono" -- Default to "shono"
	return M.palette[variant] and M.palette[variant].colors or M.palette["shono"].colors
end

return M
