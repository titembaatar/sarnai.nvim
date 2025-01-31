local M = {}

local config = require("sarnai.config")
local theme = require("sarnai.theme")
local highlights = require("sarnai.highlights")

function M.setup(opts)
	opts = opts or {}
	config.setup(opts)
	highlights.apply(config.options.variant, opts.highlight_groups)
	vim.cmd("colorscheme sarnai")
end

return M
