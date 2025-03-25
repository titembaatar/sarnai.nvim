---@type table<string, string>
local M = {}

-- stylua: ignore
---@type table<string, string>
M.plugins = {
  ["mini.nvim"]      = "mini",
  ["trouble.nvim"]   = "trouble",
  ["which-key.nvim"] = "which_key",
  ["telescope.nvim"] = "telescope",
  ["fzf-lua"]        = "telescope", -- Uses the same highlights as telescope
  ["gitsigns.nvim"]  = "git",
  ["zen-mode.nvim"]  = "zen_mode",
  ["nvim-dap"]       = "nvim_dap",
  ["blink.cmp"]      = "blink_cmp",
  ["snacks.nvim"]    = "snacks"
}

-- Check if plugin is loaded
---@param name string The plugin name
---@return boolean
local function is_plugin_loaded(name)
  local ok, _ = pcall(require, name:gsub("%.nvim$", ""):gsub("-", "."))
  return ok
end

-- Check if plugin is enabled based on config
---@param lazy_name string lazy.nvim plugin name
---@param module_name string internal module name
---@param config SarnaiConfig Theme configuration
---@return boolean
local function is_plugin_enabled(lazy_name, module_name, config)
  local plugins = config.plugins or {}

  -- 1. If plugin is explicitly set in config, use that setting
  if plugins[module_name] ~= nil then
    return plugins[module_name]
  end

  -- 2. If auto detection is enabled and lazy.nvim is available
  if plugins.auto ~= false and package.loaded.lazy then
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
  if plugins.all ~= false and package.loaded.lazy == nil then
    return true
  end

  -- 4. Fall back to checking if plugin is actually loaded
  return is_plugin_loaded(lazy_name)
end

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  ---@type Highlights
  local highlights = {}
  ---@type table<string, boolean>
  local loaded = {}

  -- Load highlights for each enabled plugin
  for lazy_name, module_name in pairs(M.plugins) do
    -- Skip if we already loaded this module's highlights
    if loaded[module_name] then goto continue end

    if is_plugin_enabled(lazy_name, module_name, config) then
      local success, plugin_highlights = pcall(
        require, "sarnai.highlights.plugins." .. module_name
      )

      if success and type(plugin_highlights.get) == "function" then
        highlights = vim.tbl_deep_extend(
          "force",
          highlights,
          plugin_highlights.get(palette, config)
        )
        loaded[module_name] = true
      end
    end

    ::continue::
  end

  return highlights
end

return M
