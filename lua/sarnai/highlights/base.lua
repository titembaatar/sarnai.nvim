local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  local highlights = {
    -- Core UI elements
    Normal = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg },
    NormalNC = { fg = p.palette.subtle, bg = transparent_bg or util.darken(p.ui.bg, 0.1) },
    NormalFloat = { fg = p.ui.fg, bg = transparent_bg or p.ui.bg_float },

    -- Line numbers
    LineNr = { fg = p.palette.muted },
    CursorLineNr = { fg = p.ui.accent },

    -- Cursor
    Cursor = { fg = p.ui.bg, bg = p.ui.fg },
    CursorLine = { bg = transparent_bg or util.lighten(p.ui.bg, 0.05) },
    CursorColumn = { link = "CursorLine" },

    -- Status line
    StatusLine = { fg = p.ui.fg, bg = p.ui.bg },
    StatusLineNC = { fg = p.palette.muted, bg = p.ui.bg },

    -- Window separators
    VertSplit = { fg = util.darken(p.ui.bg, 0.1) },
    WinSeparator = { link = "VertSplit" },

    -- Search highlighting
    Search = { fg = p.ui.bg, bg = util.blend(p.ui.accent, p.ui.bg, 0.2) },
    IncSearch = { fg = p.ui.bg, bg = p.ui.accent },

    -- Visual mode
    Visual = { bg = p.palette.overlay },
    VisualNOS = { link = "Visual" },

    -- Folding
    Folded = { fg = p.ui.fg, bg = p.none },
    FoldColumn = { fg = p.palette.muted },

    -- Tab line
    TabLine = { fg = p.palette.subtle, bg = p.palette.surface },
    TabLineFill = { bg = p.ui.bg },
    TabLineSel = { fg = p.ui.fg, bg = p.palette.overlay },

    SignColumn = { fg = p.ui.fg, bg = p.none },

    -- Popup menu
    Pmenu = { fg = p.palette.subtle, bg = p.ui.bg_float },
    PmenuSel = { fg = p.ui.fg, bg = p.ui.bg_popup },
    PmenuSbar = { bg = p.ui.bg_float },
    PmenuThumb = { bg = p.ui.bg_popup },

    -- Messages
    ErrorMsg = { fg = p.semantic.error },
    WarningMsg = { fg = p.semantic.warn },
    MoreMsg = { fg = p.semantic.ok },
    Question = { fg = p.semantic.info },

    -- Diff
    DiffAdd = { bg = util.blend(p.git.git_add, p.ui.bg, 0.2) },
    DiffChange = { bg = util.blend(p.git.git_change, p.ui.bg, 0.2) },
    DiffDelete = { bg = util.blend(p.git.git_delete, p.ui.bg, 0.2) },
    DiffText = { bg = util.blend(p.git.git_text, p.ui.bg, 0.4) },

    -- Matching parenthesis
    MatchParen = { fg = p.semantic.info, bg = util.blend(p.semantic.info, p.ui.bg, 0.2) },

    -- Special characters
    NonText = { fg = p.palette.muted },
    SpecialKey = { fg = p.palette.mus },

    -- Spell checking
    SpellBad = { sp = p.semantic.error, undercurl = true },
    SpellCap = { sp = p.semantic.warn, undercurl = true },
    SpellLocal = { sp = p.semantic.ok, undercurl = true },
    SpellRare = { sp = p.semantic.info, undercurl = true },

    -- Window bar
    WinBar = { fg = p.palette.subtle, bg = p.palette.surface },
    WinBarNC = { fg = p.palette.muted, bg = p.ui.bg },

    -- Syntax highlighting
    Comment = { fg = p.syntax.comment, style = styles.comments },

    Constant = { fg = p.syntax.constant },
    String = { fg = p.syntax.string },
    Character = { link = "String" },
    Number = { fg = p.syntax.constant },
    Boolean = { fg = p.syntax.boolean },
    Float = { link = "Number" },

    Identifier = { fg = p.syntax.variable, style = styles.variables },
    Function = { fg = p.syntax.functions, style = styles.functions },

    Statement = { fg = p.syntax.keyword, style = styles.keywords },
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Operator = { fg = p.syntax.operator },
    Keyword = { link = "Statement" },
    Exception = { link = "Statement" },

    PreProc = { fg = p.palette.yargui },
    Include = { link = "PreProc" },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },

    Type = { fg = p.syntax.type },
    StorageClass = { link = "Type" },
    Structure = { link = "Type" },
    Typedef = { link = "Type" },

    Special = { fg = p.special.special },
    SpecialChar = { link = "Special" },
    Tag = { link = "Special" },
    Delimiter = { fg = p.syntax.punctuation },
    SpecialComment = { fg = p.palette.yargui, style = styles.comments },
    Debug = { link = "Special" },

    Underlined = { underline = styles.underline },

    Bold = { bold = styles.bold },
    Italic = { italic = styles.italic },

    FloatBorder = { fg = p.ui.border },
    Title = { fg = p.ui.border, bold = styles.bold },
  }

  return highlights
end

return M
