---@class sarnai.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias sarnai.Highlights table<string,sarnai.Highlight|string>

---@alias sarnai.HighlightsFn fun(colors: ColorScheme, opts:sarnai.Config):sarnai.Highlights

---@class sarnai.Cache
---@field groups sarnai.Highlights
---@field inputs table
