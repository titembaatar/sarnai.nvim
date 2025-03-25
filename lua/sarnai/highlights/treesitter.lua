local util = require("sarnai.util")

local M = {}

---@param palette ColorPalette
---@param config SarnaiConfig
---@return Highlights
function M.get(palette, config)
  local c = palette
  local styles = config.styles or {}

  return {
    -- Treesitter syntax groups
    -- See :h treesitter-highlight-groups

    ["@variable"] = { fg = c.text, style = styles.variables },                        -- Various variable names
    ["@variable.builtin"] = { fg = c.sarnai, style = styles.variables },              -- Built-in variables (self, this, etc.)
    ["@variable.parameter"] = { fg = c.yargui, style = styles.variables },            -- Parameters of a function
    ["@variable.member"] = { fg = c.mus },                                            -- Object & struct fields, members

    ["@string"] = { link = "String" },                                                -- String literals
    ["@string.documentation"] = { fg = c.subtle },                                    -- Documentation strings
    ["@string.regexp"] = { fg = c.yargui },                                           -- Regular expressions
    ["@string.escape"] = { fg = c.nuur },                                             -- Escape characters in strings
    ["@string.special"] = { link = "String" },                                        -- Special strings (URLs, file paths, etc.)
    ["@string.special.symbol"] = { link = "Identifier" },                             -- Special strings (URLs, file paths, etc.)
    ["@string.special.url"] = { fg = c.sarnai },                                      -- Special strings (URLs, file paths, etc.)
    ["@character"] = { link = "Character" },                                          -- Character literals
    ["@character.special"] = { link = "Character" },                                  -- Special characters (e.g. wildcards)
    ["@boolean"] = { link = "Boolean" },                                              -- Boolean literals
    ["@number"] = { link = "Number" },                                                -- Numeric literals
    ["@number.float"] = { link = "Float" },                                           -- Floating-point number literals
    ["@float"] = { link = "Float" },                                                  -- Floating-point number literals

    ["@type"] = { link = "Type" },                                                    -- Type identifiers
    ["@type.builtin"] = { fg = c.mus, style = { italic = styles.italic } },           -- Built-in types
    -- ["@type.definition"] = {},
    ["@type.qualifier"] = { fg = c.yargui, style = { italic = styles.italic } },      -- Type qualifiers (e.g., const)
    ["@attribute"] = { fg = c.yargui, style = { bold = styles.bold } },               -- Attribute annotations
    ["@property"] = { fg = c.mus, style = { italic = styles.italic } },               -- Object properties and struct members

    ["@function"] = { link = "Function" },                                            -- Function definitions
    ["@function.builtin"] = { fg = c.sarnai, style = { italic = styles.italic } },    -- Built-in functions
    ["@function.macro"] = { fg = c.chatsalgan, style = { bold = styles.bold } },      -- Macro defined functions (preprocessor)
    ["@function.call"] = { fg = c.text },                                             -- Function calls
    ["@function.method"] = { fg = c.nuur },                                           -- Method definitions
    ["@function.method.call"] = { fg = c.nuur },                                      -- Method calls
    ["@constructor"] = { fg = c.mus },                                                -- Constructor calls and definitions
    ["@operator"] = { link = "Operator" },                                            -- Operators (+ - * / etc.)

    ["@keyword"] = { link = "Keyword" },                                              -- Keywords
    ["@keyword.function"] = { fg = c.yargui, style = styles.keywords },               -- Keywords used to define a function
    ["@keyword.operator"] = { fg = c.subtle },                                        -- Keyword operators (new, delete, instanceof, etc.)
    ["@keyword.import"] = { fg = c.nuur },                                            -- Import keywords
    ["@keyword.storage"] = { fg = c.mus },                                            -- Storage keywords (static, public, etc.)
    ["@keyword.repeat"] = { fg = c.nuur },                                            -- Keywords for loops
    ["@keyword.return"] = { fg = c.nuur, style = { italic = styles.italic } },        -- Return keyword
    ["@keyword.debug"] = { fg = c.anis },                                             -- Debugging statements
    ["@keyword.exception"] = { fg = c.anis },                                         -- Exception handling keywords

    ["@punctuation.delimiter"] = { fg = c.subtle },                                   -- Delimiters (;, ., etc.)
    ["@punctuation.bracket"] = { fg = c.subtle },                                     -- Brackets ((), [], {}, etc.)
    ["@punctuation.special"] = { fg = c.subtle, style = { bold = styles.bold } },     -- Special punctuation (e.g., interpolation braces in strings)

    ["@comment"] = { link = "Comment" },                                              -- Regular comments
    ["@comment.documentation"] = { fg = c.subtle, style = styles.comments },          -- Documentation comments
    ["@comment.error"] = { fg = c.anis, style = styles.comments },                    -- Error markers in comments
    ["@comment.warning"] = { fg = c.chatsalgan, style = styles.comments },            -- Warning markers in comments
    ["@comment.todo"] = { fg = c.sarnai, style = styles.comments },                   -- TODO markers in comments
    ["@comment.note"] = { fg = c.nuur, style = styles.comments },                     -- Note markers in comments

    ["@markup.heading"] = { fg = c.mus, style = { bold = styles.bold } },             -- Headings in markup (Markdown, etc.)
    ["@markup.strong"] = { style = { bold = styles.bold } },                          -- Bold text
    ["@markup.italic"] = { style = { italic = styles.italic } },                      -- Italic text
    ["@markup.underline"] = { style = { underline = styles.underline } },             -- Underlined text
    ["@markup.strikethrough"] = { style = { strikethrough = true } },                 -- Strikethrough text
    ["@markup.link"] = { fg = c.nuur, style = { underline = styles.underline } },     -- Links
    ["@markup.link.label"] = { fg = c.mus },                                          -- Link labels
    ["@markup.link.url"] = { fg = c.nuur, style = { underline = styles.underline } }, -- URLs
    ["@markup.raw"] = { fg = c.els },                                                 -- Raw markup blocks (inline code, etc.)
    ["@markup.list"] = { fg = c.nuur },                                               -- List markers
    ["@markup.list.checked"] = { fg = c.mus },                                        -- Checked list markers
    ["@markup.list.unchecked"] = { fg = c.text },                                     -- Unchecked list markers
    ["@markup.quote"] = { fg = c.text, style = { italic = styles.italic } },          -- Quotes
    ["@markup.math"] = { link = "Special" },                                          -- Math environments
    ["@markup.environment"] = { link = "Macro" },                                     -- Document environment blocks

    ["@tag"] = { link = "Tag" },                                                      -- Tags like HTML/XML tags
    ["@tag.attribute"] = { fg = c.yargui },                                           -- HTML/XML tag attributes
    ["@tag.delimiter"] = { fg = c.subtle },                                           -- Tag delimiters like < > /

    ["@diff.plus"] = { fg = c.uvs },                                                  -- Added lines
    ["@diff.minus"] = { fg = c.anis },                                                -- Deleted lines
    ["@diff.delta"] = { fg = c.els },                                                 -- Changed lines

    ["@module"] = { fg = c.text },                                                    -- Modules, imports, packages
    ["@namespace"] = { link = "Include" },                                            -- Namespaces, packages

    ["@definition"] = { style = { underline = styles.underline } },                   -- Definitions/implementations
    ["@scope"] = { fg = c.subtle },                                                   -- Scope blocks
    ["@reference"] = { fg = c.text },                                                 -- References to identifiers

    ["@error"] = { fg = c.anis },                                                     -- Syntax and parse errors
    ["@diagnostic"] = { undercurl = true, sp = c.anis },                              -- Undercurl for diagnostics

    ["@conceal"] = { fg = c.muted },                                                  -- Conceal tokens

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
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },
  }
end

return M
