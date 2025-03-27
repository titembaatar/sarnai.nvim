local util = require("sarnai.util")

local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local ui = colors.ui
  local sem = colors.semantic
  local special = colors.special

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    DiagnosticError = { fg = sem.error },                            -- Error diagnostics
    DiagnosticWarn = { fg = sem.warn },                              -- Warning diagnostics
    DiagnosticInfo = { fg = sem.info },                              -- Information diagnostics
    DiagnosticHint = { fg = sem.hint },                              -- Hint diagnostics
    DiagnosticOk = { fg = sem.ok },                                  -- Ok diagnostics

    DiagnosticUnderlineError = { undercurl = true, sp = sem.error }, -- Underline for errors
    DiagnosticUnderlineWarn = { undercurl = true, sp = sem.warn },   -- Underline for warnings
    DiagnosticUnderlineInfo = { undercurl = true, sp = sem.info },   -- Underline for info
    DiagnosticUnderlineHint = { undercurl = true, sp = sem.hint },   -- Underline for hints
    DiagnosticUnderlineOk = { undercurl = true, sp = sem.ok },       -- Underline for ok

    DiagnosticVirtualTextError = {
      fg = sem.error,
      bg = transparent_bg or sem.error_bg
    }, -- Virtual text for errors
    DiagnosticVirtualTextWarn = {
      fg = sem.warn,
      bg = transparent_bg or sem.warn_bg
    }, -- Virtual text for warnings
    DiagnosticVirtualTextInfo = {
      fg = sem.info,
      bg = transparent_bg or sem.info_bg
    }, -- Virtual text for info
    DiagnosticVirtualTextHint = {
      fg = sem.hint,
      bg = transparent_bg or sem.hint_bg
    }, -- Virtual text for hints
    DiagnosticVirtualTextOk = {
      fg = sem.ok,
      bg = transparent_bg or sem.ok_bg
    },                                                                                     -- Virtual text for ok

    DiagnosticFloatingError = { link = "DiagnosticError" },                                -- Diagnostic floating window error text
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },                                  -- Diagnostic floating window warning text
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },                                  -- Diagnostic floating window info text
    DiagnosticFloatingHint = { link = "DiagnosticHint" },                                  -- Diagnostic floating window hint text
    DiagnosticFloatingOk = { link = "DiagnosticOk" },                                      -- Diagnostic floating window ok text

    DiagnosticSignError = { link = "DiagnosticError" },                                    -- Diagnostic signs for errors
    DiagnosticSignWarn = { link = "DiagnosticWarn" },                                      -- Diagnostic signs for warnings
    DiagnosticSignInfo = { link = "DiagnosticInfo" },                                      -- Diagnostic signs for info
    DiagnosticSignHint = { link = "DiagnosticHint" },                                      -- Diagnostic signs for hints
    DiagnosticSignOk = { link = "DiagnosticOk" },                                          -- Diagnostic signs for ok

    DiagnosticDeprecated = { strikethrough = true },                                       -- Deprecated code
    DiagnosticUnnecessary = { fg = p.muted, bg = transparent_bg, italic = styles.italic }, -- Unused code

    LspReferenceText = { bg = p.surface },                                                 -- References
    LspReferenceRead = { link = "LspReferenceText" },                                      -- References in read mode
    LspReferenceWrite = { bg = util.blend(special.link, ui.bg, 0.2) },                     -- References in write mode

    LspCodeLens = { fg = p.muted },                                                        -- Virtual text for codelens
    LspCodeLensSeparator = { fg = p.muted },                                               -- Separator between codelens items

    LspInlayHint = { fg = p.muted, bg = transparent_bg or ui.bg, italic = styles.italic }, -- Inlay hints

    LspSignatureActiveParameter = {
      fg = sem.warn,
      bg = transparent_bg or sem.warn_bg
    },                                                                                       -- Active parameter in signature help

    NormalFloat = { fg = ui.fg, bg = transparent_bg or ui.bg_float },                        -- Normal text in floating windows
    FloatBorder = { fg = ui.border, bg = transparent_bg or ui.bg_float },                    -- Border of floating windows
    FloatTitle = { fg = ui.border, bg = transparent_bg or ui.bg_float, bold = styles.bold }, -- Title of floating windows

    LightBulb = { fg = sem.hint },                                                           -- Lightbulb icon for code actions
    LightBulbSign = { link = "LightBulb" },                                                  -- Lightbulb sign in the sign column
    LightBulbFloatWin = { link = "LightBulb" },                                              -- Lightbulb in floating windows

    LspRenameTitle = { fg = sem.hint, bold = styles.bold },                                  -- Title for rename popups
    LspRenameMatch = { bg = util.blend(sem.hint, ui.bg, 0.2) },                              -- Matching text in rename preview

    CmpItemAbbr = { fg = p.subtle },
    CmpItemAbbrDeprecated = { fg = p.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = ui.fg, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = ui.fg, bold = styles.bold },
    CmpItemKind = { fg = p.subtle },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
  }
end

return M
