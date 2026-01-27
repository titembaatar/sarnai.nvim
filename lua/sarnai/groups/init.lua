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

			options.italic        = style.italic or false
			options.bold          = style.bold or false
			options.underline     = style.underline or false
			options.undercurl     = style.undercurl or false
			options.strikethrough = style.strikethrough or false
			options.style         = nil
		end

		if options.link and type(options.link) == "string" then
			vim.api.nvim_set_hl(0, group, { link = options.link })
		else
			vim.api.nvim_set_hl(0, group, options)
		end
	end
end

-- ---@param colors ColorPalette
-- ---@param opts SarnaiConfig
-- ---@return Groups
-- function M.get(colors, opts)
-- 	local groups = {}
--
-- 	for _, group_module in ipairs(M.groups) do
-- 		local ok, group = pcall(require, "sarnai.groups." .. group_module)
-- 		if ok and type(group.get) == "function" then
-- 			groups = vim.tbl_extend("force", groups, group.get(colors, opts))
-- 		end
-- 	end
--
-- 	if opts.on_highlights and type(opts.on_highlights) == "function" then
-- 		opts.on_highlights(groups, colors)
-- 	end
--
-- 	return groups
-- end
--
-- ---@param groups Groups
-- function M.set(groups)
-- 	for group, opts in pairs(groups) do
-- 		if opts.style and type(opts.style) == "table" then
-- 			local style = opts.style
--
-- 			opts.italic        = style.italic or false
-- 			opts.bold          = style.bold or false
-- 			opts.underline     = style.underline or false
-- 			opts.undercurl     = style.undercurl or false
-- 			opts.strikethrough = style.strikethrough or false
-- 			opts.style         = nil
-- 		end
--
-- 		if opts.link and type(opts.link) == "string" then
-- 			vim.api.nvim_set_hl(0, group, { link = opts.link })
-- 		else
-- 			vim.api.nvim_set_hl(0, group, opts)
-- 		end
-- 	end
-- end

return M
