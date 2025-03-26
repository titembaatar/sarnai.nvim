local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    DiagnosticError = { fg = c.semantic.error },                            -- Error diagnostics
    DiagnosticWarn = { fg = c.semantic.warn },                              -- Warning diagnostics
    DiagnosticInfo = { fg = c.semantic.info },                              -- Information diagnostics
    DiagnosticHint = { fg = c.semantic.hint },                              -- Hint diagnostics
    DiagnosticOk = { fg = c.semantic.ok },                                  -- Ok diagnostics

    DiagnosticUnderlineError = { undercurl = true, sp = c.semantic.error }, -- Underline for errors
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.semantic.warn },   -- Underline for warnings
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.semantic.info },   -- Underline for info
    DiagnosticUnderlineHint = { undercurl = true, sp = c.semantic.hint },   -- Underline for hints
    DiagnosticUnderlineOk = { undercurl = true, sp = c.semantic.ok },       -- Underline for ok

    DiagnosticVirtualTextError = {
      fg = c.semantic.error,
      bg = transparent_bg or c.semantic.error_bg
    },                                                                                           -- Virtual text for errors
    DiagnosticVirtualTextWarn = {
      fg = c.semantic.warn,
      bg = transparent_bg or c.semantic.warn_bg
    },                                                                                           -- Virtual text for warnings
    DiagnosticVirtualTextInfo = {
      fg = c.semantic.info,
      bg = transparent_bg or c.semantic.info_bg
    },                                                                                           -- Virtual text for info
    DiagnosticVirtualTextHint = {
      fg = c.semantic.hint,
      bg = transparent_bg or c.semantic.hint_bg
    },                                                                                           -- Virtual text for hints
    DiagnosticVirtualTextOk = {
      fg = c.semantic.ok,
      bg = transparent_bg or c.semantic.ok_bg
    },                                                                                           -- Virtual text for ok

    DiagnosticFloatingError = { link = "DiagnosticError" },                                      -- Diagnostic floating window error text
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },                                        -- Diagnostic floating window warning text
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },                                        -- Diagnostic floating window info text
    DiagnosticFloatingHint = { link = "DiagnosticHint" },                                        -- Diagnostic floating window hint text
    DiagnosticFloatingOk = { link = "DiagnosticOk" },                                            -- Diagnostic floating window ok text

    DiagnosticSignError = { link = "DiagnosticError" },                                          -- Diagnostic signs for errors
    DiagnosticSignWarn = { link = "DiagnosticWarn" },                                            -- Diagnostic signs for warnings
    DiagnosticSignInfo = { link = "DiagnosticInfo" },                                            -- Diagnostic signs for info
    DiagnosticSignHint = { link = "DiagnosticHint" },                                            -- Diagnostic signs for hints
    DiagnosticSignOk = { link = "DiagnosticOk" },                                                -- Diagnostic signs for ok

    DiagnosticDeprecated = { strikethrough = true },                                             -- Deprecated code
    DiagnosticUnnecessary = { fg = c.palette.muted, bg = transparent_bg, italic = styles.italic }, -- Unused code

    LspReferenceText = { bg = c.palette.surface },                                               -- References
    LspReferenceRead = { link = "LspReferenceText" },                                            -- References in read mode
    LspReferenceWrite = { bg = util.blend(c.special.link, c.ui.bg, 0.2) },                       -- References in write mode

    LspCodeLens = { fg = c.palette.muted },                                                      -- Virtual text for codelens
    LspCodeLensSeparator = { fg = c.palette.muted },                                             -- Separator between codelens items

    LspInlayHint = { fg = c.palette.muted, bg = transparent_bg or c.ui.bg, italic = styles.italic }, -- Inlay hints

    LspSignatureActiveParameter = {
      fg = c.semantic.warn,
      bg = transparent_bg or c.semantic.warn_bg
    },                                                                                           -- Active parameter in signature help

    NormalFloat = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },                        -- Normal text in floating windows
    FloatBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float },                    -- Border of floating windows
    FloatTitle = { fg = c.ui.border, bg = transparent_bg or c.ui.bg_float, bold = styles.bold }, -- Title of floating windows

    LightBulb = { fg = c.semantic.hint },                                                        -- Lightbulb icon for code actions
    LightBulbSign = { link = "LightBulb" },                                                      -- Lightbulb sign in the sign column
    LightBulbFloatWin = { link = "LightBulb" },                                                  -- Lightbulb in floating windows

    LspRenameTitle = { fg = c.semantic.hint, bold = styles.bold },                               -- Title for rename popups
    LspRenameMatch = { bg = util.blend(c.semantic.hint, c.ui.bg, 0.2) },                         -- Matching text in rename preview

    CmpItemAbbr = { fg = c.palette.subtle },
    CmpItemAbbrDeprecated = { fg = c.palette.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.ui.fg, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = c.ui.fg, bold = styles.bold },
    CmpItemKind = { fg = c.palette.subtle },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
  }
end

return M

