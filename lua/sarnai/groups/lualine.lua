local M = {}

M.url = "https://github.com/nvim-lualine/lualine.nvim"

---@type sarnai.HighlightsFn
function M.get(c)
	-- stylua: ignore
	return {
    normal = {
      a = {bg = c.sarnai, fg = c.base},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
    insert = {
      a = {bg = c.els, fg = c.base},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
    visual = {
      a = {bg = c.mus, fg = c.base},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
    replace = {
      a = {bg = c.anis, fg = c.base},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
    command = {
      a = {bg = c.nuur, fg = c.text},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
    inactive = {
      a = {bg = c.base, fg = c.muted},
      b = {bg = c.surface, fg = c.subtle},
      c = {bg = c.overlay, fg = c.text},
    },
	}
end

return M
