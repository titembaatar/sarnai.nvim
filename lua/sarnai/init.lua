local config = require("sarnai.config")

local M = {}

-- Store style preferences
M.styles = {
	dark = "shono",
	light = "ogloo"
}

-- Helper function for safe error reporting
local function safe_notify(msg, level)
	-- Default to ERROR (2) if vim.log.levels isn't available
	local notify_level = (vim.log and vim.log.levels and vim.log.levels.ERROR) or 2
	if level then
		notify_level = level
	end

	-- Use pcall since vim.notify might not be available in some environments
	pcall(vim.notify, msg, notify_level)
end

-- Safe require function
local function safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		safe_notify(string.format("Failed to load module '%s': %s", module, result))
		return nil
	end
	return result
end

function M.load(opts)
	-- Ensure opts is a table
	if type(opts) == "string" then
		opts = { style = opts }
	end

	-- Extend configuration
	opts = config.extend(opts)

	-- Handle background/style coordination
	local bg = vim.o.background
	local style = opts.style or (bg == "light" and M.styles.light or M.styles.dark)
	local style_bg = style == "ogloo" and "light" or "dark"

	-- Update background if needed
	if bg ~= style_bg then
		vim.o.background = style_bg
	end

	-- Store style preference
	M.styles[style_bg] = style

	-- Load colors module safely
	local colors = safe_require("sarnai.colors")
	if not colors then
		return
	end

	-- Setup colors with error handling
	local ok, result = pcall(colors.setup, {
		style = style,
		styles = opts.styles,
		plugins = opts.plugins,
		overrides = opts.overrides
	})

	if not ok then
		safe_notify(string.format("Error setting up colors: %s", result))
		return
	end

	return result
end

-- Setup function to configure defaults
M.setup = config.setup

return M
