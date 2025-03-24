local M = {}

-- Default configuration
M.defaults = {
  style = "khavar", -- The theme comes in 2 styles: "khavar" (dark) and "ovol" (light)
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
}

return M

