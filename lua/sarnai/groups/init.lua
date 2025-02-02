local M = {}

local modules = {
	core = "sarnai.groups.core",
	treesitter = "sarnai.groups.treesitter",
	lsp = "sarnai.groups.lsp",
	semantic = "sarnai.groups.semantic",
	-- Plugins
	blink = "sarnai.groups.plugins.blink",
	mini = "sarnai.groups.plugins.mini",
	oil = "sarnai.groups.plugins.oil",
	telescope = "sarnai.groups.plugins.telescope",
	which_key = "sarnai.groups.plugins.which-key",
	lazygit = "sarnai.groups.plugins.lazygit",
	gitsigns = "sarnai.groups.plugins.gitsigns",
}

local function apply_highlights(highlights)
	for group, opts in pairs(highlights) do
		local status, err = pcall(vim.api.nvim_set_hl, 0, group, opts)
	end
end

function M.setup(palette, opts)
	local final_highlights = {}

	-- Load and apply module highlights
	for key, module_path in pairs(modules) do
		local ok, mod = pcall(require, module_path)
		if ok and type(mod.get_highlights) == "function" then
			local status, highlights = pcall(mod.get_highlights, palette, opts)

			if status and type(highlights) == "table" then
				for group, hl_opts in pairs(highlights) do
					final_highlights[group] = hl_opts
				end
			end
		end
	end

	-- Apply all highlights
	apply_highlights(final_highlights)
	return final_highlights
end

return M
