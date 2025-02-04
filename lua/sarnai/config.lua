local M = {}

---@class sarnai.Config
M.defaults = {
	style = "shono",       -- Default palette variant: "shono", "udesh", or "ogloo"
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

---@type sarnai.Config
M.options = nil

---@param options? sarnai.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? sarnai.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
