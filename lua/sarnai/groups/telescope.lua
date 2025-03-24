local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	return {
		TelescopeNormal         = { fg = c.text, bg = c.bg_float },
		TelescopeBorder         = { fg = c.border_highlight, bg = c.bg_float },
		TelescopePromptPrefix   = { fg = c.text, bg = c.bg_float },
		TelescopeSelection      = { fg = c.text },
		TelescopeMatching       = { fg = c.sarnai, bold = true },
		TelescopePromptTitle    = { fg = c.sarnai, bg = c.bg_float },
		TelescopePreviewTitle    = { link = "TelescopePromptTitle" },
		TelescopeResultsTitle    = { link = "TelescopePromptTitle" },
	}
end

return M
