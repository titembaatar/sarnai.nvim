local M = {}

local util = require("sarnai.util")

-- Define plugin mapping table with proper type annotation
---@type table<string, string>
M.plugins = {
  ["blink.cmp"]            = "blink_cmp",
  ["fzf-lua"]              = "fzf_lua",
  ["gitsigns.nvim"]        = "git",
  ["mini.nvim"]            = "mini",
  ["nvim-dap"]             = "dap",
  ["render-markdown.nvim"] = "render_markdown",
  ["snacks.nvim"]          = "snacks",
  ["telescope.nvim"]       = "telescope",
  ["trouble.nvim"]         = "trouble",
  ["which-key.nvim"]       = "which_key",
}

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

    if util.is_plugin_enabled(lazy_name, module_name, config) then
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
