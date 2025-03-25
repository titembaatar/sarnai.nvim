local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local transparent_bg = config.transparent and "NONE" or nil

  -- Extract styles from config
  local styles = config.styles or {}

  -- Common transparent background
  local bg_none = { bg = transparent_bg or c.none }

  local highlights = {
    Normal = { fg = c.text, bg = transparent_bg or c.base },             -- Normal text
    NormalNC = { fg = c.subtle, bg = transparent_bg or c.shadow },       -- Normal text in non-current windows
    NormalFloat = { fg = c.text, bg = transparent_bg or c.surface },     -- Normal text in floating windows

    LineNr = { fg = c.muted },                                           -- Line number for ":number" and ":#" commands
    CursorLineNr = { fg = c.sarnai },                                    -- Line number for the cursor line

    Cursor = { fg = c.base, bg = c.text },                               -- Character under the cursor
    CursorLine = { bg = transparent_bg or util.darken(c.surface, 0.5) }, -- Screen-line at the cursor
    CursorColumn = { link = "CursorLine" },                              -- Screen-column at the cursor

    StatusLine = { fg = c.bright, bg = c.surface },                      -- Status line of current window
    StatusLineNC = { fg = c.faded, bg = c.shadow },                      -- Status lines of not-current windows

    VertSplit = { fg = c.depth },                                        -- Column separating vertically split windows
    WinSeparator = { link = "VertSplit" },                               -- Separator between window splits (Neovim)

    Search = { fg = c.base, bg = c.sarnai },                             -- Last search pattern highlighting
    IncSearch = { fg = c.base, bg = c.sarnai },                          -- 'incsearch' highlighting

    Visual = { bg = c.overlay },                                         -- Visual mode selection
    VisualNOS = { link = "Visual" },                                     -- Visual mode selection when vim is "Not Owning the Selection"

    Folded = { fg = c.faded, bg = c.shadow },                            -- Line used for closed folds
    FoldColumn = { fg = c.muted },                                       -- Column where folds are displayed

    TabLine = { fg = c.faded, bg = c.shadow },                           -- Tab line
    TabLineFill = { bg = c.depth },                                      -- Tab line fill
    TabLineSel = { fg = c.bright, bg = c.surface },                      -- Active tab page label

    SignColumn = vim.tbl_extend("force", { fg = c.muted }, bg_none),     -- Column where signs are displayed

    Pmenu = { fg = c.text, bg = c.shadow },                              -- Popup menu normal item
    PmenuSel = { fg = c.bright, bg = c.overlay },                        -- Popup menu selected item
    PmenuSbar = { bg = c.depth },                                        -- Popup menu scrollbar
    PmenuThumb = { bg = c.muted },                                       -- Popup menu scrollbar thumb

    ErrorMsg = { fg = c.anis },                                          -- Error messages on the command line
    WarningMsg = { fg = c.chatsalgan },                                  -- Warning messages
    MoreMsg = { fg = c.uvs },                                            -- More-prompt
    Question = { fg = c.nuur },                                          -- "Hit-enter" prompt and yes/no questions

    DiffAdd = { bg = util.blend(c.uvs, c.base, 0.2) },                   -- Added line
    DiffChange = { bg = util.blend(c.els, c.base, 0.2) },                -- Changed line
    DiffDelete = { bg = util.blend(c.anis, c.base, 0.2) },               -- Deleted line
    DiffText = { bg = util.blend(c.els, c.base, 0.4) },                  -- Changed text within a changed line

    MatchParen = { fg = c.text, bg = util.lighten(c.overlay, 0.2) },     -- Matching parenthesis

    NonText = { fg = c.depth },                                          -- '@' at the end of the window and characters from 'showbreak'
    SpecialKey = { fg = c.muted },                                       -- Meta and special keys listed with ":map"
    Whitespace = { fg = c.shadow },                                      -- 'listchars' whitespace

    SpellBad = { sp = c.anis, undercurl = true },                        -- Word that is not recognized by the spellchecker
    SpellCap = { sp = c.els, undercurl = true },                         -- Word that should start with a capital
    SpellLocal = { sp = c.uvs, undercurl = true },                       -- Word that is recognized by the spellchecker as used in another region
    SpellRare = { sp = c.nuur, undercurl = true },                       -- Word that is recognized by the spellchecker as rarely used

    WinBar = { fg = c.bright },                                          -- Window bar of current window
    WinBarNC = { fg = c.faded },                                         -- Window bar of not-current windows

    Comment = { fg = c.muted, style = styles.comments },                 -- Comments

    Constant = { fg = c.nuur },                                          -- Any constant
    String = { fg = c.uvs },                                             -- String constants
    Character = { link = "String" },                                     -- Character constants
    Number = { fg = c.els },                                             -- Numeric constants
    Boolean = { fg = c.els },                                            -- Boolean constants
    Float = { link = "Number" },                                         -- Floating point constants

    Identifier = { fg = c.text, style = styles.variables },              -- Any variable name
    Function = { fg = c.nuur, style = styles.functions },                -- Function names

    Statement = { fg = c.yargui, style = styles.keywords },              -- Any statement
    Conditional = { link = "Statement" },                                -- if, then, else, switch, etc.
    Repeat = { link = "Statement" },                                     -- for, do, while, etc.
    Label = { link = "Statement" },                                      -- case, default, etc.
    Operator = { fg = c.sarnai },                                        -- "sizeof", "+", "*", etc.
    Keyword = { link = "Statement" },                                    -- any other keyword
    Exception = { link = "Statement" },                                  -- try, catch, throw

    PreProc = { fg = c.chatsalgan },                                     -- Generic Preprocessor
    Include = { link = "PreProc" },                                      -- Preprocessor #include
    Define = { link = "PreProc" },                                       -- Preprocessor #define
    Macro = { link = "PreProc" },                                        -- Same as Define
    PreCondit = { link = "PreProc" },                                    -- Preprocessor #if, #else, #endif, etc.

    Type = { fg = c.mus },                                               -- int, long, char, etc.
    StorageClass = { link = "Type" },                                    -- static, register, volatile, etc.
    Structure = { link = "Type" },                                       -- struct, union, enum, etc.
    Typedef = { link = "Type" },                                         -- A typedef

    Special = { fg = c.sarnai },                                         -- Any special symbol
    SpecialChar = { link = "Special" },                                  -- Special character in a constant
    Tag = { link = "Special" },                                          -- You can use CTRL-] on this
    Delimiter = { fg = c.subtle },                                       -- Character that needs attention
    SpecialComment = { fg = c.subtle, style = styles.comments },         -- Special things inside a comment
    Debug = { link = "Special" },                                        -- Debugging statements

    Underlined = { underline = true },                                   -- Text that stands out, HTML links

    Bold = { bold = true },
    Italic = { italic = true },

    -- Semantic Tokens
    ["@lsp.type.parameter"] = { link = "Identifier" },
    ["@lsp.type.property"] = { link = "Identifier" },
    ["@lsp.type.variable"] = { link = "Identifier" },
    ["@lsp.type.namespace"] = { link = "Type" },
    ["@lsp.type.enum"] = { link = "Type" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.class"] = { link = "Structure" },
    ["@lsp.type.interface"] = { link = "Structure" },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.keyword"] = { link = "Keyword" },
    ["@lsp.type.string"] = { link = "String" },
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.number"] = { link = "Number" },
  }

  return highlights
end

return M
