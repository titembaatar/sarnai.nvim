local config = require("sarnai.config")

local M = {}

---@param opts? sarnai.Config
function M.load(opts)
	opts = require("sarnai.config").extend(opts)
	return require("sarnai.colors").setup(opts)
end

M.setup = config.setup


return M
