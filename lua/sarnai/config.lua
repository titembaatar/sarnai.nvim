local M = {}

M.options = {
	variant = "shono", -- Default theme
}

-- Setup function to override options
function M.setup(opts)
	M.options = vim.tbl_extend("force", M.options, opts or {})
end

return M
