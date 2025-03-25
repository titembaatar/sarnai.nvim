---@alias Highlights table<string, table>

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local highlights = {}

  -- Load base Neovim highlights
  highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.base").get(palette, config))

  -- Load LSP highlights
  highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.lsp").get(palette, config))

  -- Load Treesitter highlights
  highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.treesitter").get(palette, config))

  -- Load plugins highlights
  -- (Will be implemented later)
  -- local plugin_highlights = require("sarnai.highlights.plugins").get(palette, config)
  -- if plugin_highlights then
  --   highlights = vim.tbl_deep_extend("force", highlights, plugin_highlights)
  -- end

  -- Apply user's highlights overrides if provided
  if config.on_highlights and type(config.on_highlights) == "function" then
    config.on_highlights(highlights, palette)
  end

  return highlights
end

---@param highlights Highlights
function M.set(highlights)
  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  -- Make sure we have termguicolors enabled
  vim.o.termguicolors = true

  -- Define highlights
  for group, opts in pairs(highlights) do
    -- Process style table if it exists
    if opts.style then
      local style = opts.style
      opts.italic = style.italic or false
      opts.bold = style.bold or false
      opts.underline = style.underline or false
      opts.undercurl = style.undercurl or false
      opts.strikethrough = style.strikethrough or false
      opts.style = nil
    end

    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
