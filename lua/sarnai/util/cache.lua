---@class HighlightsCache
---@field highlights Highlights
---@field palette ColorPalette

local M = {}

---@type table<string, HighlightsCache>
M._cache = {}

---@param opts SarnaiConfig
---@return string
function M.generate(opts)
	local parts = {
		"style=" .. (opts.style or "khavar"),
		"transparent=" .. tostring(opts.transparent or false),
	}

	if opts.styles then
		for k, v in pairs(opts.styles) do
			parts[#parts + 1] = k .. "=" .. vim.inspect(v)
		end
	end

	if opts.plugins then
		local plugins_str = "plugins="
		for k, v in pairs(opts.plugins) do
			if type(v) == "boolean" then
				plugins_str = plugins_str .. k .. "=" .. tostring(v) .. ","
			end
		end
		parts[#parts + 1] = plugins_str
	end

	if opts.on_colors or opts.on_highlights then
		parts[#parts + 1] = "custom=true"
	end

	return table.concat(parts, ",")
end

---@param key string Cache key
---@param highlights Highlights
---@param palette ColorPalette
function M.store(key, highlights, palette)
	M._cache[key] = {
		highlights = highlights,
		palette = palette
	}
end

---@param key string Cache key
---@return HighlightsCache|nil
function M.get(key)
	return M._cache[key]
end

---@param key string Cache key
---@return boolean
function M.exists(key)
	return M._cache[key] ~= nil
end

function M.clear()
	M._cache = {}
end

return M
