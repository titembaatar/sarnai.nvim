---@param opts sarnai.Config
return function(opts)
	local style = opts.light_style or "night"
	style = style == "ovol" and "khavar" or style

	local Util = require("sarnai.util")

	---@type Palette
	local colors = vim.deepcopy(Util.mod("sarnai.colors." .. style))

	---@type Palette

	Util.invert(colors)
	colors.base = "#dceae4"
	return colors
end
