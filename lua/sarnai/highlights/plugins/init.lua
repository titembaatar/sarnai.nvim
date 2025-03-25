local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local highlights = {}

  -- Plugin detection (to avoid loading highlights for plugins that aren't installed)
  local plugins = {
    mini = vim.fn.exists("g:loaded_mini") == 1 or vim.fn.exists("g:mini_loaded") == 1 or
        vim.tbl_contains(vim.fn.getcompletion("Mini", "module"), "Mini"),
    trouble = pcall(require, "trouble") or vim.fn.exists("g:loaded_trouble") == 1,
    which_key = pcall(require, "which-key") or vim.fn.exists("g:loaded_which_key") == 1,
    telescope = pcall(require, "telescope") or vim.fn.exists("g:loaded_telescope") == 1,
    fzf_lua = pcall(require, "fzf-lua") or vim.fn.exists("g:loaded_fzf_lua") == 1,
    gitsigns = pcall(require, "gitsigns") or vim.fn.exists("g:loaded_gitsigns") == 1,
    zen_mode = pcall(require, "zen-mode") or vim.fn.exists("g:loaded_zen_mode") == 1,
    nvim_dap = pcall(require, "dap") or vim.fn.exists("g:loaded_dap") == 1,
    nvim_cmp = pcall(require, "cmp") or vim.fn.exists("g:loaded_cmp") == 1,
    snacks = pcall(require, "snacks") or vim.fn.exists("g:loaded_snacks") == 1,
  }

  -- Load mini.nvim highlights if detected
  if plugins.mini then
    highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.plugins.mini").get(palette, config))
  end

  -- Load trouble.nvim highlights if detected
  if plugins.trouble then
    highlights = vim.tbl_deep_extend("force", highlights,
      require("sarnai.highlights.plugins.trouble").get(palette, config))
  end

  -- Load which-key.nvim highlights if detected
  if plugins.which_key then
    highlights = vim.tbl_deep_extend("force", highlights,
      require("sarnai.highlights.plugins.which_key").get(palette, config))
  end

  -- Load telescope/fzf highlights if detected
  if plugins.telescope or plugins.fzf_lua then
    highlights = vim.tbl_deep_extend("force", highlights,
      require("sarnai.highlights.plugins.telescope").get(palette, config))
  end

  -- Load git highlights if detected
  if plugins.gitsigns then
    highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.plugins.git").get(palette, config))
  end

  -- Load zen-mode highlights if detected
  if plugins.zen_mode then
    highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.plugins.zen").get(palette, config))
  end

  -- Load dap highlights if detected
  if plugins.nvim_dap then
    highlights = vim.tbl_deep_extend("force", highlights, require("sarnai.highlights.plugins.dap").get(palette, config))
  end

  -- Load snacks highlights if detected
  if plugins.snacks then
    highlights = vim.tbl_deep_extend("force", highlights,
      require("sarnai.highlights.plugins.snacks").get(palette, config))
  end

  return highlights
end

return M
