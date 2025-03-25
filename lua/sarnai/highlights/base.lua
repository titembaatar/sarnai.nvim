local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local c = palette
  local groups = util.get_groups(c.groups, c)

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  local highlights = {
    Normal = { fg = c.text, bg = transparent_bg or c.base },                       -- Normal text
    NormalNC = { fg = c.subtle, bg = transparent_bg or util.darken(c.base, 0.1) }, -- Normal text in non-current windows
    NormalFloat = { fg = c.text, bg = transparent_bg or c.surface },               -- Normal text in floating windows

    LineNr = { fg = c.muted },                                                     -- Line number for ":number" and ":#" commands
    CursorLineNr = { fg = groups.hint },                                           -- Line number for the cursor line

    Cursor = { fg = c.base, bg = c.text },                                         -- Character under the cursor
    CursorLine = { bg = transparent_bg or c.overlay },                             -- Screen-line at the cursor
    CursorColumn = { link = "CursorLine" },                                        -- Screen-column at the cursor

    StatusLine = { fg = c.text, bg = c.base },                                     -- Status line of current window
    StatusLineNC = { fg = c.muted, bg = c.base },                                  -- Status lines of not-current windows

    VertSplit = { fg = util.darken(c.base, 0.1) },                                 -- Column separating vertically split windows
    WinSeparator = { link = "VertSplit" },                                         -- Separator between window splits (Neovim)

    Search = { fg = c.base, bg = util.blend(groups.hint, c.base, 0.2) },           -- Last search pattern highlighting
    IncSearch = { fg = c.base, bg = groups.hint },                                 -- 'incsearch' highlighting

    Visual = { bg = c.overlay },                                                   -- Visual mode selection
    VisualNOS = { link = "Visual" },                                               -- Visual mode selection when vim is "Not Owning the Selection"

    Folded = { fg = c.text, bg = c.none },                                         -- Line used for closed folds
    FoldColumn = { fg = c.muted },                                                 -- Column where folds are displayed

    TabLine = { fg = c.subtle, bg = c.surface },                                   -- Tab line
    TabLineFill = { bg = c.base },                                                 -- Tab line fill
    TabLineSel = { fg = c.text, bg = c.overlay },                                  -- Active tab page label

    SignColumn = { fg = c.text, bg = c.none },

    Pmenu = { fg = c.subtle, bg = c.surface },                                    -- Popup menu normal item
    PmenuSel = { fg = c.text, bg = c.overlay },                                   -- Popup menu selected item
    PmenuSbar = { bg = c.surface },                                               -- Popup menu scrollbar
    PmenuThumb = { bg = c.overlay },                                              -- Popup menu scrollbar thumb

    ErrorMsg = { fg = groups.error },                                             -- Error messages on the command line
    WarningMsg = { fg = groups.warn },                                            -- Warning messages
    MoreMsg = { fg = groups.ok },                                                 -- More-prompt
    Question = { fg = groups.info },                                              -- "Hit-enter" prompt and yes/no questions

    DiffAdd = { bg = util.blend(groups.git_add, c.base, 0.2) },                   -- Added line
    DiffChange = { bg = util.blend(groups.git_change, c.base, 0.2) },             -- Changed line
    DiffDelete = { bg = util.blend(groups.git_delete, c.base, 0.2) },             -- Deleted line
    DiffText = { bg = util.blend(groups.git_text, c.base, 0.4) },                 -- Changed text within a changed line

    MatchParen = { fg = groups.info, bg = util.blend(groups.info, c.base, 0.2) }, -- Matching parenthesis

    NonText = { fg = c.muted },                                                   -- '@' at the end of the window and characters from 'showbreak'
    SpecialKey = { fg = c.mus },                                                  -- Meta and special keys listed with ":map"
    -- Whitespace = {},                                                           -- 'listchars' whitespace

    SpellBad = { sp = groups.error, undercurl = true },          -- Word that is not recognized by the spellchecker
    SpellCap = { sp = groups.warn, undercurl = true },           -- Word that should start with a capital
    SpellLocal = { sp = groups.ok, undercurl = true },           -- Word that is recognized by the spellchecker as used in another region
    SpellRare = { sp = groups.info, undercurl = true },          -- Word that is recognized by the spellchecker as rarely used

    WinBar = { fg = c.subtle, bg = c.surface },                  -- Window bar of current window
    WinBarNC = { fg = c.muted, bg = c.base },                    -- Window bar of not-current windows

    Comment = { fg = c.muted, style = styles.comments },         -- Comments

    Constant = { fg = c.els },                                   -- Any constant
    String = { fg = c.els },                                     -- String constants
    Character = { link = "String" },                             -- Character constants
    Number = { fg = c.els },                                     -- Numeric constants
    Boolean = { fg = groups.hint },                              -- Boolean constants
    Float = { link = "Number" },                                 -- Floating point constants

    Identifier = { fg = c.text, style = styles.variables },      -- Any variable name
    Function = { fg = groups.hint, style = styles.functions },   -- Function names

    Statement = { fg = groups.info, style = styles.keywords },   -- Any statement
    Conditional = { link = "Statement" },                        -- if, then, else, switch, etc.
    Repeat = { link = "Statement" },                             -- for, do, while, etc.
    Label = { link = "Statement" },                              -- case, default, etc.
    Operator = { fg = c.subtle },                                -- "sizeof", "+", "*", etc.
    Keyword = { link = "Statement" },                            -- any other keyword
    Exception = { link = "Statement" },                          -- try, catch, throw

    PreProc = { fg = c.yargui },                                 -- Generic Preprocessor
    Include = { link = "PreProc" },                              -- Preprocessor #include
    Define = { link = "PreProc" },                               -- Preprocessor #define
    Macro = { link = "PreProc" },                                -- Same as Define
    PreCondit = { link = "PreProc" },                            -- Preprocessor #if, #else, #endif, etc.

    Type = { fg = c.mus },                                       -- int, long, char, etc.
    StorageClass = { link = "Type" },                            -- static, register, volatile, etc.
    Structure = { link = "Type" },                               -- struct, union, enum, etc.
    Typedef = { link = "Type" },                                 -- A typedef

    Special = { fg = c.mus },                                    -- Any special symbol
    SpecialChar = { link = "Special" },                          -- Special character in a constant
    Tag = { link = "Special" },                                  -- You can use CTRL-] on this
    Delimiter = { fg = c.subtle },                               -- Character that needs attention
    SpecialComment = { fg = c.yargui, style = styles.comments }, -- Special things inside a comment
    Debug = { link = "Special" },                                -- Debugging statements

    Underlined = { underline = styles.underline },               -- Text that stands out, HTML links

    Bold = { bold = styles.bold },                               -- Bold text
    Italic = { italic = styles.italic },                         -- Italic text

    FloatBorder = { fg = groups.border },                        -- Border of floating windows
    Title = { fg = groups.border, bold = styles.bold },          -- Titles for output from ":set all", ":autocmd" etc.
  }

  return highlights
end

return M

