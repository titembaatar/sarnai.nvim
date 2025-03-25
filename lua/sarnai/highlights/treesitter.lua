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

    ["@variable"] = { fg = c.text },                                                      -- Various variable names
    ["@variable.builtin"] = { fg = c.sarnai, style = { italic = true } },                 -- Built-in variables (self, this, etc.)
    ["@variable.parameter"] = { fg = c.subtle, style = styles.variables },                -- Parameters of a function
    ["@variable.member"] = { fg = c.bright },                                             -- Object & struct fields, members

    ["@string"] = { link = "String" },                                                    -- String literals
    ["@string.documentation"] = { fg = c.faded, bg = c.depth },                           -- Documentation strings
    ["@string.regexp"] = { fg = c.els, style = { bold = true } },                         -- Regular expressions
    ["@string.escape"] = { fg = c.sarnai, style = { bold = true } },                      -- Escape characters in strings
    ["@string.special"] = { fg = c.sarnai },                                              -- Special strings (URLs, file paths, etc.)
    ["@character"] = { link = "Character" },                                              -- Character literals
    ["@character.special"] = { fg = c.sarnai },                                           -- Special characters (e.g. wildcards)
    ["@boolean"] = { link = "Boolean" },                                                  -- Boolean literals
    ["@number"] = { link = "Number" },                                                    -- Numeric literals
    ["@number.float"] = { link = "Float" },                                               -- Floating-point number literals

    ["@type"] = { link = "Type" },                                                        -- Type identifiers
    ["@type.builtin"] = { fg = c.mus, style = { italic = true } },                        -- Built-in types
    ["@type.definition"] = { fg = c.mus, style = { bold = true } },                       -- Type definitions (e.g., typedef in C)
    ["@type.qualifier"] = { fg = c.yargui, style = { italic = true } },                   -- Type qualifiers (e.g., const)
    ["@attribute"] = { fg = c.yargui },                                                   -- Attribute annotations
    ["@property"] = { fg = c.text },                                                      -- Object properties and struct members

    ["@function"] = { link = "Function" },                                                -- Function definitions
    ["@function.builtin"] = { fg = c.nuur, style = { italic = true } },                   -- Built-in functions
    ["@function.macro"] = { fg = c.chatsalgan, style = { bold = true } },                 -- Macro defined functions (preprocessor)
    ["@function.call"] = { fg = c.bright },                                               -- Function calls
    ["@function.method"] = { fg = c.nuur },                                               -- Method definitions
    ["@function.method.call"] = { fg = c.nuur },                                          -- Method calls
    ["@constructor"] = { fg = c.mus },                                                    -- Constructor calls and definitions
    ["@operator"] = { link = "Operator" },                                                -- Operators (+ - * / etc.)

    ["@keyword"] = { link = "Keyword" },                                                  -- Keywords
    ["@keyword.function"] = { fg = c.yargui, style = styles.keywords },                   -- Keywords used to define a function
    ["@keyword.operator"] = { fg = c.sarnai },                                            -- Keyword operators (new, delete, instanceof, etc.)
    ["@keyword.import"] = { fg = c.yargui },                                              -- Import keywords
    ["@keyword.storage"] = { fg = c.yargui },                                             -- Storage keywords (static, public, etc.)
    ["@keyword.repeat"] = { fg = c.yargui },                                              -- Keywords for loops
    ["@keyword.return"] = { fg = c.yargui, style = { italic = true } },                   -- Return keyword
    ["@keyword.debug"] = { fg = c.anis },                                                 -- Debugging statements
    ["@keyword.exception"] = { fg = c.anis },                                             -- Exception handling keywords

    ["@punctuation.delimiter"] = { fg = c.faded },                                        -- Delimiters (;, ., etc.)
    ["@punctuation.bracket"] = { fg = c.subtle },                                         -- Brackets ((), [], {}, etc.)
    ["@punctuation.special"] = { fg = c.sarnai, style = { bold = true } },                -- Special punctuation (e.g., interpolation braces in strings)

    ["@comment"] = { link = "Comment" },                                                  -- Regular comments
    ["@comment.documentation"] = { fg = c.faded, bg = c.depth, style = styles.comments }, -- Documentation comments
    ["@comment.error"] = { fg = c.anis, bg = c.depth, style = styles.comments },          -- Error markers in comments
    ["@comment.warning"] = { fg = c.chatsalgan, bg = c.depth, style = styles.comments },  -- Warning markers in comments
    ["@comment.todo"] = { fg = c.sarnai, bg = c.depth, style = styles.comments },         -- TODO markers in comments
    ["@comment.note"] = { fg = c.nuur, bg = c.depth, style = styles.comments },           -- Note markers in comments

    ["@markup.heading"] = { fg = c.bright, bg = c.shadow, style = { bold = true } },      -- Headings in markup (Markdown, etc.)
    ["@markup.strong"] = { fg = c.bright, style = { bold = true } },                      -- Bold text
    ["@markup.italic"] = { fg = c.text, style = { italic = true } },                      -- Italic text
    ["@markup.underline"] = { style = { underline = true } },                             -- Underlined text
    ["@markup.strikethrough"] = { style = { strikethrough = true } },                     -- Strikethrough text
    ["@markup.link"] = { fg = c.nuur, style = { underline = true } },                     -- Links
    ["@markup.link.label"] = { fg = c.mus },                                              -- Link labels
    ["@markup.link.url"] = { fg = c.nuur, style = { underline = true } },                 -- URLs
    ["@markup.raw"] = { fg = c.uvs },                                                     -- Raw markup blocks (inline code, etc.)
    ["@markup.list"] = { fg = c.sarnai },                                                 -- List markers
    ["@markup.list.checked"] = { fg = c.uvs },                                            -- Checked list markers
    ["@markup.list.unchecked"] = { fg = c.muted },                                        -- Unchecked list markers
    ["@markup.quote"] = { fg = c.muted, style = { italic = true } },                      -- Quotes
    ["@markup.math"] = { fg = c.els },                                                    -- Math environments
    ["@markup.environment"] = { fg = c.chatsalgan },                                      -- Document environment blocks

    ["@tag"] = { fg = c.yargui, style = { bold = true } },                                -- Tags like HTML/XML tags
    ["@tag.attribute"] = { fg = c.nuur, style = { italic = true } },                      -- HTML/XML tag attributes
    ["@tag.delimiter"] = { fg = c.faded },                                                -- Tag delimiters like < > /

    ["@diff.plus"] = { fg = c.uvs },                                                      -- Added lines
    ["@diff.minus"] = { fg = c.anis },                                                    -- Deleted lines
    ["@diff.delta"] = { fg = c.els },                                                     -- Changed lines

    ["@module"] = { fg = c.mus },                                                         -- Modules, imports, packages
    ["@namespace"] = { fg = c.mus, style = { italic = true } },                           -- Namespaces, packages

    ["@definition"] = { underline = true },                                               -- Definitions/implementations
    ["@scope"] = { fg = c.subtle },                                                       -- Scope blocks
    ["@reference"] = { fg = c.text },                                                     -- References to identifiers

    ["@error"] = { fg = c.anis },                                                         -- Syntax and parse errors
    ["@diagnostic"] = { undercurl = true, sp = c.anis },                                  -- Undercurl for diagnostics

    ["@conceal"] = { fg = c.muted },                                                      -- Conceal tokens

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
