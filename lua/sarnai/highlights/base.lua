local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local c = palette

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  local highlights = {
    -- Core UI elements
    Normal = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg },
    NormalNC = { fg = c.palette.subtle, bg = transparent_bg or util.darken(c.ui.bg, 0.1) },
    NormalFloat = { fg = c.ui.fg, bg = transparent_bg or c.ui.bg_float },

    -- Line numbers
    LineNr = { fg = c.palette.muted },
    CursorLineNr = { fg = c.ui.accent },

    -- Cursor
    Cursor = { fg = c.ui.bg, bg = c.ui.fg },
    CursorLine = { bg = transparent_bg or util.lighten(c.ui.bg, 0.05) },
    CursorColumn = { link = "CursorLine" },

    -- Status line
    StatusLine = { fg = c.ui.fg, bg = c.ui.bg },
    StatusLineNC = { fg = c.palette.muted, bg = c.ui.bg },

    -- Window separators
    VertSplit = { fg = util.darken(c.ui.bg, 0.1) },
    WinSeparator = { link = "VertSplit" },

    -- Search highlighting
    Search = { fg = c.ui.bg, bg = util.blend(c.ui.accent, c.ui.bg, 0.2) },
    IncSearch = { fg = c.ui.bg, bg = c.ui.accent },

    -- Visual mode
    Visual = { bg = c.palette.overlay },
    VisualNOS = { link = "Visual" },

    -- Folding
    Folded = { fg = c.ui.fg, bg = c.none },
    FoldColumn = { fg = c.palette.muted },

    -- Tab line
    TabLine = { fg = c.palette.subtle, bg = c.palette.surface },
    TabLineFill = { bg = c.ui.bg },
    TabLineSel = { fg = c.ui.fg, bg = c.palette.overlay },

    SignColumn = { fg = c.ui.fg, bg = c.none },

    -- Popup menu
    Pmenu = { fg = c.palette.subtle, bg = c.ui.bg_float },
    PmenuSel = { fg = c.ui.fg, bg = c.ui.bg_popup },
    PmenuSbar = { bg = c.ui.bg_float },
    PmenuThumb = { bg = c.ui.bg_popup },

    -- Messages
    ErrorMsg = { fg = c.semantic.error },
    WarningMsg = { fg = c.semantic.warn },
    MoreMsg = { fg = c.semantic.ok },
    Question = { fg = c.semantic.info },

    -- Diff
    DiffAdd = { bg = util.blend(c.git.git_add, c.ui.bg, 0.2) },
    DiffChange = { bg = util.blend(c.git.git_change, c.ui.bg, 0.2) },
    DiffDelete = { bg = util.blend(c.git.git_delete, c.ui.bg, 0.2) },
    DiffText = { bg = util.blend(c.git.git_text, c.ui.bg, 0.4) },

    -- Matching parenthesis
    MatchParen = { fg = c.semantic.info, bg = util.blend(c.semantic.info, c.ui.bg, 0.2) },

    -- Special characters
    NonText = { fg = c.palette.muted },
    SpecialKey = { fg = c.palette.mus },

    -- Spell checking
    SpellBad = { sp = c.semantic.error, undercurl = true },
    SpellCap = { sp = c.semantic.warn, undercurl = true },
    SpellLocal = { sp = c.semantic.ok, undercurl = true },
    SpellRare = { sp = c.semantic.info, undercurl = true },

    -- Window bar
    WinBar = { fg = c.palette.subtle, bg = c.palette.surface },
    WinBarNC = { fg = c.palette.muted, bg = c.ui.bg },

    -- Syntax highlighting
    Comment = { fg = c.syntax.comment, style = styles.comments },

    Constant = { fg = c.syntax.constant },
    String = { fg = c.syntax.string },
    Character = { link = "String" },
    Number = { fg = c.syntax.constant },
    Boolean = { fg = c.syntax.boolean },
    Float = { link = "Number" },

    Identifier = { fg = c.syntax.variable, style = styles.variables },
    Function = { fg = c.syntax.functions, style = styles.functions },

    Statement = { fg = c.syntax.keyword, style = styles.keywords },
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Operator = { fg = c.syntax.operator },
    Keyword = { link = "Statement" },
    Exception = { link = "Statement" },

    PreProc = { fg = c.palette.yargui },
    Include = { link = "PreProc" },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },

    Type = { fg = c.syntax.type },
    StorageClass = { link = "Type" },
    Structure = { link = "Type" },
    Typedef = { link = "Type" },

    Special = { fg = c.special.special },
    SpecialChar = { link = "Special" },
    Tag = { link = "Special" },
    Delimiter = { fg = c.syntax.punctuation },
    SpecialComment = { fg = c.palette.yargui, style = styles.comments },
    Debug = { link = "Special" },

    Underlined = { underline = styles.underline },

    Bold = { bold = styles.bold },
    Italic = { italic = styles.italic },

    FloatBorder = { fg = c.ui.border },
    Title = { fg = c.ui.border, bold = styles.bold },
  }

  return highlights
end

return M

