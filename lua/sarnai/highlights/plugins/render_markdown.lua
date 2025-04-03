local util = require("sarnai.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local r = colors.rainbow

  local styles = opts.styles

  local titles = {}

  for i, color in ipairs(r) do
    titles["RenderMarkdownH" .. i .. "Bg"] = { bg = util.blend(color, p.base, 0.1) }
    titles["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = styles.bold }
  end

  return {
    RenderMarkdownBullet     = { fg = p.chatsalgan },
    RenderMarkdownCode       = { bg = util.darken(p.base, 0.2) },
    RenderMarkdownDash       = { fg = p.chatsalgan },
    RenderMarkdownTableHead  = { fg = p.anis },
    RenderMarkdownTableRow   = { fg = p.chatsalgan },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline",

    titles,
  }
end

return M
