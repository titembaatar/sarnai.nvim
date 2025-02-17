local Util = require("sarnai.util")

local M = {}

---@type table<string, Palette|fun(opts:sarnai.Config):Palette>
M.styles = setmetatable({}, {
	__index = function(_, style)
		return vim.deepcopy(Util.mod("sarnai.colors." .. style))
	end,
})

---@param opts? sarnai.Config
function M.setup(opts)
	opts = require("sarnai.config").extend(opts)

	Util.day_brightness = opts.day_brightness

	local palette = M.styles[opts.style]
	if type(palette) == "function" then
		palette = palette(opts) --[[@as Palette]]
	end

	-- Color Palette
	---@class ColorScheme: Palette
	local colors = palette

	Util.bg = colors.base
	Util.fg = colors.text

	colors.none = "NONE"

	colors.diff = {
		add = Util.blend_bg(colors.mus, 0.15),
		delete = Util.blend_bg(colors.anis, 0.15),
		change = Util.blend_bg(colors.sarnai, 0.15),
		text = colors.text,
	}

	colors.git.ignore = colors.muted
	colors.black = Util.blend_bg(colors.base, 0.8, "#000000")
	colors.border_highlight = Util.blend_bg(colors.sarnai, 0.8)
	colors.border = colors.base

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.overlay
	colors.bg_statusline = colors.surface

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
			or opts.styles.sidebars == "dark" and colors.base
			or colors.surface

	colors.bg_float = opts.styles.floats == "transparent" and colors.none
			or opts.styles.floats == "dark" and colors.base
			or colors.surface

	colors.bg_visual = Util.blend_bg(colors.sarnai, 0.4)
	colors.bg_search = colors.sarnai
	colors.fg_sidebar = colors.text
	colors.fg_float = colors.text

	colors.error = colors.anis
	colors.todo = colors.nuur
	colors.warning = colors.els
	colors.info = colors.mus
	colors.hint = colors.uvs

	colors.rainbow = {
		colors.sarnai,
		colors.nuur,
		colors.mus,
		colors.els,
		colors.uvs,
		colors.anis,
	}

	-- stylua: ignore
	--- @class TerminalColors
	colors.terminal = {
		black          = colors.base,
		black_bright   = colors.surface,
		red            = colors.anis,
		red_bright     = Util.brighten(colors.anis),
		green          = colors.uvs,
		green_bright   = Util.brighten(colors.uvs),
		yellow         = colors.els,
		yellow_bright  = Util.brighten(colors.els),
		blue           = colors.nuur,
		blue_bright    = Util.brighten(colors.nuur),
		magenta        = colors.sarnai,
		magenta_bright = Util.brighten(colors.sarnai),
		cyan           = colors.mus,
		cyan_bright    = Util.brighten(colors.mus),
		white          = colors.subtle,
		white_bright   = colors.text,
	}

	opts.on_colors(colors)

	return colors, opts
end

return M
