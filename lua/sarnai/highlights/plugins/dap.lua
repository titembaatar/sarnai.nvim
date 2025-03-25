local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  return {
    -- DAP UI elements
    DapBreakpoint = { fg = c.anis, style = { bold = true } },                -- Breakpoint
    DapBreakpointCondition = { fg = c.chatsalgan, style = { bold = true } }, -- Conditional breakpoint
    DapLogPoint = { fg = c.nuur, style = { bold = true } },                  -- Log point
    DapStopped = { fg = c.uvs, bg = c.shadow, style = { bold = true } },     -- Current execution position
    DapBreakpointRejected = { fg = c.faded, style = { italic = true } },     -- Rejected breakpoint (cannot be set)

    -- DAP virtual text
    DapUIType = { fg = c.mus, style = { italic = true } },                                -- Type information
    DapUIVariable = { fg = c.bright },                                                    -- Variable name
    DapUIValue = { fg = c.els },                                                          -- Variable value
    DapUIModifiedValue = { fg = c.chatsalgan, bg = c.depth, style = { bold = true } },    -- Modified value
    DapUIDecoration = { fg = c.sarnai, style = { bold = true } },                         -- Decoration characters
    DapUIThread = { fg = c.uvs, style = { bold = true } },                                -- Thread
    DapUIStoppedThread = { fg = c.uvs, bg = c.shadow, style = { bold = true } },          -- Stopped thread
    DapUIFrameName = { fg = c.bright },                                                   -- Stack frame name
    DapUISource = { fg = c.nuur, style = { italic = true } },                             -- Source file
    DapUILineNumber = { fg = c.faded },                                                   -- Line number
    DapUIWatchesEmpty = { fg = c.faded, bg = c.depth, style = { italic = true } },        -- Empty watches
    DapUIWatchesValue = { fg = c.uvs, style = { bold = true } },                          -- Watch value
    DapUIWatchesError = { fg = c.anis, style = { italic = true } },                       -- Watch error
    DapUIScope = { fg = c.sarnai, bg = c.depth, style = { bold = true } },                -- Scope
    DapUIBreakpointsPath = { fg = c.nuur, style = { italic = true } },                    -- Breakpoints path
    DapUIBreakpointsInfo = { fg = c.faded },                                              -- Breakpoints info
    DapUIBreakpointsCurrentLine = { fg = c.uvs, bg = c.shadow, style = { bold = true } }, -- Current line with breakpoint
    DapUIBreakpointsDisabledLine = { fg = c.faded, style = { italic = true } },           -- Disabled breakpoint line
    DapUICurrentFrameName = { fg = c.uvs, bg = c.shadow, style = { bold = true } },       -- Current frame name
    DapUIStepOver = { fg = c.nuur, style = { bold = true } },                             -- Step over
    DapUIStepInto = { fg = c.uvs, style = { bold = true } },                              -- Step into
    DapUIStepBack = { fg = c.els, style = { bold = true } },                              -- Step back
    DapUIStepOut = { fg = c.yargui, style = { bold = true } },                            -- Step out
    DapUIStop = { fg = c.anis, style = { bold = true } },                                 -- Stop
    DapUIPlayPause = { fg = c.chatsalgan, style = { bold = true } },                      -- Play/pause
    DapUIRestart = { fg = c.uvs, style = { bold = true } },                               -- Restart
    DapUIUnavailable = { fg = c.faded, style = { italic = true } },                       -- Unavailable
    DapUIWinSelect = { fg = c.bright, bg = c.overlay, style = { bold = true } },          -- Window select
    DapUIEndSuccess = { fg = c.uvs, style = { bold = true } },                            -- Successful end
    DapUIFloatBorder = { fg = c.depth, bg = transparent_bg or c.shadow },                 -- Floating window border
    DapUIFloatNormal = { fg = c.bright, bg = transparent_bg or c.shadow },                -- Floating window normal text

    -- DAP virtual text
    DapVirtualText = { fg = c.sarnai, bg = util.blend(c.sarnai, c.depth, 0.2), style = { italic = true } },                -- Inline virtual text for DAP
    DapVirtualTextChanged = { fg = c.chatsalgan, bg = util.blend(c.chatsalgan, c.depth, 0.2), style = { italic = true } }, -- Changed values
    DapVirtualTextError = { fg = c.anis, bg = util.blend(c.anis, c.depth, 0.2), style = { italic = true } },               -- Error information

    -- REPL (Debug console)
    DapReplNormal = { fg = c.bright, bg = transparent_bg or c.shadow },

    -- Special DAP UI elements
    NvimDapVirtualText = { link = "DapVirtualText" },         -- For nvim-dap-virtual-text plugin
    DebugBreakpoint = { link = "DapBreakpoint" },             -- Generic breakpoint
    DebugHighlight = { bg = util.blend(c.uvs, c.base, 0.2) }, -- Current execution line highlight
  }
end

return M

