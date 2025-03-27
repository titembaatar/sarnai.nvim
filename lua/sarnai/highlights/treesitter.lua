local M = {}

---@param palette ColorPalette
---@param opts SarnaiConfig
---@return Highlights
function M.get(palette, opts)
  local p = palette

  local styles = opts.styles or {}

  return {
    -- Treesitter syntax groups
    -- See :h treesitter-highlight-groups

    ["@variable"] = { fg = p.syntax.variable, style = styles.variables },            -- Various variable names
    ["@variable.builtin"] = { fg = p.palette.sarnai, style = styles.variables },     -- Built-in variables (self, this, etc.)
    ["@variable.parameter"] = { fg = p.palette.yargui, style = styles.variables },   -- Parameters of a function
    ["@variable.member"] = { fg = p.palette.mus },                                   -- Object & struct fields, members

    ["@string"] = { link = "String" },                                               -- String literals
    ["@string.documentation"] = { fg = p.palette.subtle },                           -- Documentation strings
    ["@string.regexp"] = { fg = p.palette.yargui },                                  -- Regular expressions
    ["@string.escape"] = { fg = p.palette.nuur },                                    -- Escape characters in strings
    ["@string.special"] = { link = "String" },                                       -- Special strings (URLs, file paths, etc.)
    ["@string.special.symbol"] = { link = "Identifier" },                            -- Special strings (URLs, file paths, etc.)
    ["@string.special.url"] = { fg = p.special.link },                               -- Special strings (URLs, file paths, etc.)
    ["@character"] = { link = "Character" },                                         -- Character literals
    ["@character.special"] = { link = "Character" },                                 -- Special characters (e.g. wildcards)
    ["@boolean"] = { link = "Boolean" },                                             -- Boolean literals
    ["@number"] = { link = "Number" },                                               -- Numeric literals
    ["@number.float"] = { link = "Float" },                                          -- Floating-point number literals
    ["@float"] = { link = "Float" },                                                 -- Floating-point number literals

    ["@type"] = { link = "Type" },                                                   -- Type identifiers
    ["@type.builtin"] = { fg = p.palette.mus, italic = styles.italic },              -- Built-in types
    -- ["@type.definition"] = {},
    ["@type.qualifier"] = { fg = p.palette.yargui, italic = styles.italic },         -- Type qualifiers (e.g., const)
    ["@attribute"] = { fg = p.palette.yargui, bold = styles.bold },                  -- Attribute annotations
    ["@property"] = { fg = p.palette.mus, italic = styles.italic },                  -- Object properties and struct members

    ["@function"] = { link = "Function" },                                           -- Function definitions
    ["@function.builtin"] = { fg = p.palette.sarnai, italic = styles.italic },       -- Built-in functions
    ["@function.macro"] = { fg = p.palette.chatsalgan, bold = styles.bold },         -- Macro defined functions (preprocessor)
    ["@function.call"] = { fg = p.syntax.variable },                                 -- Function calls
    ["@function.method"] = { fg = p.palette.nuur },                                  -- Method definitions
    ["@function.method.call"] = { fg = p.palette.nuur },                             -- Method calls
    ["@constructor"] = { fg = p.palette.subtle },                                    -- Constructor calls and definitions
    ["@operator"] = { link = "Operator" },                                           -- Operators (+ - * / etc.)

    ["@keyword"] = { link = "Keyword" },                                             -- Keywords
    ["@keyword.function"] = { fg = p.palette.sarnai, style = styles.keywords },      -- Keywords used to define a function
    ["@keyword.operator"] = { fg = p.palette.subtle },                               -- Keyword operators (new, delete, instanceof, etc.)
    ["@keyword.import"] = { fg = p.palette.nuur },                                   -- Import keywords
    ["@keyword.storage"] = { fg = p.palette.mus },                                   -- Storage keywords (static, public, etc.)
    ["@keyword.repeat"] = { fg = p.palette.nuur },                                   -- Keywords for loops
    ["@keyword.return"] = { fg = p.palette.nuur, italic = styles.italic },           -- Return keyword
    ["@keyword.debug"] = { fg = p.semantic.error },                                  -- Debugging statements
    ["@keyword.exception"] = { fg = p.semantic.error },                              -- Exception handling keywords

    ["@punctuation.delimiter"] = { fg = p.palette.subtle },                          -- Delimiters (;, ., etc.)
    ["@punctuation.bracket"] = { fg = p.palette.subtle },                            -- Brackets ((), [], {}, etc.)
    ["@punctuation.special"] = { fg = p.palette.subtle, bold = styles.bold },        -- Special punctuation (e.g., interpolation braces in strings)

    ["@comment"] = { link = "Comment" },                                             -- Regular comments
    ["@comment.documentation"] = { fg = p.palette.subtle, style = styles.comments }, -- Documentation comments
    ["@comment.error"] = { fg = p.semantic.error, style = styles.comments },         -- Error markers in comments
    ["@comment.warning"] = { fg = p.semantic.warn, style = styles.comments },        -- Warning markers in comments
    ["@comment.todo"] = { fg = p.special.todo, style = styles.comments },            -- TODO markers in comments
    ["@comment.note"] = { fg = p.special.note, style = styles.comments },            -- Note markers in comments

    ["@markup.heading"] = { fg = p.palette.mus, bold = styles.bold },                -- Headings in markup (Markdown, etc.)
    ["@markup.strong"] = { bold = styles.bold },                                     -- Bold text
    ["@markup.italic"] = { italic = styles.italic },                                 -- Italic text
    ["@markup.underline"] = { underline = styles.underline },                        -- Underlined text
    ["@markup.strikethrough"] = { strikethrough = true },                            -- Strikethrough text
    ["@markup.link"] = { fg = p.special.link, underline = styles.underline },        -- Links
    ["@markup.link.label"] = { fg = p.palette.mus },                                 -- Link labels
    ["@markup.link.url"] = { fg = p.special.link, underline = styles.underline },    -- URLs
    ["@markup.raw"] = { fg = p.palette.els },                                        -- Raw markup blocks (inline code, etc.)
    ["@markup.list"] = { fg = p.palette.nuur },                                      -- List markers
    ["@markup.list.checked"] = { fg = p.palette.mus },                               -- Checked list markers
    ["@markup.list.unchecked"] = { fg = p.syntax.variable },                         -- Unchecked list markers
    ["@markup.quote"] = { fg = p.syntax.variable, italic = styles.italic },          -- Quotes
    ["@markup.math"] = { link = "Special" },                                         -- Math environments
    ["@markup.environment"] = { link = "Macro" },                                    -- Document environment blocks

    ["@tag"] = { link = "Tag" },                                                     -- Tags like HTML/XML tags
    ["@tag.attribute"] = { fg = p.palette.yargui },                                  -- HTML/XML tag attributes
    ["@tag.delimiter"] = { fg = p.palette.subtle },                                  -- Tag delimiters like < > /

    ["@diff.plus"] = { fg = p.git.git_add },                                         -- Added lines
    ["@diff.minus"] = { fg = p.git.git_delete },                                     -- Deleted lines
    ["@diff.delta"] = { fg = p.git.git_change },                                     -- Changed lines

    ["@module"] = { fg = p.syntax.variable },                                        -- Modules, imports, packages
    ["@namespace"] = { link = "Include" },                                           -- Namespaces, packages

    ["@definition"] = { underline = styles.underline },                              -- Definitions/implementations
    ["@scope"] = { fg = p.palette.subtle },                                          -- Scope blocks
    ["@reference"] = { fg = p.syntax.variable },                                     -- References to identifiers

    ["@error"] = { fg = p.semantic.error },                                          -- Syntax and parse errors
    ["@diagnostic"] = { undercurl = true, sp = p.semantic.error },                   -- Undercurl for diagnostics

    ["@conceal"] = { fg = p.palette.muted },                                         -- Conceal tokens

    -- LSP semantic tokens
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
