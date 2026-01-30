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
---@return Groups
function M.get(colors, opts)
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

	for _, o in pairs(groups) do
		if o.style and type(o) == "table" then
			local s = o.style
			o.italic        = (opts.styles.italic and s.italic) or false
			o.bold          = (opts.styles.bold and s.bold) or false
			o.underline     = (opts.styles.underline and s.underline) or false
			o.undercurl     = (opts.styles.undercurl and s.undercurl) or false
			o.strikethrough = (opts.styles.strikethrough and s.strikethrough) or false
			o.style         = nil
		end
	end

	return groups
end

---@param groups Groups
function M.setup(groups)
	for g, o in pairs(groups) do
		if o.link and type(o.link) == "string" then
			vim.api.nvim_set_hl(0, g, { link = o.link })
		else
			vim.api.nvim_set_hl(0, g, o)
		end
	end
end

return M
