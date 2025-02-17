local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	return {
		LazyProgressDone = { bold = true, fg = c.sarnai },
		LazyProgressTodo = { bold = true, fg = c.subtle },
	}
end

return M
