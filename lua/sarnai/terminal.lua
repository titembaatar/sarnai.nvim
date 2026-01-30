---@alias TerminalColors {
---	black:          HEX,
---	bright_black:   HEX,
---	white:          HEX,
---	bright_white:   HEX,
---	red:            HEX,
---	bright_red:     HEX,
---	green:          HEX,
---	bright_green:   HEX,
---	yellow:         HEX,
---	bright_yellow:  HEX,
---	blue:           HEX,
---	bright_blue:    HEX,
---	magenta:        HEX,
---	bright_magenta: HEX,
---	cyan:           HEX,
---	bright_cyan:    HEX,
---	}

local Util = require("sarnai.util")

local M = {}

---@param palette BasePalette
---@return TerminalColors
function M.get(palette)
	return {
		black          = palette.base,
		bright_black   = palette.surface,
		white          = palette.subtle,
		bright_white   = palette.text,
		red            = palette.anis,
		bright_red     = Util.lighten(palette.anis, 0.2),
		green          = palette.uvs,
		bright_green   = Util.lighten(palette.uvs, 0.2),
		yellow         = palette.els,
		bright_yellow  = Util.lighten(palette.els, 0.2),
		blue           = palette.nuur,
		bright_blue    = Util.lighten(palette.nuur, 0.2),
		magenta        = palette.sarnai,
		bright_magenta = Util.lighten(palette.sarnai, 0.2),
		cyan           = palette.mus,
		bright_cyan    = Util.lighten(palette.mus, 0.2),
	}
end

---@param colors ColorPalette
function M.setup(colors)
	local t = colors.terminal
	local none = colors.none or "NONE"

	if not colors.terminal or type(t) ~= "table" then return end

	vim.g.terminal_color_0  = t.black or none
	vim.g.terminal_color_1  = t.red or none
	vim.g.terminal_color_2  = t.green or none
	vim.g.terminal_color_3  = t.yellow or none
	vim.g.terminal_color_4  = t.blue or none
	vim.g.terminal_color_5  = t.magenta or none
	vim.g.terminal_color_6  = t.cyan or none
	vim.g.terminal_color_7  = t.white or none
	vim.g.terminal_color_8  = t.bright_black or none
	vim.g.terminal_color_9  = t.bright_red or none
	vim.g.terminal_color_10 = t.bright_green or none
	vim.g.terminal_color_11 = t.bright_yellow or none
	vim.g.terminal_color_12 = t.bright_blue or none
	vim.g.terminal_color_13 = t.bright_magenta or none
	vim.g.terminal_color_14 = t.bright_cyan or none
	vim.g.terminal_color_15 = t.bright_white or none
end

return M
