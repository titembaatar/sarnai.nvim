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

    ["@variable"] = { fg = syntax.variable, style = styles.variables },                              -- Various variable names
    ["@variable.builtin"] = { fg = p.sarnai, style = styles.variables },                             -- Built-in variables (self, this, etc.)
    ["@variable.parameter"] = { fg = p.yargui, style = styles.variables },                           -- Parameters of a function
    ["@variable.member"] = { fg = p.mus },                                                           -- Object & struct fields, members

    ["@string"] = { link = "String" },                                                               -- String literals
    ["@string.documentation"] = { fg = p.subtle },                                                   -- Documentation strings
    ["@string.regexp"] = { fg = p.yargui },                                                          -- Regular expressions
    ["@string.escape"] = { fg = p.nuur },                                                            -- Escape characters in strings
    ["@string.special"] = { link = "String" },                                                       -- Special strings (URLs, file paths, etc.)
    ["@string.special.symbol"] = { link = "Identifier" },                                            -- Special strings (URLs, file paths, etc.)
    ["@string.special.url"] = { fg = special.link },                                                 -- Special strings (URLs, file paths, etc.)
    ["@character"] = { link = "Character" },                                                         -- Character literals
    ["@character.special"] = { link = "Character" },                                                 -- Special characters (e.g. wildcards)
    ["@boolean"] = { link = "Boolean" },                                                             -- Boolean literals
    ["@number"] = { link = "Number" },                                                               -- Numeric literals
    ["@number.float"] = { link = "Float" },                                                          -- Floating-point number literals
    ["@float"] = { link = "Float" },                                                                 -- Floating-point number literals

    ["@type"] = { link = "Type" },                                                                   -- Type identifiers
    ["@type.builtin"] = { fg = p.mus, italic = styles.italic },                                      -- Built-in types
    -- ["@type.definition"] = {},
    ["@type.qualifier"] = { fg = p.yargui, italic = styles.italic },                                 -- Type qualifiers (e.g., const)
    ["@attribute"] = { fg = p.yargui, bold = styles.bold },                                          -- Attribute annotations
    ["@property"] = { fg = p.mus, italic = styles.italic },                                          -- Object properties and struct members

    ["@function"] = { link = "Function" },                                                           -- Function definitions
    ["@function.builtin"] = { fg = p.anis, italic = styles.italic },                                 -- Built-in functions
    ["@function.macro"] = { fg = p.chatsalgan, bold = styles.bold },                                 -- Macro defined functions (preprocessor)
    ["@function.call"] = { fg = syntax.variable },                                                   -- Function calls
    ["@function.method"] = { fg = p.nuur },                                                          -- Method definitions
    ["@function.method.call"] = { fg = p.nuur },                                                     -- Method calls
    ["@constructor"] = { fg = p.subtle },                                                            -- Constructor calls and definitions
    ["@operator"] = { link = "Operator" },                                                           -- Operators (+ - * / etc.)

    ["@keyword"] = { link = "Keyword" },                                                             -- Keywords
    ["@keyword.function"] = { fg = p.sarnai, style = styles.keywords },                              -- Keywords used to define a function
    ["@keyword.operator"] = { fg = p.subtle },                                                       -- Keyword operators (new, delete, instanceof, etc.)
    ["@keyword.import"] = { fg = p.nuur },                                                           -- Import keywords
    ["@keyword.storage"] = { fg = p.mus },                                                           -- Storage keywords (static, public, etc.)
    ["@keyword.repeat"] = { fg = p.nuur },                                                           -- Keywords for loops
    ["@keyword.return"] = { fg = p.nuur, italic = styles.italic },                                   -- Return keyword
    ["@keyword.debug"] = { fg = sem.error },                                                         -- Debugging statements
    ["@keyword.exception"] = { fg = sem.error },                                                     -- Exception handling keywords

    ["@punctuation.delimiter"] = { fg = p.subtle },                                                  -- Delimiters (;, ., etc.)
    ["@punctuation.bracket"] = { fg = p.subtle },                                                    -- Brackets ((), [], {}, etc.)
    ["@punctuation.special"] = { fg = p.subtle, bold = styles.bold },                                -- Special punctuation (e.g., interpolation braces in strings)

    ["@comment"] = { link = "Comment" },                                                             -- Regular comments
    ["@comment.documentation"] = { fg = p.subtle, style = styles.comments },                         -- Documentation comments
    ["@comment.error"] = { fg = sem.error, style = styles.comments },                                -- Error markers in comments
    ["@comment.warning"] = { fg = sem.warn, style = styles.comments },                               -- Warning markers in comments
    ["@comment.todo"] = { fg = special.todo, style = styles.comments },                              -- TODO markers in comments
    ["@comment.note"] = { fg = special.note, style = styles.comments },                              -- Note markers in comments

    ["@markup.heading"] = { fg = p.mus, bold = styles.bold },                                        -- Headings in markup (Markdown, etc.)
    ["@markup.strong"] = { bold = styles.bold },                                                     -- Bold text
    ["@markup.italic"] = { italic = styles.italic },                                                 -- Italic text
    ["@markup.underline"] = { underline = styles.underline },                                        -- Underlined text
    ["@markup.strikethrough"] = { strikethrough = true },                                            -- Strikethrough text
    ["@markup.link"] = { fg = special.link, underline = styles.underline },                          -- Links
    ["@markup.link.label"] = { fg = p.mus },                                                         -- Link labels
    ["@markup.link.url"] = { fg = special.link, underline = styles.underline },                      -- URLs
    ["@markup.link.url.markdown"] = { fg = special.link, underline = styles.underline },             -- URLs in links ([text](url))
    ["@markup.link.text.markdown"] = { fg = p.nuur },                                                -- Link text ([text](url))
    ["@markup.raw"] = { fg = p.els },                                                                -- Raw markup blocks (inline code, etc.)
    ["@markup.raw.block.markdown"] = { fg = p.els, bg = transparent_bg or util.darken(ui.bg, 0.1) }, -- Code blocks (```code```)
    ["@markup.raw.block.language"] = { fg = p.sarnai, bold = styles.bold },                          -- Language tag in code blocks (```python)
    ["@markup.list"] = { fg = p.nuur },                                                              -- List markers
    ["@markup.list.checked"] = { fg = p.mus },                                                       -- Checked list markers
    ["@markup.list.unchecked"] = { fg = syntax.variable },                                           -- Unchecked list markers
    ["@markup.list.checked.markdown"] = { fg = sem.ok },                                             -- Checked task items ([x])
    ["@markup.list.unchecked.markdown"] = { fg = p.subtle },                                         -- Unchecked task items ([ ])
    ["@markup.quote"] = { fg = syntax.variable, italic = styles.italic },                            -- Quotes
    ["@markup.quote.markdown"] = { fg = p.subtle, italic = styles.italic },                          -- Block quotes (> quote)
    ["@markup.math"] = { link = "Special" },                                                         -- Math environments
    ["@markup.environment"] = { link = "Macro" },                                                    -- Document environment blocks
    ["@markup.environment.frontmatter.markdown"] = { fg = p.mus },                                   -- Front matter block (---)

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
    ["@tag.attribute"] = { fg = p.yargui },                 -- HTML/XML tag attributes
    ["@tag.delimiter"] = { fg = p.subtle },                 -- Tag delimiters like < > /

    ["@diff.plus"] = { fg = git.git_add },                  -- Added lines
    ["@diff.minus"] = { fg = git.git_delete },              -- Deleted lines
    ["@diff.delta"] = { fg = git.git_change },              -- Changed lines

    ["@module"] = { fg = syntax.variable },                 -- Modules, imports, packages
    ["@namespace"] = { link = "Include" },                  -- Namespaces, packages

    ["@definition"] = { underline = styles.underline },     -- Definitions/implementations
    ["@scope"] = { fg = p.subtle },                         -- Scope blocks
    ["@reference"] = { fg = syntax.variable },              -- References to identifiers

    ["@error"] = { fg = sem.error },                        -- Syntax and parse errors
    ["@diagnostic"] = { undercurl = true, sp = sem.error }, -- Undercurl for diagnostics

    ["@conceal"] = { fg = p.muted },                        -- Conceal tokens

    -- LSsem tokens
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@function" },
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
  }
end

return M
