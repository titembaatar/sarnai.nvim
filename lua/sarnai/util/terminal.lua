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

local color = require("sarnai.util.color")

local M = {}

---@param palette BasePalette
---@return TerminalColors
function M.get_terminal_colors(palette)
	return {
		black          = palette.base,
		bright_black   = palette.surface,
		white          = palette.subtle,
		bright_white   = palette.text,
		red            = palette.anis,
		bright_red     = color.lighten(palette.anis, 0.2),
		green          = palette.uvs,
		bright_green   = color.lighten(palette.uvs, 0.2),
		yellow         = palette.els,
		bright_yellow  = color.lighten(palette.els, 0.2),
		blue           = palette.nuur,
		bright_blue    = color.lighten(palette.nuur, 0.2),
		magenta        = palette.sarnai,
		bright_magenta = color.lighten(palette.sarnai, 0.2),
		cyan           = palette.mus,
		bright_cyan    = color.lighten(palette.mus, 0.2),
	}
end

---@param palette ColorPalette
function M.set_terminal_colors(palette)
	if not palette.terminal then return end

	local t = palette.terminal
	if type(t) ~= "table" then return end

	local none = palette.none or "NONE"

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
