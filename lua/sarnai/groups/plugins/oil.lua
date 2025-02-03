local M = {}

local styles = require("sarnai.config").options.styles

function M.get(palette)
	return {
		OilHidden           = { fg = palette.muted },
		OilDir              = { fg = palette.sarnai, bold = styles.bold },
		OilDirHidden        = { fg = palette.muted, bold = styles.bold },
		OilSocketHidden     = { fg = palette.muted },
		OilLink             = { fg = palette.mus },
		OilOrphanLink       = { fg = palette.subtle },
		OilLinkHidden       = { fg = palette.muted },
		OilOrphanLinkHidden = { fg = palette.muted },
		OilCreate           = { fg = palette.uvs },
		OilCopy             = { fg = palette.els },
		OilChange           = { fg = palette.nuur },
		OilRestore          = { fg = palette.mus },
		OilPurge            = { fg = palette.anis },
		OilTrash            = { fg = palette.anis },
		OilNormal           = { fg = palette.text, bg = palette.base },
		OilBorder           = { fg = palette.muted },
	}
end

return M
