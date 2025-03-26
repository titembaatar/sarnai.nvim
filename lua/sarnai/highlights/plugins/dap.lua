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
    -- DAP UI elements
    DapBreakpoint = { fg = c.semantic.error, bold = styles.bold },         -- Breakpoint
    DapBreakpointCondition = { fg = c.semantic.warn, bold = styles.bold }, -- Conditional breakpoint
    DapLogPoint = { fg = c.semantic.info, bold = styles.bold },            -- Log point
    DapStopped = { fg = c.semantic.ok, bg = c.ui.bg, bold = styles.bold },  -- Current execution position
    DapBreakpointRejected = { fg = c.palette.muted, italic = styles.italic },  -- Rejected breakpoint (cannot be set)

    -- DAP virtual text
    DapUIType = { fg = c.palette.mus, italic = styles.italic },                                -- Type information
    DapUIVariable = { fg = c.ui.fg },                                                   -- Variable name
    DapUIValue = { fg = c.palette.els },                                                      -- Variable value
    DapUIModifiedValue = { fg = c.semantic.warn, bg = c.ui.bg, bold = styles.bold },        -- Modified value
    DapUIDecoration = { fg = c.semantic.hint, bold = styles.bold },                        -- Decoration characters
    DapUIThread = { fg = c.semantic.ok, bold = styles.bold },                              -- Thread
    DapUIStoppedThread = { fg = c.semantic.ok, bg = c.ui.bg, bold = styles.bold },          -- Stopped thread
    DapUIFrameName = { fg = c.ui.fg },                                                  -- Stack frame name
    DapUISource = { fg = c.semantic.info, italic = styles.italic },                        -- Source file
    DapUILineNumber = { fg = c.palette.muted },                                                -- Line number
    DapUIWatchesEmpty = { fg = c.palette.muted, bg = c.ui.bg, italic = styles.italic },         -- Empty watches
    DapUIWatchesValue = { fg = c.semantic.ok, bold = styles.bold },                        -- Watch value
    DapUIWatchesError = { fg = c.semantic.error, italic = styles.italic },                 -- Watch error
    DapUIScope = { fg = c.semantic.hint, bg = c.ui.bg, bold = styles.bold },                -- Scope
    DapUIBreakpointsPath = { fg = c.semantic.info, italic = styles.italic },               -- Breakpoints path
    DapUIBreakpointsInfo = { fg = c.palette.muted },                                           -- Breakpoints info
    DapUIBreakpointsCurrentLine = { fg = c.semantic.ok, bg = c.ui.bg, bold = styles.bold }, -- Current line with breakpoint
    DapUIBreakpointsDisabledLine = { fg = c.palette.muted, italic = styles.italic },           -- Disabled breakpoint line
    DapUICurrentFrameName = { fg = c.semantic.ok, bg = c.ui.bg, bold = styles.bold },       -- Current frame name
    DapUIStepOver = { fg = c.semantic.info, bold = styles.bold },                          -- Step over
    DapUIStepInto = { fg = c.semantic.ok, bold = styles.bold },                            -- Step into
    DapUIStepBack = { fg = c.palette.els, bold = styles.bold },                                -- Step back
    DapUIStepOut = { fg = c.palette.yargui, bold = styles.bold },                              -- Step out
    DapUIStop = { fg = c.semantic.error, bold = styles.bold },                             -- Stop
    DapUIPlayPause = { fg = c.semantic.warn, bold = styles.bold },                         -- Play/pause
    DapUIRestart = { fg = c.semantic.ok, bold = styles.bold },                             -- Restart
    DapUIUnavailable = { fg = c.palette.muted, italic = styles.italic },                       -- Unavailable
    DapUIWinSelect = { fg = c.ui.fg, bg = c.palette.overlay, bold = styles.bold },              -- Window select
    DapUIEndSuccess = { fg = c.semantic.ok, bold = styles.bold },                          -- Successful end
    DapUIFloatBorder = { fg = c.ui.border, bg = transparent_bg or c.ui.bg },          -- Floating window border
    DapUIFloatNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },                 -- Floating window normal text

    -- DAP virtual text
    DapVirtualText = { fg = c.semantic.hint, bg = util.blend(c.semantic.hint, c.ui.bg, 0.2), italic = styles.italic },        -- Inline virtual text for DAP
    DapVirtualTextChanged = { fg = c.semantic.warn, bg = util.blend(c.semantic.warn, c.ui.bg, 0.2), italic = styles.italic }, -- Changed values
    DapVirtualTextError = { fg = c.semantic.error, bg = util.blend(c.semantic.error, c.ui.bg, 0.2), italic = styles.italic }, -- Error information

    -- REPL (Debug console)
    DapReplNormal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },

    -- Special DAP UI elements
    NvimDapVirtualText = { link = "DapVirtualText" },             -- For nvim-dap-virtual-text plugin
    DebugBreakpoint = { link = "DapBreakpoint" },                 -- Generic breakpoint
    DebugHighlight = { bg = util.blend(c.semantic.ok, c.ui.bg, 0.2) }, -- Current execution line highlight
  }
end

return M

