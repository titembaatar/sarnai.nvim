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
    -- DAP UI elements
    DapBreakpoint = { fg = groups.error, bold = styles.bold },         -- Breakpoint
    DapBreakpointCondition = { fg = groups.warn, bold = styles.bold }, -- Conditional breakpoint
    DapLogPoint = { fg = groups.info, bold = styles.bold },            -- Log point
    DapStopped = { fg = groups.ok, bg = c.base, bold = styles.bold },  -- Current execution position
    DapBreakpointRejected = { fg = c.muted, italic = styles.italic },  -- Rejected breakpoint (cannot be set)

    -- DAP virtual text
    DapUIType = { fg = c.mus, italic = styles.italic },                                -- Type information
    DapUIVariable = { fg = c.text },                                                   -- Variable name
    DapUIValue = { fg = c.els },                                                       -- Variable value
    DapUIModifiedValue = { fg = groups.warn, bg = c.base, bold = styles.bold },        -- Modified value
    DapUIDecoration = { fg = groups.hint, bold = styles.bold },                        -- Decoration characters
    DapUIThread = { fg = groups.ok, bold = styles.bold },                              -- Thread
    DapUIStoppedThread = { fg = groups.ok, bg = c.base, bold = styles.bold },          -- Stopped thread
    DapUIFrameName = { fg = c.text },                                                  -- Stack frame name
    DapUISource = { fg = groups.info, italic = styles.italic },                        -- Source file
    DapUILineNumber = { fg = c.muted },                                                -- Line number
    DapUIWatchesEmpty = { fg = c.muted, bg = c.base, italic = styles.italic },         -- Empty watches
    DapUIWatchesValue = { fg = groups.ok, bold = styles.bold },                        -- Watch value
    DapUIWatchesError = { fg = groups.error, italic = styles.italic },                 -- Watch error
    DapUIScope = { fg = groups.hint, bg = c.base, bold = styles.bold },                -- Scope
    DapUIBreakpointsPath = { fg = groups.info, italic = styles.italic },               -- Breakpoints path
    DapUIBreakpointsInfo = { fg = c.muted },                                           -- Breakpoints info
    DapUIBreakpointsCurrentLine = { fg = groups.ok, bg = c.base, bold = styles.bold }, -- Current line with breakpoint
    DapUIBreakpointsDisabledLine = { fg = c.muted, italic = styles.italic },           -- Disabled breakpoint line
    DapUICurrentFrameName = { fg = groups.ok, bg = c.base, bold = styles.bold },       -- Current frame name
    DapUIStepOver = { fg = groups.info, bold = styles.bold },                          -- Step over
    DapUIStepInto = { fg = groups.ok, bold = styles.bold },                            -- Step into
    DapUIStepBack = { fg = c.els, bold = styles.bold },                                -- Step back
    DapUIStepOut = { fg = c.yargui, bold = styles.bold },                              -- Step out
    DapUIStop = { fg = groups.error, bold = styles.bold },                             -- Stop
    DapUIPlayPause = { fg = groups.warn, bold = styles.bold },                         -- Play/pause
    DapUIRestart = { fg = groups.ok, bold = styles.bold },                             -- Restart
    DapUIUnavailable = { fg = c.muted, italic = styles.italic },                       -- Unavailable
    DapUIWinSelect = { fg = c.text, bg = c.overlay, bold = styles.bold },              -- Window select
    DapUIEndSuccess = { fg = groups.ok, bold = styles.bold },                          -- Successful end
    DapUIFloatBorder = { fg = groups.border, bg = transparent_bg or c.base },          -- Floating window border
    DapUIFloatNormal = { fg = c.text, bg = transparent_bg or c.base },                 -- Floating window normal text

    -- DAP virtual text
    DapVirtualText = { fg = groups.hint, bg = util.blend(groups.hint, c.base, 0.2), italic = styles.italic },        -- Inline virtual text for DAP
    DapVirtualTextChanged = { fg = groups.warn, bg = util.blend(groups.warn, c.base, 0.2), italic = styles.italic }, -- Changed values
    DapVirtualTextError = { fg = groups.error, bg = util.blend(groups.error, c.base, 0.2), italic = styles.italic }, -- Error information

    -- REPL (Debug console)
    DapReplNormal = { fg = c.text, bg = transparent_bg or c.base },

    -- Special DAP UI elements
    NvimDapVirtualText = { link = "DapVirtualText" },             -- For nvim-dap-virtual-text plugin
    DebugBreakpoint = { link = "DapBreakpoint" },                 -- Generic breakpoint
    DebugHighlight = { bg = util.blend(groups.ok, c.base, 0.2) }, -- Current execution line highlight
  }
end

return M

