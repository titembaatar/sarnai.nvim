local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    DiagnosticError = { fg = p.semantic.error },                            -- Error diagnostics
    DiagnosticWarn = { fg = p.semantic.warn },                              -- Warning diagnostics
    DiagnosticInfo = { fg = p.semantic.info },                              -- Information diagnostics
    DiagnosticHint = { fg = p.semantic.hint },                              -- Hint diagnostics
    DiagnosticOk = { fg = p.semantic.ok },                                  -- Ok diagnostics

    DiagnosticUnderlineError = { undercurl = true, sp = p.semantic.error }, -- Underline for errors
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.semantic.warn },   -- Underline for warnings
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.semantic.info },   -- Underline for info
    DiagnosticUnderlineHint = { undercurl = true, sp = p.semantic.hint },   -- Underline for hints
    DiagnosticUnderlineOk = { undercurl = true, sp = p.semantic.ok },       -- Underline for ok

    DiagnosticVirtualTextError = {
      fg = p.semantic.error,
      bg = transparent_bg or p.semantic.error_bg
    }, -- Virtual text for errors
    DiagnosticVirtualTextWarn = {
      fg = p.semantic.warn,
      bg = transparent_bg or p.semantic.warn_bg
    }, -- Virtual text for warnings
    DiagnosticVirtualTextInfo = {
      fg = p.semantic.info,
      bg = transparent_bg or p.semantic.info_bg
    }, -- Virtual text for info
    DiagnosticVirtualTextHint = {
      fg = p.semantic.hint,
      bg = transparent_bg or p.semantic.hint_bg
    }, -- Virtual text for hints
    DiagnosticVirtualTextOk = {
      fg = p.semantic.ok,
      bg = transparent_bg or p.semantic.ok_bg
    },                                                                                               -- Virtual text for ok

    DiagnosticFloatingError = { link = "DiagnosticError" },                                          -- Diagnostic floating window error text
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },                                            -- Diagnostic floating window warning text
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },                                            -- Diagnostic floating window info text
    DiagnosticFloatingHint = { link = "DiagnosticHint" },                                            -- Diagnostic floating window hint text
    DiagnosticFloatingOk = { link = "DiagnosticOk" },                                                -- Diagnostic floating window ok text

    DiagnosticSignError = { link = "DiagnosticError" },                                              -- Diagnostic signs for errors
    DiagnosticSignWarn = { link = "DiagnosticWarn" },                                                -- Diagnostic signs for warnings
    DiagnosticSignInfo = { link = "DiagnosticInfo" },                                                -- Diagnostic signs for info
    DiagnosticSignHint = { link = "DiagnosticHint" },                                                -- Diagnostic signs for hints
    DiagnosticSignOk = { link = "DiagnosticOk" },                                                    -- Diagnostic signs for ok

    DiagnosticDeprecated = { strikethrough = true },                                                 -- Deprecated code
    DiagnosticUnnecessary = { fg = p.palette.muted, bg = transparent_bg, italic = styles.italic },   -- Unused code

    LspReferenceText = { bg = p.palette.surface },                                                   -- References
    LspReferenceRead = { link = "LspReferenceText" },                                                -- References in read mode
    LspReferenceWrite = { bg = util.blend(p.special.link, p.ui.bg, 0.2) },                           -- References in write mode

    LspCodeLens = { fg = p.palette.muted },                                                          -- Virtual text for codelens
    LspCodeLensSeparator = { fg = p.palette.muted },                                                 -- Separator between codelens items

    LspInlayHint = { fg = p.palette.muted, bg = transparent_bg or p.ui.bg, italic = styles.italic }, -- Inlay hints

    LspSignatureActiveParameter = {
      fg = p.semantic.warn,
      bg = transparent_bg or p.semantic.warn_bg
    },                                                                                           -- Active parameter in signature help

    NormalFloat = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_float },                        -- Normal text in floating windows
    FloatBorder = { fg = p.ui.border, bg = transparent_bg or p.ui.bg_float },                    -- Border of floating windows
    FloatTitle = { fg = p.ui.border, bg = transparent_bg or p.ui.bg_float, bold = styles.bold }, -- Title of floating windows

    LightBulb = { fg = p.semantic.hint },                                                        -- Lightbulb icon for code actions
    LightBulbSign = { link = "LightBulb" },                                                      -- Lightbulb sign in the sign column
    LightBulbFloatWin = { link = "LightBulb" },                                                  -- Lightbulb in floating windows

    LspRenameTitle = { fg = p.semantic.hint, bold = styles.bold },                               -- Title for rename popups
    LspRenameMatch = { bg = util.blend(p.semantic.hint, p.ui.bg, 0.2) },                         -- Matching text in rename preview

    CmpItemAbbr = { fg = p.palette.subtle },
    CmpItemAbbrDeprecated = { fg = p.palette.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.ui.fg, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = p.ui.fg, bold = styles.bold },
    CmpItemKind = { fg = p.palette.subtle },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
  }
end

return M
