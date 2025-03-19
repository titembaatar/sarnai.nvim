local M = {}

M.url = "https://github.com/nvim-lualine/lualine.nvim"

---@type sarnai.HighlightsFn
function M.get(c)
	-- stylua: ignore
	return {
			-- Normal mode
		lualine_a_normal = { bg = c.sarnai, fg = c.base },
		lualine_b_normal = { bg = c.surface, fg = c.subtle },
		lualine_c_normal = { bg = c.overlay, fg = c.text },
		lualine_x_normal = { bg = c.overlay, fg = c.text },
		lualine_y_normal = { bg = c.surface, fg = c.subtle },
		lualine_z_normal = { bg = c.sarnai, fg = c.base },

		-- Insert mode
		lualine_a_insert = { bg = c.els, fg = c.base },
		lualine_b_insert = { bg = c.surface, fg = c.subtle },
		lualine_c_insert = { bg = c.overlay, fg = c.text },
		lualine_x_insert = { bg = c.overlay, fg = c.text },
		lualine_y_insert = { bg = c.surface, fg = c.subtle },
		lualine_z_insert = { bg = c.els, fg = c.base },

		-- Visual mode
		lualine_a_visual = { bg = c.mus, fg = c.base },
		lualine_b_visual = { bg = c.surface, fg = c.subtle },
		lualine_c_visual = { bg = c.overlay, fg = c.text },
		lualine_x_visual = { bg = c.overlay, fg = c.text },
		lualine_y_visual = { bg = c.surface, fg = c.subtle },
		lualine_z_visual = { bg = c.mus, fg = c.base },

		-- Replace mode
		lualine_a_replace = { bg = c.anis, fg = c.base },
		lualine_b_replace = { bg = c.surface, fg = c.subtle },
		lualine_c_replace = { bg = c.overlay, fg = c.text },
		lualine_x_replace = { bg = c.overlay, fg = c.text },
		lualine_y_replace = { bg = c.surface, fg = c.subtle },
		lualine_z_replace = { bg = c.anis, fg = c.base },

		-- Command mode
		lualine_a_command = { bg = c.nuur, fg = c.text },
		lualine_b_command = { bg = c.surface, fg = c.subtle },
		lualine_c_command = { bg = c.overlay, fg = c.text },
		lualine_x_command = { bg = c.overlay, fg = c.text },
		lualine_y_command = { bg = c.surface, fg = c.subtle },
		lualine_z_command = { bg = c.nuur, fg = c.text },

		-- Inactive mode
		lualine_a_inactive = { bg = c.base, fg = c.muted },
		lualine_b_inactive = { bg = c.surface, fg = c.subtle },
		lualine_c_inactive = { bg = c.overlay, fg = c.text },
		lualine_x_inactive = { bg = c.overlay, fg = c.text },
		lualine_y_inactive = { bg = c.surface, fg = c.subtle },
		lualine_z_inactive = { bg = c.base, fg = c.muted },
  }
end

return M
