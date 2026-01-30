---@alias HEX string
---@alias RGB {r: number, g: number, b: number}

local M = {}

---@param hex HEX
---@return RGB
function M.hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	return {
		r = tonumber(hex:sub(1, 2), 16),
		g = tonumber(hex:sub(3, 4), 16),
		b = tonumber(hex:sub(5, 6), 16)
	}
end

---@param rgb RGB
---@return HEX
function M.rgb_to_hex(rgb)
	return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
end

---@param fg HEX
---@param bg HEX
---@param alpha number
---@return HEX
function M.blend(fg, bg, alpha)
	local bg_rgb = M.hex_to_rgb(bg)
	local fg_rgb = M.hex_to_rgb(fg)

	local result = {
		r = math.floor(fg_rgb.r * alpha + bg_rgb.r * (1 - alpha)),
		g = math.floor(fg_rgb.g * alpha + bg_rgb.g * (1 - alpha)),
		b = math.floor(fg_rgb.b * alpha + bg_rgb.b * (1 - alpha))
	}

	return M.rgb_to_hex(result)
end

---@param hex HEX
---@param amount number
---@return HEX
function M.darken(hex, amount)
	return M.blend("#000000", hex, amount)
end

---@param hex HEX
---@param amount number
---@return HEX
function M.lighten(hex, amount)
	return M.blend("#ffffff", hex, amount)
end

---From folke/tokyonight
---@param file string
function M.read(file)
  local fd = assert(io.open(file, "r"))
  ---@type string
  local data = fd:read("*a")
  fd:close()
  return data
end

---From folke/tokyonight
---@param file string
---@param contents string
function M.write(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

return M
