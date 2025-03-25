local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local styles = config.styles or {}
  local transparent_bg = config.transparent and "NONE" or nil


  return {
    DiagnosticError = { fg = groups.error },                            -- Error diagnostics
    DiagnosticWarn = { fg = groups.warn },                              -- Warning diagnostics
    DiagnosticInfo = { fg = groups.info },                              -- Information diagnostics
    DiagnosticHint = { fg = groups.hint },                              -- Hint diagnostics
    DiagnosticOk = { fg = groups.ok },                                  -- Ok diagnostics

    DiagnosticUnderlineError = { undercurl = true, sp = groups.error }, -- Underline for errors
    DiagnosticUnderlineWarn = { undercurl = true, sp = groups.warn },   -- Underline for warnings
    DiagnosticUnderlineInfo = { undercurl = true, sp = groups.info },   -- Underline for info
    DiagnosticUnderlineHint = { undercurl = true, sp = groups.hint },   -- Underline for hints
    DiagnosticUnderlineOk = { undercurl = true, sp = groups.ok },       -- Underline for ok

    DiagnosticVirtualTextError = {
      fg = groups.error,
      bg = transparent_bg or util.blend(groups.error, c.base, 0.15)
    },                                                                                              -- Virtual text for errors
    DiagnosticVirtualTextWarn = {
      fg = groups.warn,
      bg = transparent_bg or util.blend(groups.warn, c.base, 0.15)
    },                                                                                              -- Virtual text for warnings
    DiagnosticVirtualTextInfo = {
      fg = groups.info,
      bg = transparent_bg or util.blend(groups.info, c.base, 0.15)
    },                                                                                              -- Virtual text for info
    DiagnosticVirtualTextHint = {
      fg = groups.hint,
      bg = transparent_bg or util.blend(groups.hint, c.base, 0.15)
    },                                                                                              -- Virtual text for hints
    DiagnosticVirtualTextOk = {
      fg = groups.ok,
      bg = transparent_bg or util.blend(groups.ok, c.base, 0.15)
    },                                                                                              -- Virtual text for ok

    DiagnosticFloatingError = { link = "DiagnosticError" },                                         -- Diagnostic floating window error text
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },                                           -- Diagnostic floating window warning text
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },                                           -- Diagnostic floating window info text
    DiagnosticFloatingHint = { link = "DiagnosticHint" },                                           -- Diagnostic floating window hint text
    DiagnosticFloatingOk = { link = "DiagnosticOk" },                                               -- Diagnostic floating window ok text

    DiagnosticSignError = { link = "DiagnosticError" },                                             -- Diagnostic signs for errors
    DiagnosticSignWarn = { link = "DiagnosticWarn" },                                               -- Diagnostic signs for warnings
    DiagnosticSignInfo = { link = "DiagnosticInfo" },                                               -- Diagnostic signs for info
    DiagnosticSignHint = { link = "DiagnosticHint" },                                               -- Diagnostic signs for hints
    DiagnosticSignOk = { link = "DiagnosticOk" },                                                   -- Diagnostic signs for ok

    DiagnosticDeprecated = { strikethrough = true },                                                -- Deprecated code
    DiagnosticUnnecessary = { fg = c.muted, bg = transparent_bg, italic = styles.italic },          -- Unused code

    LspReferenceText = { bg = c.surface },                                                          -- References
    LspReferenceRead = { link = "LspReferenceText" },                                               -- References in read mode
    LspReferenceWrite = { bg = util.blend(groups.link, c.base, 0.2) },                              -- References in write mode

    LspCodeLens = { fg = c.muted },                                                                 -- Virtual text for codelens
    LspCodeLensSeparator = { fg = c.muted },                                                        -- Separator between codelens items

    LspInlayHint = { fg = c.muted, bg = transparent_bg or c.base, italic = styles.italic },         -- Inlay hints

    LspSignatureActiveParameter = {
      fg = groups.warn,
      bg = transparent_bg or util.blend(groups.warn, c.base, 0.15)
    },                                                                                             -- Active parameter in signature help

    NormalFloat = { fg = c.text, bg = transparent_bg or c.surface },                               -- Normal text in floating windows
    FloatBorder = { fg = groups.border, bg = transparent_bg or c.surface },                        -- Border of floating windows
    FloatTitle = { fg = groups.border, bg = transparent_bg or c.surface, bold = styles.bold },     -- Title of floating windows

    LightBulb = { fg = groups.hint },                                                              -- Lightbulb icon for code actions
    LightBulbSign = { link = "LightBulb" },                                                        -- Lightbulb sign in the sign column
    LightBulbFloatWin = { link = "LightBulb" },                                                    -- Lightbulb in floating windows

    LspRenameTitle = { fg = groups.hint, bold = styles.bold },                                     -- Title for rename popups
    LspRenameMatch = { bg = util.blend(groups.hint, c.base, 0.2) },                                -- Matching text in rename preview

    CmpItemAbbr = { fg = c.subtle },
    CmpItemAbbrDeprecated = { fg = c.subtle, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.text, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = c.text, bold = styles.bold },
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

