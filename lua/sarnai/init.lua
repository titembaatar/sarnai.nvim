local M = {}

function M.setup(opts)
  -- Store the options for later use
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

function M.load(opts)
  -- Load the colorscheme with given options
  opts = vim.tbl_deep_extend("force", M.options or M.defaults, opts or {})
  print("Sarnai theme loaded with style: " .. opts.style)
end

-- Default configuration
M.defaults = {
  style = "khavar"
}

return M
