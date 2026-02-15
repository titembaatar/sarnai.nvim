---@alias Style "khavar" | "ovol" | nil

---@class BasePalette
---@field base HEX Main background color
---@field surface HEX Lighter background color
---@field overlay HEX Selection background color
---@field muted HEX Muted text color
---@field subtle HEX Secondary text color
---@field text HEX Primary text color
---@field sarnai HEX Pink accent color
---@field anis HEX Red accent color
---@field chatsalgan HEX Orange accent color
---@field els HEX Yellow accent color
---@field uvs HEX Green accent color
---@field nuur HEX Blue accent color
---@field mus HEX Cyan accent color
---@field yargui HEX Purple accent color

---@class UIPalette
---@field bg HEX Main editor background
---@field bg_float HEX Floating window/popup background
---@field bg_popup HEX Selected/highlighted item background
---@field fg HEX Main text color
---@field border HEX Border color
---@field accent HEX Primary accent color

---@class SyntaxPalette
---@field punctuation HEX Punctuation, delimiters
---@field comment HEX Comments
---@field constant HEX Constants, numbers
---@field string HEX Strings
---@field _function HEX Functions, methods
---@field boolean HEX Boolean
---@field keyword HEX Generic keywords
---@field control HEX Control flow keywords (if, for, while)
---@field import HEX Import/include keywords
---@field storage HEX Storage keywords (static, const)
---@field _return HEX Return keyword
---@field operator HEX Operators
---@field type HEX Types, classes
---@field builtin HEX Built-in functions, types
---@field macro HEX Macro functions and preprocessor
---@field method HEX Method definitions and calls
---@field property HEX Object properties
---@field parameter HEX Function parameters
---@field variable HEX Variables
---@field escape HEX Escape sequences in strings
---@field regex HEX Regular expressions
---@field decorator HEX Decorators, attributes

---@class SemanticPalette
---@field error HEX Errors
---@field warn HEX Warnings
---@field info HEX Information
---@field hint HEX Hints
---@field ok HEX Success/OK
---@field error_bg HEX Error background
---@field warn_bg HEX Warning background
---@field info_bg HEX Info background
---@field hint_bg HEX Hint background
---@field ok_bg HEX Hint background

---@class GitPalette
---@field git_add HEX Added content
---@field git_change HEX Changed content
---@field git_delete HEX Deleted content
---@field git_dirty HEX Dirty/unstaged changes
---@field git_ignore HEX Ignored files
---@field git_merge HEX Merge conflicts
---@field git_rename HEX Renamed content
---@field git_text HEX Git text (commit messages, etc.)
---@field git_add_bg HEX Added content background
---@field git_change_bg HEX Changed content background
---@field git_delete_bg HEX Deleted content background
---@field git_dirty_bg HEX Dirty/unstaged changes background
---@field git_ignore_bg HEX Ignored files background
---@field git_merge_bg HEX Merge conflicts background
---@field git_rename_bg HEX Renamed content background
---@field git_text_bg HEX Git text (commit messages, etc.) background

---@class SpecialPalette
---@field link HEX Links, URLs
---@field special HEX Special elements
---@field symbol HEX Special symbols
---@field character HEX Special characters
---@field note HEX Notes in comments
---@field todo HEX TODOs in comments
---@field warning HEX Warning notes

---@class RainbowPalette
---@field h1 HEX h1 titles
---@field h2 HEX h2 titles
---@field h3 HEX h3 titles
---@field h4 HEX h4 titles
---@field h5 HEX h5 titles
---@field h6 HEX h6 titles

---@class TerminalPalette
---@field black HEX Terminal black color
---@field bright_black HEX Terminal bright black color
---@field white HEX Terminal white color
---@field bright_white HEX Terminal bright white color
---@field red HEX Terminal red color
---@field bright_red HEX Terminal bright red color
---@field green HEX Terminal green color
---@field bright_green HEX Terminal bright green color
---@field yellow HEX Terminal yellow color
---@field bright_yellow HEX Terminal bright yellow color
---@field blue HEX Terminal blue color
---@field bright_blue HEX Terminal bright blue color
---@field magenta HEX Terminal magenta color
---@field bright_magenta HEX Terminal bright magenta color
---@field cyan HEX Terminal cyan color
---@field bright_cyan HEX Terminal bright cyan color

---@class ColorPalette
---@field palette BasePalette Base color palette
---@field ui UIPalette UI element colors
---@field syntax SyntaxPalette Syntax element colors
---@field semantic SemanticPalette Semantic element colors
---@field git GitPalette Git element colors
---@field special SpecialPalette Special element colors
---@field rainbow RainbowPalette Rainbow for markdown titles
---@field none string Special "NONE" value
---@field terminal TerminalPalette Terminal colors

local Util = require("sarnai.util")

local M = {}

---@type BasePalette
M.dark_palette = {
	-- Core base colors
	base    = "#172620",
	surface = "#21362d",
	overlay = "#2d493d",
	muted   = "#4e7e6b",
	subtle  = "#90bbaa",
	text    = "#dfece7",

	-- Core accent colors
	sarnai     = "#f0c3cb",
	anis       = "#ff6b6b",
	chatsalgan = "#e5951a",
	els        = "#cca24d",
	uvs        = "#80b946",
	nuur       = "#2b879e",
	mus        = "#9deaea",
	yargui     = "#d5b3e5",
}

---@type BasePalette
M.light_palette = {
	-- Core base colors
	base    = "#dceae4",
	surface = "#b6d2c7",
	overlay = "#90bbaa",
	muted   = "#81b19e",
	subtle  = "#446f5e",
	text    = "#172620",

	-- Core accent colors
	sarnai     = "#b93d4d",
	anis       = "#cc2929",
	chatsalgan = "#da730c",
	els        = "#df9b23",
	uvs        = "#4c890f",
	nuur       = "#0a728c",
	mus        = "#12adad",
	yargui     = "#a353c6",
}

---@param p BasePalette
---@return ColorPalette Full
function M.generate_palette(p)
	---@type ColorPalette
	local colors = {
		palette = p,
		ui = {
			bg       = p.base,
			bg_float = p.surface,
			bg_popup = p.overlay,
			fg       = p.text,
			border   = p.sarnai,
			accent   = p.sarnai,
		},
		syntax = {
			-- Basic syntax elements
			punctuation = p.subtle,
			comment     = p.muted,
			constant    = p.chatsalgan,
			string      = p.els,
			boolean     = p.chatsalgan,
			variable    = p.text,

			-- Function-related
			_function = p.sarnai,
			method    = p.sarnai,
			builtin   = p.anis,
			macro     = p.anis,

			-- Keyword-related
			keyword = p.nuur,
			control = Util.blend(p.nuur, p.mus, 0.5),
			import  = p.yargui,
			storage = p.nuur,
			_return = p.nuur,

			-- Type-related
			type     = p.mus,
			property = p.mus,

			-- Other syntax elements
			operator  = p.subtle,
			parameter = p.yargui,
			escape    = p.anis,
			regex     = p.els,
			decorator = p.yargui,
		},
		semantic = {
			error    = p.anis,
			warn     = p.chatsalgan,
			info     = p.nuur,
			hint     = p.sarnai,
			ok       = p.uvs,
			error_bg = Util.blend(p.anis, p.base, 0.15),
			warn_bg  = Util.blend(p.chatsalgan, p.base, 0.15),
			info_bg  = Util.blend(p.nuur, p.base, 0.15),
			hint_bg  = Util.blend(p.sarnai, p.base, 0.15),
			ok_bg    = Util.blend(p.uvs, p.base, 0.15),
		},
		git = {
			git_add       = p.uvs,
			git_change    = p.els,
			git_delete    = p.anis,
			git_dirty     = p.sarnai,
			git_ignore    = p.muted,
			git_merge     = p.yargui,
			git_rename    = p.nuur,
			git_text      = p.sarnai,
			git_add_bg    = Util.blend(p.uvs, p.base, 0.15),
			git_change_bg = Util.blend(p.els, p.base, 0.15),
			git_delete_bg = Util.blend(p.anis, p.base, 0.15),
			git_dirty_bg  = Util.blend(p.sarnai, p.base, 0.15),
			git_ignore_bg = Util.blend(p.muted, p.base, 0.15),
			git_merge_bg  = Util.blend(p.yargui, p.base, 0.15),
			git_rename_bg = Util.blend(p.nuur, p.base, 0.15),
			git_text_bg   = Util.blend(p.sarnai, p.base, 0.15),
		},
		special = {
			link      = p.nuur,
			special   = p.mus,
			symbol    = Util.blend(p.mus, p.els, 0.5),
			character = Util.blend(p.mus, p.sarnai, 0.5),
			note      = p.nuur,
			todo      = p.sarnai,
			warning   = p.chatsalgan,
		},
		rainbow = {
			h1 = p.mus,
			h2 = p.sarnai,
			h3 = p.yargui,
			h4 = p.uvs,
			h5 = p.els,
			h6 = p.nuur,
		},
		terminal = require("sarnai.terminal").get(p),
		none = "NONE",
	}

	return colors
end

---@param opts SarnaiConfig
---@return ColorPalette
function M.get(opts)
	local style = opts.style
	local colors = {}

	if style == "ovol" then
		colors = M.generate_palette(M.light_palette)
	else
		colors = M.generate_palette(M.dark_palette)
	end

	if opts.on_colors and type(opts.on_colors) == "function" then
		opts.on_colors(colors)
	end

	return colors
end

return M

