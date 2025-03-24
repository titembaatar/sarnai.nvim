local M = {}

-- Load all utility modules
local color_utils = require("sarnai.util.color")
local palette_utils = require("sarnai.util.palette")
local terminal_utils = require("sarnai.util.terminal")

-- Merge all utilities into one table
for k, v in pairs(color_utils) do M[k] = v end
for k, v in pairs(palette_utils) do M[k] = v end
for k, v in pairs(terminal_utils) do M[k] = v end

return M
