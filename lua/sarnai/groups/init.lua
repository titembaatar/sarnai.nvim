local M = {}

local util = require("sarnai.util")

local modules = {
	core = "sarnai.groups.core",
	-- Plugins
	blink = "sarnai.groups.plugins.blink",
	mini = "sarnai.groups.plugins.mini",
	oil = "sarnai.groups.plugins.oil",
	telescope = "sarnai.groups.plugins.telescope",
	lazygit = "sarnai.groups.plugins.lazygit",
}

---@param highlights table Apply highlights to all groups
local function set_highlights(highlights, palette)
	for group, highlight in pairs(highlights) do
		if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
			highlight.bg = util.blend(highlight.bg, highlight.blend_on or palette.base, highlight.blend / 100)
		end

		highlight.blend = nil
		highlight.blend_on = nil

		vim.api.nvim_set_hl(0, group, highlight)
	end
end

---@param palette table Style colors
---@param opts table sarnai.Config
function M.setup(palette, opts)
	local groups_highlights = {}

	-- Load and apply module highlights
	for _, module in pairs(modules) do
		local module_highlights = require(module).get(palette, opts)
		for group, highlight in pairs(module_highlights) do
			groups_highlights[group] = highlight
		end
	end

	-- Set all highlights
	set_highlights(groups_highlights, palette)
	return groups_highlights
end

return M
