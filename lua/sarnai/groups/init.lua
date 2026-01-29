---@alias Groups table<string, table>

local M = {}

M.groups = {
	"base",
	"lsp",
	"treesitter",
	"plugins",
}

---@param colors ColorPalette
---@param opts SarnaiConfig
function M.setup(colors, opts)
	local groups = {}

	for _, group_module in ipairs(M.groups) do
		local ok, group = pcall(require, "sarnai.groups." .. group_module)
		if ok and type(group.get) == "function" then
			groups = vim.tbl_extend("force", groups, group.get(colors, opts))
		end
	end

	if opts.on_highlights and type(opts.on_highlights) == "function" then
		opts.on_highlights(groups, colors)
	end

	for group, options in pairs(groups) do
		if options.style and type(options.style) == "table" then
			local style = options.style

			options.italic        = (opts.styles.italic and style.italic) or false
			options.bold          = (opts.styles.bold and style.bold) or false
			options.underline     = (opts.styles.underline and style.underline) or false
			options.undercurl     = (opts.styles.undercurl and style.undercurl) or false
			options.strikethrough = (opts.styles.strikethough and style.strikethrough) or false
			options.style         = nil
		end

		if options.link and type(options.link) == "string" then
			vim.api.nvim_set_hl(0, group, { link = options.link })
		else
			vim.api.nvim_set_hl(0, group, options)
		end
	end
end

return M
