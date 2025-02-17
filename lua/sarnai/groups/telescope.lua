local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	return {
		TelescopeNormal         = { fg = c.text, bg = c.bg_float },
		TelescopeBorder         = { fg = c.border_highlight, bg = c.bg_float },
		TelescopePromptNormal   = { fg = c.text, bg = c.bg_float },
		TelescopePromptBorder   = { fg = c.sarnai, bg = c.bg_float },
		TelescopePromptTitle    = { fg = c.sarnai, bg = c.bg_float },
		TelescopeSelection      = { fg = c.text },
		TelescopeMatching       = { fg = c.sarnai, bold = true },
		TelescopeResultsComment = { fg = c.muted },
	}
end

return M
