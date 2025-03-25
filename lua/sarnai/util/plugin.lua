local M = {}

-- Check if lazy.nvim is available
---@return boolean
function M.has_lazy()
  return package.loaded["lazy"] ~= nil
end

-- Check if plugin is loaded using require
---@param name string The plugin name
---@return boolean
function M.is_plugin_loaded(name)
  local ok, _ = pcall(require, name:gsub("%.nvim$", ""):gsub("-", "."))
  return ok
end

-- Check if plugin is enabled based on config
---@param lazy_name string lazy.nvim plugin name
---@param module_name string internal module name
---@param config SarnaiConfig Theme configuration
---@return boolean
function M.is_plugin_enabled(lazy_name, module_name, config)
  local plugins = config.plugins or {}

  -- 1. If plugin is explicitly set in config, use that setting
  if plugins[module_name] ~= nil then
    return plugins[module_name]
  end

  -- 2. If auto detection is enabled and lazy.nvim is available
  if plugins.auto ~= false and M.has_lazy() then
    local loaded_plugins = {}
    for _, p in ipairs(require("lazy").plugins()) do
      loaded_plugins[p.name] = true
    end

    -- Check if plugin is loaded in lazy
    if loaded_plugins[lazy_name] then
      return true
    end

    -- Special case for mini.nvim
    if lazy_name == "mini.nvim" and vim.tbl_contains(vim.api.nvim_get_runtime_path(), "mini.nvim") then
      return true
    end
  end

  -- 3. When not using lazy.nvim, load all by default unless explicitly set to false
  if plugins.all ~= false and not M.has_lazy() then
    return true
  end

  -- 4. Fall back to checking if plugin is actually loaded
  return M.is_plugin_loaded(lazy_name)
end

return M

