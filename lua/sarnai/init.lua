local M = {}

local config = require("sarnai.config")
local theme = require("sarnai.theme")

-- lazy.nvim compatibility
function M.setup(opts)
	config.setup(opts) -- Apply user options
	vim.defer_fn(function()
		M.load()
	end, 0)
end

-- Load function
function M.load()
	theme.apply(config.options.variant)
	vim.cmd("colorscheme sarnai")
end

return M
