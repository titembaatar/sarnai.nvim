--[[
I do not use this plugin anymore.
Therefore I will not maintain this file.
Do not open an issue if something break.
Thank you.
--]]
local M = {}

M.url="https://github.com/ibhagwan/fzf-lua"

---@param colors ColorPalette
---@param opts SarnaiConfig
---@return Groups
function M.get(colors, opts)
	local styles = opts.styles or {}
	local transparent_bg = opts.transparent and "NONE" or nil
	local p = colors.palette
	local ui = colors.ui
	local sem = colors.semantic

	return {
		-- Main window highlights
		FzfLuaNormal     = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
		FzfLuaBorder     = { fg = ui.border, bg = transparent_bg or ui.bg_float },
		FzfLuaTitle      = { fg = ui.accent, bg = transparent_bg or ui.bg_float, bold = styles.bold },
		FzfLuaTitleFlags = { fg = p.anis, bg = transparent_bg or ui.bg_float },

		-- Preview window highlights
		FzfLuaPreviewNormal = { fg = ui.fg, bg = transparent_bg or ui.bg_float },
		FzfLuaPreviewBorder = { fg = p.subtle, bg = transparent_bg or ui.bg_float },
		FzfLuaPreviewTitle  = { fg = p.subtle, bg = transparent_bg or ui.bg_float, bold = styles.bold },
		FzfLuaCursor        = { link = "IncSearch" },
		FzfLuaCursorLine    = { bg = p.overlay },
		FzfLuaSearch        = { fg = p.sarnai, bold = styles.bold },

		-- Scrollbar highlights
		FzfLuaScrollBorderEmpty = { fg = p.muted },
		FzfLuaScrollBorderFull  = { fg = p.sarnai },
		FzfLuaScrollFloatEmpty  = { fg = p.muted },
		FzfLuaScrollFloatFull   = { fg = p.sarnai },

		-- Buffer highlights
		FzfLuaBufName    = { fg = p.nuur },
		FzfLuaBufNr      = { fg = p.subtle },
		FzfLuaBufFlagCur = { fg = p.chatsalgan },
		FzfLuaBufFlagAlt = { fg = p.nuur },

		-- Tab highlights
		FzfLuaTabTitle  = { fg   = p.mus },
		FzfLuaTabMarker = { link = "FzfLuaBufNr" },

		-- Additional fzf-lua specific highlights
		FzfLuaHeaderBind = { fg = p.chatsalgan, bold = styles.bold },
		FzfLuaHeaderText = { fg = p.subtle },
		FzfLuaPath       = { fg = p.nuur },
		FzfLuaPathColNr  = { fg = p.nuur },
		FzfLuaPathLineNr = { fg = p.uvs },
		FzfLuaDirPart    = { fg = ui.bg },
		FzfLuaDirIcon    = { fg = p.nuur },
		FzfLuaFilePart   = { link = "Normal" },
		FzfLuaLivePrompt = { fg = p.yargui },
		FzfLuaLiveSym    = { fg = p.yargui },
		FzfLuaFzfInfo    = { fg = sem.info },
	}
end

return M
