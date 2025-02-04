local config = require("sarnai.config")

local M = {}

---@param style? sarnai.Config
function M.load(style)
	local opts = require("sarnai.config").extend({ style = style })

	return require("sarnai.colors").setup(opts)
end

M.setup = config.setup

return M
