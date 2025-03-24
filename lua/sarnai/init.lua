local config = require("sarnai.config")
local colors = require("sarnai.colors")
local util = require("sarnai.util")

local M = {}

function M.setup(opts)
  -- Store the options for later use
  M.options = vim.tbl_deep_extend("force", config.defaults, opts or {})
end

function M.load(opts)
  -- Load the colorscheme with given options
  opts = vim.tbl_deep_extend("force", M.options or config.defaults, opts or {})

  -- Get the color palette
  local palette = colors.get_colors(opts.style)

  -- Clear any existing highlights if not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  -- Set terminal colors if enabled
  vim.o.termguicolors = true
  if opts.terminal_colors ~= false then
    util.set_terminal_colors(palette)
  end

  vim.g.colors_name = "sarnai-" .. opts.style

  -- For now, just print that we loaded (we'll add highlight setup later)
  print("Sarnai theme loaded with style: " .. opts.style)

  return palette
end

return M
