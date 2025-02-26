local Util = require("sarnai.util")

local M = {}

---@type sarnai.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	local ret = {
		["@annotation"]                   = "PreProc",
		["@attribute"]                    = "PreProc",
		["@boolean"]                      = "Boolean",
		["@character"]                    = "Character",
		["@character.printf"]             = "SpecialChar",
		["@character.special"]            = "SpecialChar",
		["@comment"]                      = "Comment",
		["@comment.error"]                = { fg = c.error },
		["@comment.hint"]                 = { fg = c.hint },
		["@comment.info"]                 = { fg = c.info },
		["@comment.note"]                 = { fg = c.hint },
		["@comment.todo"]                 = { fg = c.todo },
		["@comment.warning"]              = { fg = c.warning },
		["@constant"]                     = "Constant",
		["@constant.builtin"]             = "Special",
		["@constant.macro"]               = "Define",
		["@constructor"]                  = { fg = c.mus }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		["@constructor.tsx"]              = { fg = c.mus },
		["@diff.delta"]                   = "DiffChange",
		["@diff.minus"]                   = "DiffDelete",
		["@diff.plus"]                    = "DiffAdd",
		["@function"]                     = "Function",
		["@function.builtin"]             = "Special",
		["@function.call"]                = "@function",
		["@function.macro"]               = "Macro",
		["@function.method"]              = "Function",
		["@function.method.call"]         = "@function.method",
		["@keyword"]                      = { fg = c.nuur, style = opts.styles.keywords }, -- For keywords that don't fall in previous categories.
		["@keyword.conditional"]          = "Conditional",
		["@keyword.coroutine"]            = "@keyword",
		["@keyword.debug"]                = "Debug",
		["@keyword.directive"]            = "PreProc",
		["@keyword.directive.define"]     = "Define",
		["@keyword.exception"]            = "Exception",
		["@keyword.function"]             = { fg = c.mus, style = opts.styles.functions }, -- For keywords used to define a function.
		["@keyword.import"]               = "Include",
		["@keyword.operator"]             = "@operator",
		["@keyword.repeat"]               = "Repeat",
		["@keyword.return"]               = "@keyword",
		["@keyword.storage"]              = "StorageClass",
		["@label"]                        = { fg = c.mus }, -- For labels: `label:` in C and `:label:` in Lua.
		["@markup"]                       = "@none",
		["@markup.emphasis"]              = { italic = true },
		["@markup.environment"]           = "Macro",
		["@markup.environment.name"]      = "Type",
		["@markup.heading"]               = "Title",
		["@markup.italic"]                = { italic = true },
		["@markup.link"]                  = { fg = c.els },
		["@markup.link.label"]            = "SpecialChar",
		["@markup.link.label.symbol"]     = "Identifier",
		["@markup.link.url"]              = "Underlined",
		["@markup.list"]                  = { fg = c.chatsargan }, -- For special punctutation that does not fall in the categories before.
		["@markup.list.checked"]          = { fg = c.mus }, -- For brackets and parens.
		["@markup.list.markdown"]         = { fg = c.els, bold = true },
		["@markup.list.unchecked"]        = { fg = c.text }, -- For brackets and parens.
		["@markup.math"]                  = "Special",
		["@markup.raw"]                   = "String",
		["@markup.raw.markdown_inline"]   = { bg = c.surface, fg = c.text },
		["@markup.strikethrough"]         = { strikethrough = true },
		["@markup.strong"]                = { bold = true },
		["@markup.underline"]             = { underline = true },
		["@module"]                       = "Include",
		["@module.builtin"]               = { fg = c.anis }, -- Variable names that are defined by the languages, like `this` or `self`.
		["@namespace.builtin"]            = "@variable.builtin",
		["@none"]                         = {},
		["@number"]                       = "Number",
		["@number.float"]                 = "Float",
		["@operator"]                     = { fg = c.subtle }, -- For any operator: `+`, but also `->` and `*` in C.
		["@property"]                     = { fg = c.mus },
		["@punctuation.bracket"]          = { fg = c.subtle }, -- For brackets and parens.
		["@punctuation.delimiter"]        = { fg = c.subtle }, -- For delimiters ie: `.`
		["@punctuation.special"]          = { fg = c.subtle }, -- For special symbols (e.g. `{}` in string interpolation)
		["@punctuation.special.markdown"] = { fg = c.chatsargan },  -- For special symbols (e.g. `{}` in string interpolation)
		["@string"]                       = "String",
		["@string.documentation"]         = { fg = c.els },
		["@string.escape"]                = { fg = c.nuur }, -- For escape characters within a string.
		["@string.regexp"]                = { fg = c.yargui }, -- For regexes.
		["@tag"]                          = "Label",
		["@tag.attribute"]                = "@property",
		["@tag.delimiter"]                = "Delimiter",
		["@tag.delimiter.tsx"]            = { fg = Util.blend_bg(c.nuur, 0.7) },
		["@tag.tsx"]                      = { fg = c.anis },
		["@tag.javascript"]               = { fg = c.anis },
		["@type"]                         = "Type",
		["@type.builtin"]                 = { fg = Util.blend_bg(c.nuur, 0.8) },
		["@type.definition"]              = "Typedef",
		["@type.qualifier"]               = "@keyword",
		["@variable"]                     = { fg = c.text, style = opts.styles.variables }, -- Any variable name that does not have another highlight.
		["@variable.builtin"]             = { fg = c.anis },                              -- Variable names that are defined by the languages, like `this` or `self`.
		["@variable.member"]              = { fg = c.mus },                               -- For fields.
		["@variable.parameter"]           = { fg = c.yargui },                               -- For parameters of a function.
		["@variable.parameter.builtin"]   = { fg = Util.blend_fg(c.yargui, 0.8) },           -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
	}

	for i, color in ipairs(c.rainbow) do
		ret["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
	end
	return ret
end

return M
