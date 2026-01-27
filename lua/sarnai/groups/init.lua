---@alias Groups table<string, table>

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Groups
function M.get(palette, config)
	local groups = {}

	groups = vim.tbl_deep_extend("force", groups, require("sarnai.groups.base").get(palette, config))
	groups = vim.tbl_deep_extend("force", groups, require("sarnai.groups.lsp").get(palette, config))
	groups = vim.tbl_deep_extend("force", groups, require("sarnai.groups.treesitter").get(palette, config))
	groups = vim.tbl_deep_extend("force", groups, require("sarnai.groups.plugins").get(palette, config))

	if config.on_highlights and type(config.on_highlights) == "function" then
		config.on_highlights(groups, palette)
	end

	return groups
end

---@param groups Groups
function M.set(groups)
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true

	for group, opts in pairs(groups) do
		if type(opts) ~= "table" then
			vim.notify(
				"Invalid highlight options for group " .. group .. ": " .. tostring(opts),
				vim.log.levels.WARN
			)
			goto continue
		end

		if opts.style and type(opts.style) == "table" then
			local style = opts.style

			opts.italic        = style.italic or false
			opts.bold          = style.bold or false
			opts.underline     = style.underline or false
			opts.undercurl     = style.undercurl or false
			opts.strikethrough = style.strikethrough or false
			opts.style         = nil
		end

		if opts.link and type(opts.link) == "string" then
			vim.api.nvim_set_hl(0, group, { link = opts.link })
		else
			vim.api.nvim_set_hl(0, group, opts)
		end

		::continue::
	end
end

return M
