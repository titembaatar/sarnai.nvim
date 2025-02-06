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
local function apply_highlights(highlights)
	for group, opts in pairs(highlights) do
		if opts.blend ~= nil and (opts.blend >= 0 and opts.blend <= 100) and opts.bg ~= nil then
			opts.bg = util.blend(opts.bg, opts.blend_on or "#0d1615", opts.blend / 100)
		end
		local status, err = pcall(vim.api.nvim_set_hl, 0, group, opts)
	end
end

---@param palette table Style colors
---@param opts table sarnai.Config
function M.setup(palette, opts)
	local final_highlights = {}

	-- Load and apply module highlights
	for _, module_path in pairs(modules) do
		local ok, mod = pcall(require, module_path)
		if ok and type(mod.get) == "function" then
			local status, highlights = pcall(mod.get, palette, opts)

			if status and type(highlights) == "table" then
				for group, hl_opts in pairs(highlights) do
					final_highlights[group] = hl_opts
				end
			end
		end
	end

	-- Apply all highlights
	apply_highlights(final_highlights)
	return final_highlights
end

return M
