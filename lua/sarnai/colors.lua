local M = {}

-- Helper function for safe error reporting (same as in init.lua)
local function safe_notify(msg, level)
	local notify_level = (vim.log and vim.log.levels and vim.log.levels.ERROR) or 2
	if level then
		notify_level = level
	end
	pcall(vim.notify, msg, notify_level)
end

-- Load the appropriate palette based on style
local function load_palette(style)
	local ok, palette = pcall(require, "sarnai.palettes." .. style)
	if not ok then
		safe_notify("Failed to load palette: " .. style)
		-- Attempt to load default palette
		local default_ok, default_palette = pcall(require, "sarnai.palettes.shono")
		if not default_ok then
			error("Failed to load both requested and default palettes")
		end
		return default_palette
	end
	return palette
end

-- Set Neovim's color scheme name
local function set_colorscheme_name(style)
	vim.g.colors_name = "sarnai" .. (style ~= "shono" and "-" .. style or "")
end

-- Clear existing highlights
local function clear_highlights()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
end

function M.setup(opts)
	-- Load the appropriate palette
	local palette = load_palette(opts.style or "shono")

	-- Clear existing highlights and set colorscheme name
	clear_highlights()
	set_colorscheme_name(opts.style)

	-- Load and apply all highlight groups
	local groups = require("sarnai.groups")
	if not groups then
		safe_notify("Failed to load highlight groups")
		return
	end

	-- Apply the highlights with error handling
	local ok, result = pcall(groups.setup, palette, opts)
	if not ok then
		safe_notify("Failed to apply highlights: " .. tostring(result))
		return
	end

	return result
end

return M

