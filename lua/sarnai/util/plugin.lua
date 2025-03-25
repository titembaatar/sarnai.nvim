local M = {}

-- Check if lazy.nvim is available
---@return boolean
function M.has_lazy()
  return package.loaded["lazy"] ~= nil
end

-- Check if a plugin is installed via lazy.nvim (regardless of load state)
---@param plugin_name string The name or partial name of the plugin
---@return boolean
function M.has_plugin(plugin_name)
  -- If lazy isn't available, assume everything is available
  if not M.has_lazy() then
    return true
  end

  -- Get the lazy.nvim plugin specs
  local lazy_config = require("lazy.core.config")

  -- Check if the plugin exists in lazy's config
  for name, _ in pairs(lazy_config.specs) do
    if name == plugin_name or name:match(plugin_name) then
      return true
    end
  end

  return false
end

-- Dynamically load plugin highlights based on available files
---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.load_plugin_highlights(palette, config)
  local highlights = {}

  -- Path to plugin highlights directory
  local plugin_dir = "sarnai.highlights.plugins."

  -- If lazy isn't available, load all plugin highlights
  if not M.has_lazy() then
    -- Try loading every plugin highlight module except init
    for _, module_name in ipairs({
      "mini", "trouble", "which_key", "telescope", "git",
      "zen", "dap", "blink_cmp", "snacks"
    }) do
      local ok, plugin_hl = pcall(require, plugin_dir .. module_name)
      if ok and type(plugin_hl.get) == "function" then
        highlights = vim.tbl_deep_extend("force", highlights, plugin_hl.get(palette, config))
      end
    end
    return highlights
  end

  -- With lazy.nvim, we can be more selective
  -- Map plugin names to their highlight modules
  local plugin_map = {
    ["mini.nvim"] = "mini",
    ["trouble.nvim"] = "trouble",
    ["which-key.nvim"] = "which_key",
    ["telescope.nvim"] = "picker",
    ["fzf-lua"] = "picker", -- Both use the same highlight file
    ["gitsigns.nvim"] = "git",
    ["zen-mode.nvim"] = "zen",
    ["nvim-dap"] = "dap",
    ["blink.cmp"] = "blink_cmp",
    ["snacks.nvim"] = "snacks",
  }

  -- Check each known plugin mapping
  for plugin_name, module_name in pairs(plugin_map) do
    -- Check if the plugin is installed
    if M.has_plugin(plugin_name) then
      local ok, plugin_hl = pcall(require, plugin_dir .. module_name)
      if ok and type(plugin_hl.get) == "function" then
        highlights = vim.tbl_deep_extend("force", highlights, plugin_hl.get(palette, config))
      end
    end
  end

  return highlights
end

return M
