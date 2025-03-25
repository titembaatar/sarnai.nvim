local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil
  local styles = config.styles or {}

  return {
    DiagnosticError = { fg = c.anis },                                                                                  -- Error diagnostics
    DiagnosticWarn = { fg = c.chatsalgan },                                                                             -- Warning diagnostics
    DiagnosticInfo = { fg = c.nuur },                                                                                   -- Information diagnostics
    DiagnosticHint = { fg = c.sarnai },                                                                                 -- Hint diagnostics
    DiagnosticOk = { fg = c.uvs },                                                                                      -- Ok diagnostics

    DiagnosticUnderlineError = { undercurl = true, sp = c.anis },                                                       -- Underline for errors
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.chatsalgan },                                                  -- Underline for warnings
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.nuur },                                                        -- Underline for info
    DiagnosticUnderlineHint = { undercurl = true, sp = c.sarnai },                                                      -- Underline for hints
    DiagnosticUnderlineOk = { undercurl = true, sp = c.uvs },                                                           -- Underline for ok

    DiagnosticVirtualTextError = { fg = c.anis, bg = transparent_bg or util.blend(c.anis, c.base, 0.15) },              -- Virtual text for errors
    DiagnosticVirtualTextWarn = { fg = c.chatsalgan, bg = transparent_bg or util.blend(c.chatsalgan, c.base, 0.15) },   -- Virtual text for warnings
    DiagnosticVirtualTextInfo = { fg = c.nuur, bg = transparent_bg or util.blend(c.nuur, c.base, 0.15) },               -- Virtual text for info
    DiagnosticVirtualTextHint = { fg = c.sarnai, bg = transparent_bg or util.blend(c.sarnai, c.base, 0.15) },           -- Virtual text for hints
    DiagnosticVirtualTextOk = { fg = c.uvs, bg = transparent_bg or util.blend(c.uvs, c.base, 0.15) },                   -- Virtual text for ok

    DiagnosticFloatingError = { fg = c.anis },                                                                          -- Diagnostic floating window error text
    DiagnosticFloatingWarn = { fg = c.chatsalgan },                                                                     -- Diagnostic floating window warning text
    DiagnosticFloatingInfo = { fg = c.nuur },                                                                           -- Diagnostic floating window info text
    DiagnosticFloatingHint = { fg = c.sarnai },                                                                         -- Diagnostic floating window hint text
    DiagnosticFloatingOk = { fg = c.uvs },                                                                              -- Diagnostic floating window ok text

    DiagnosticSignError = { fg = c.anis },                                                                              -- Diagnostic signs for errors
    DiagnosticSignWarn = { fg = c.chatsalgan },                                                                         -- Diagnostic signs for warnings
    DiagnosticSignInfo = { fg = c.nuur },                                                                               -- Diagnostic signs for info
    DiagnosticSignHint = { fg = c.sarnai },                                                                             -- Diagnostic signs for hints
    DiagnosticSignOk = { fg = c.uvs },                                                                                  -- Diagnostic signs for ok

    DiagnosticDeprecated = { strikethrough = true },                                                                    -- Deprecated code
    DiagnosticUnnecessary = { fg = c.muted, bg = transparent_bg, style = { italic = styles.italic } },                  -- Unused code

    LspReferenceText = { bg = c.surface },                                                                              -- References
    LspReferenceRead = { link = "LspReferenceText" },                                                                   -- References in read mode
    LspReferenceWrite = { bg = util.blend(c.sarnai, c.base, 0.2) },                                                     -- References in write mode

    LspCodeLens = { fg = c.muted },                                                                                     -- Virtual text for codelens
    LspCodeLensSeparator = { fg = c.muted },                                                                            -- Separator between codelens items

    LspInlayHint = { fg = c.muted, bg = transparent_bg or c.base, style = { italic = styles.italic } },                 -- Inlay hints

    LspSignatureActiveParameter = { fg = c.chatsalgan, bg = transparent_bg or util.blend(c.chatsalgan, c.base, 0.15) }, -- Active parameter in signature help

    NormalFloat = { fg = c.text, bg = transparent_bg or c.surface },                                                    -- Normal text in floating windows
    FloatBorder = { fg = c.muted, bg = transparent_bg or c.surface },                                                   -- Border of floating windows
    FloatTitle = { fg = c.sarnai, bg = transparent_bg or c.surface },                                                   -- Title of floating windows

    LightBulb = { fg = c.els },                                                                                         -- Lightbulb icon for code actions
    LightBulbSign = { link = "LightBulb" },                                                                             -- Lightbulb sign in the sign column
    LightBulbFloatWin = { link = "LightBulb" },                                                                         -- Lightbulb in floating windows

    LspRenameTitle = { fg = c.sarnai, style = { bold = styles.bold } },                                                 -- Title for rename popups
    LspRenameMatch = { bg = util.blend(c.sarnai, c.base, 0.2) },                                                        -- Matching text in rename preview

    CmpItemAbbr = { fg = c.subtle },
    CmpItemAbbrDeprecated = { fg = c.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.text, style = { bold = styles.bold } },
    CmpItemAbbrMatchFuzzy = { fg = palette.text, style = { bold = styles.bold } },
    CmpItemKind = { fg = c.subtle },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
  }
end

return M
