local M = {}

M.defaults = {
	style = "shono",       -- Default palette variant: "shono", "udesh", or "ogloo"
	light_style = "ogloo", -- Light variant
	transparent = false,   -- Whether to enable transparent background
	terminal_colors = true, -- Whether to enable terminal colors
	styles = {             -- New styles settings for highlights
		italic = true,
		bold = true,
		underline = true,
	},
	plugins = { -- Plugin-specific configuration
		enable = true,
		overrides = {},
	},
	overrides = {}, -- Highlight group overrides
}

-- This will hold the final merged options
M.options = vim.deepcopy(M.defaults)

-- Setup function: merge user-provided opts with defaults
function M.setup(options)
	if type(options) == "table" then
		M.options = vim.tbl_deep_extend("force", {}, M.defaults, options)
	end
	return M.options
end

-- Extend function: merge the current options with additional opts, if needed
function M.extend(opts)
	if type(opts) == "string" then
		opts = { style = opts }
	elseif type(opts) ~= "table" then
		opts = {}
	end

	return vim.tbl_deep_extend("force", {}, M.options, opts)
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
