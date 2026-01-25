---@alias Style "khavar" | "ovol"

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

local util = require("sarnai.util")

local M = {}

---Base Palette
---@type BasePalette
M.base_palette = {
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

---Base Palette for Ovol
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

-- Generate a color palette from a base palette
---@param p BasePalette Base palette to generate from
---@return ColorPalette Full color palette with derived colors
function M.generate_color_palette(p)
	---@type ColorPalette
	local colors = {
		palette = p,
		ui = {
			bg       = p.base,    -- Main editor background
			bg_float = p.surface, -- Floating window/popup background
			bg_popup = p.overlay, -- Selected/highlighted item background
			fg       = p.text,    -- Main text color
			border   = p.sarnai,  -- Border color
			accent   = p.sarnai,  -- Primary accent color
		},
		syntax = {
			-- Basic syntax elements
			punctuation = p.subtle,     -- Punctuation, delimiters
			comment     = p.muted,      -- Comments
			constant    = p.els,        -- Constants, numbers
			string      = p.els,        -- Strings
			boolean     = p.chatsalgan, -- Booleans
			variable    = p.text,       -- Variables

			-- Function-related
			_function = p.sarnai,     -- Generic functions, methods
			method    = p.sarnai,     -- Method definitions and calls
			builtin   = p.anis,       -- Built-in functions
			macro     = p.chatsalgan, -- Macro functions, preprocessor

			-- Keyword-related
			keyword = p.nuur,                         -- Generic keywords
			control = util.blend(p.nuur, p.mus, 0.5), -- Control flow keywords
			import  = p.yargui,                       -- Import/include keywords
			storage = p.nuur,                         -- Storage keywords
			_return = p.nuur,                         -- Return keyword

			-- Type-related
			type     = p.mus, -- Types, classes
			property = p.mus, -- Object properties

			-- Other syntax elements
			operator  = p.subtle, -- Operators
			parameter = p.yargui, -- Function parameters
			escape    = p.anis,   -- Escape sequences in strings
			regex     = p.els,    -- Regular expressions
			decorator = p.yargui, -- Decorators, attributes
		},
		semantic = {
			error    = p.anis,       -- Errors
			warn     = p.chatsalgan, -- Warnings
			info     = p.nuur,       -- Information
			hint     = p.sarnai,     -- Hints
			ok       = p.uvs,        -- Success/OK
			error_bg = util.blend(p.anis, p.base, 0.15),       -- Error background
			warn_bg  = util.blend(p.chatsalgan, p.base, 0.15), -- Warning background
			info_bg  = util.blend(p.nuur, p.base, 0.15),       -- Info background
			hint_bg  = util.blend(p.sarnai, p.base, 0.15),     -- Hint background
			ok_bg    = util.blend(p.uvs, p.base, 0.15),        -- Success background
		},
		git = {
			git_add       = p.uvs,    -- Added content
			git_change    = p.els,    -- Changed content
			git_delete    = p.anis,   -- Deleted content
			git_dirty     = p.sarnai, -- Dirty/unstaged changes
			git_ignore    = p.muted,  -- Ignored files
			git_merge     = p.yargui, -- Merge conflicts
			git_rename    = p.nuur,   -- Renamed content
			git_text      = p.sarnai, -- Git text (commit messages, etc.)
			git_add_bg    = util.blend(p.uvs, p.base, 0.15),    -- Added content background
			git_change_bg = util.blend(p.els, p.base, 0.15),    -- Changed content background
			git_delete_bg = util.blend(p.anis, p.base, 0.15),   -- Deleted content background
			git_dirty_bg  = util.blend(p.sarnai, p.base, 0.15), -- Dirty/unstaged changes background
			git_ignore_bg = util.blend(p.muted, p.base, 0.15),  -- Ignored files background
			git_merge_bg  = util.blend(p.yargui, p.base, 0.15), -- Merge conflicts background
			git_rename_bg = util.blend(p.nuur, p.base, 0.15),   -- Renamed content background
			git_text_bg   = util.blend(p.sarnai, p.base, 0.15), -- Git text (commit messages, etc.) background
		},
		special = {
			link      = p.nuur,                           -- Links, URLs
			special   = p.mus,                            -- Special elements
			symbol    = util.blend(p.mus, p.els, 0.5),    -- Special symbols
			character = util.blend(p.mus, p.sarnai, 0.5), -- Special characters
			note      = p.nuur,                           -- Notes in comments
			todo      = p.sarnai,                         -- TODOs in comments
			warning   = p.chatsalgan,                     -- Warning notes
		},
		rainbow = {
			h1 = p.mus,
			h2 = p.sarnai,
			h3 = p.yargui,
			h4 = p.uvs,
			h5 = p.els,
			h6 = p.nuur,
		},
		none = "NONE",
		terminal = util.get_terminal_colors(p),
	}

	return colors
end

-- Function to get the khavar (dark) theme
---@return ColorPalette
function M.get_khavar()
	return M.generate_color_palette(M.base_palette)
end

-- Function to get the ovol (light) theme
---@return ColorPalette
function M.get_ovol()
	return M.generate_color_palette(M.light_palette)
end

-- Get colors based on style
---@param style Style
---@return ColorPalette
function M.get_colors(style)
	if style == "ovol" then
		return M.get_ovol()
	end

	return M.get_khavar()
end

return M

