local util = require("sarnai.util")
local M = {}

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(colors, opts)
  local p = colors.palette
  local git = colors.git
  local sem = colors.semantic
  local special = colors.special
  local syntax = colors.syntax
  local ui = colors.ui

  local styles = opts.styles or {}
  local transparent_bg = opts.transparent and "NONE" or nil

  return {
    -- Treesitter syntax groups
    -- See :h treesitter-highlight-groups

    ["@variable"] = { fg = syntax.variable, style = styles.variables },                                      -- Various variable names
    ["@variable.builtin"] = { fg = syntax.builtin, style = styles.variables },                               -- Built-in variables (self, this, etc.)
    ["@variable.parameter"] = { fg = syntax.parameter, style = styles.variables },                           -- Parameters of a function
    ["@variable.member"] = { fg = syntax.property },                                                         -- Object & struct fields, members

    ["@string"] = { link = "String" },                                                                       -- String literals
    ["@string.documentation"] = { fg = syntax.comment, italic = styles.italic },                             -- Documentation strings
    ["@string.regexp"] = { fg = syntax.regex },                                                              -- Regular expressions
    ["@string.escape"] = { fg = syntax.escape },                                                             -- Escape characters in strings
    ["@string.special"] = { fg = special.character },                                                        -- Special strings (URLs, file paths, etc.)
    ["@string.special.symbol"] = { fg = special.symbol },                                                    -- Special strings (URLs, file paths, etc.)
    ["@string.special.url"] = { fg = special.link, underline = styles.underline },                           -- Special strings (URLs, file paths, etc.)
    ["@character"] = { link = "Character" },                                                                 -- Character literals
    ["@character.special"] = { fg = special.character },                                                     -- Special characters (e.g. wildcards)
    ["@boolean"] = { link = "Boolean" },                                                                     -- Boolean literals
    ["@number"] = { link = "Number" },                                                                       -- Numeric literals
    ["@number.float"] = { link = "Float" },                                                                  -- Floating-point number literals
    ["@float"] = { link = "Float" },                                                                         -- Floating-point number literals

    ["@type"] = { link = "Type" },                                                                           -- Type identifiers
    ["@type.builtin"] = { fg = syntax.builtin, italic = styles.italic },                                     -- Built-in types
    ["@type.definition"] = { fg = syntax.type, bold = styles.bold },                                         -- Type definitions
    ["@type.qualifier"] = { fg = syntax.storage, italic = styles.italic },                                   -- Type qualifiers (e.g., const)
    ["@attribute"] = { fg = syntax.decorator, bold = styles.bold },                                          -- Attribute annotations
    ["@property"] = { fg = syntax.property, italic = styles.italic },                                        -- Object properties and struct members

    ["@function"] = { link = "Function" },                                                                   -- Function definitions
    ["@function.builtin"] = { fg = syntax.builtin, italic = styles.italic },                                 -- Built-in functions
    ["@function.macro"] = { fg = syntax.macro, bold = styles.bold },                                         -- Macro defined functions (preprocessor)
    ["@function.call"] = { fg = syntax._function },                                                          -- Function calls
    ["@function.method"] = { fg = syntax.method },                                                           -- Method definitions
    ["@function.method.call"] = { fg = syntax.method },                                                      -- Method calls
    ["@constructor"] = { fg = syntax.type, bold = styles.bold },                                             -- Constructor calls and definitions
    ["@operator"] = { link = "Operator" },                                                                   -- Operators (+ - * / etc.)

    ["@keyword"] = { link = "Keyword" },                                                                     -- Keywords
    ["@keyword.function"] = { fg = syntax.keyword, style = styles.keywords },                                -- Keywords used to define a function
    ["@keyword.operator"] = { fg = syntax.operator },                                                        -- Keyword operators (new, delete, instanceof, etc.)
    ["@keyword.import"] = { fg = syntax.import },                                                            -- Import keywords
    ["@keyword.storage"] = { fg = syntax.storage },                                                          -- Storage keywords (static, public, etc.)
    ["@keyword.repeat"] = { fg = syntax.control },                                                           -- Keywords for loops
    ["@keyword.return"] = { fg = syntax._return, italic = styles.italic },                                   -- Return keyword
    ["@keyword.debug"] = { fg = sem.error },                                                                 -- Debugging statements
    ["@keyword.exception"] = { fg = sem.error },                                                             -- Exception handling keywords
    ["@keyword.conditional"] = { fg = syntax.control },                                                      -- Conditional keywords (if, else, etc.)
    ["@keyword.directive"] = { fg = syntax.macro },                                                          -- Preprocessor directives

    ["@punctuation.delimiter"] = { fg = syntax.punctuation },                                                -- Delimiters (;, ., etc.)
    ["@punctuation.bracket"] = { fg = syntax.punctuation },                                                  -- Brackets ((), [], {}, etc.)
    ["@punctuation.special"] = { fg = syntax.punctuation, bold = styles.bold },                              -- Special punctuation (e.g., interpolation braces in strings)

    ["@comment"] = { link = "Comment" },                                                                     -- Regular comments
    ["@comment.documentation"] = { fg = syntax.comment, italic = styles.italic },                            -- Documentation comments
    ["@comment.error"] = { fg = sem.error, style = styles.comments },                                        -- Error markers in comments
    ["@comment.warning"] = { fg = sem.warn, style = styles.comments },                                       -- Warning markers in comments
    ["@comment.todo"] = { fg = special.todo, style = styles.comments },                                      -- TODO markers in comments
    ["@comment.note"] = { fg = special.note, style = styles.comments },                                      -- Note markers in comments

    ["@markup.heading"] = { fg = syntax.type, bold = styles.bold },                                          -- Headings in markup (Markdown, etc.)
    ["@markup.strong"] = { bold = styles.bold },                                                             -- Bold text
    ["@markup.italic"] = { italic = styles.italic },                                                         -- Italic text
    ["@markup.underline"] = { underline = styles.underline },                                                -- Underlined text
    ["@markup.strikethrough"] = { strikethrough = true },                                                    -- Strikethrough text
    ["@markup.link"] = { fg = special.link, underline = styles.underline },                                  -- Links
    ["@markup.link.label"] = { fg = syntax.variable },                                                       -- Link labels
    ["@markup.link.url"] = { fg = special.link, underline = styles.underline },                              -- URLs
    ["@markup.link.url.markdown"] = { fg = special.link, underline = styles.underline },                     -- URLs in links ([text](url))
    ["@markup.link.text.markdown"] = { fg = syntax.string },                                                 -- Link text ([text](url))
    ["@markup.raw"] = { fg = syntax.string },                                                                -- Raw markup blocks (inline code, etc.)
    ["@markup.raw.block.markdown"] = { fg = syntax.string, bg = transparent_bg or util.darken(ui.bg, 0.1) }, -- Code blocks (```code```)
    ["@markup.raw.block.language"] = { fg = syntax.keyword, bold = styles.bold },                            -- Language tag in code blocks (```python)
    ["@markup.raw.markdown_inline"] = { bg = util.darken(p.base, 0.1), fg = p.nuur },
    ["@markup.list"] = { fg = syntax.keyword },                                                              -- List markers
    ["@markup.list.checked"] = { fg = sem.ok },                                                              -- Checked list markers
    ["@markup.list.unchecked"] = { fg = syntax.variable },                                                   -- Unchecked list markers
    ["@markup.list.checked.markdown"] = { fg = sem.ok },                                                     -- Checked task items ([x])
    ["@markup.list.unchecked.markdown"] = { fg = p.subtle },                                                 -- Unchecked task items ([ ])
    ["@markup.quote"] = { fg = syntax.variable, italic = styles.italic },                                    -- Quotes
    ["@markup.quote.markdown"] = { fg = syntax.comment, italic = styles.italic },                            -- Block quotes (> quote)
    ["@markup.math"] = { fg = special.special },                                                             -- Math environments
    ["@markup.environment"] = { fg = syntax.macro },                                                         -- Document environment blocks
    ["@markup.environment.frontmatter.markdown"] = { fg = syntax.type },                                     -- Front matter block (---)

    ["@markup.heading.1.markdown"] = { link = "markdownH1" },
    ["@markup.heading.2.markdown"] = { link = "markdownH2" },
    ["@markup.heading.3.markdown"] = { link = "markdownH3" },
    ["@markup.heading.4.markdown"] = { link = "markdownH4" },
    ["@markup.heading.5.markdown"] = { link = "markdownH5" },
    ["@markup.heading.6.markdown"] = { link = "markdownH6" },
    ["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
    ["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
    ["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
    ["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
    ["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
    ["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

    ["@tag"] = { link = "Tag" },                            -- Tags like HTML/XML tags
    ["@tag.attribute"] = { fg = syntax.property },          -- HTML/XML tag attributes
    ["@tag.delimiter"] = { fg = syntax.punctuation },       -- Tag delimiters like < > /

    ["@diff.plus"] = { fg = git.git_add },                  -- Added lines
    ["@diff.minus"] = { fg = git.git_delete },              -- Deleted lines
    ["@diff.delta"] = { fg = git.git_change },              -- Changed lines

    ["@module"] = { fg = syntax.import },                   -- Modules, imports, packages
    ["@namespace"] = { link = "Include" },                  -- Namespaces, packages

    ["@definition"] = { underline = styles.underline },     -- Definitions/implementations
    ["@scope"] = { fg = syntax.punctuation },               -- Scope blocks
    ["@reference"] = { fg = syntax.variable },              -- References to identifiers

    ["@error"] = { fg = sem.error },                        -- Syntax and parse errors
    ["@diagnostic"] = { undercurl = true, sp = sem.error }, -- Undercurl for diagnostics

    ["@conceal"] = { fg = p.muted },                        -- Conceal tokens

    -- LSP tokens - these should always link to the corresponding treesitter highlight groups
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- Additional LSP semantic tokens that may be used
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.constant"] = { link = "Constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.regexp"] = { link = "@string.regexp" },
    ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "@error" },
    ["@lsp.mod.controlFlow"] = { italic = styles.italic },
    ["@lsp.mod.mutable"] = { underline = styles.underline },
    ["@lsp.mod.callable"] = { bold = styles.bold },
  }
end

return M
