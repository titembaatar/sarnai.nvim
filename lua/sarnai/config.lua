local M = {}

M.options = {
	variant = "shono", -- Default theme

	styles = {
		bold = false,
		italic = false,
		underline = false,
	},

	background = {
		transparent = false,
		float = false, -- different background for floating windows
	},

	filetypes = { -- Improve highlighting
		lua = true,
		shell = true,
		markdown = true,
	},

	integrations = {
		treesitter = true,
		telescope = true,
		cmp = true,
		lsp = true,
		oil = true,
		mini = true,
	},
}

-- Setup function to override options
function M.setup(opts)
	M.options = vim.tbl_extend("force", M.options, opts or {})
end

return M
