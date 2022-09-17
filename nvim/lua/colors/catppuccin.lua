local mocha = require("catppuccin/palettes/mocha")
local utils = require("catppuccin/utils/colors")

local hi = function(group, colors)
	vim.api.nvim_set_hl(0, group, colors)
end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd("colorscheme catppuccin")

-- tabs
hi("TabLineSel", { fg = mocha.text, bg = mocha.base })
hi("TabLineSeparatorSel", { fg = mocha.sapphire })
hi("TabLine", { fg = mocha.surface2, bg = mocha.mantle })
hi("TabLineFill", { bg = mocha.mantle })

-- make comments a little brighter
hi("Comment", { fg = mocha.overlay0 }) -- default: surface2

-- hlslens / search highlight
local search_hl = mocha.sapphire
local search_hl_dark = utils.blend(search_hl, mocha.base, 0.35)
local search_hl_darker = utils.blend(search_hl, mocha.base, 0.2)

hi("IncSearch", { fg = mocha.base, bg = search_hl })
hi("Search", { fg = mocha.text, bg = search_hl_dark })
hi("HlSearchLens", { fg = mocha.overlay2, bg = search_hl_darker })
hi("HlSearchLensNear", { fg = mocha.text, bg = search_hl_dark })
hi("HlSearchFloat", { fg = mocha.text, bg = search_hl_dark })

-- fidget
hi("FidgetTitle", { fg = mocha.mauve, bg = mocha.base })
hi("FidgetTask", { fg = mocha.mantle, bg = mocha.mauve })

-- diffview
hi("DiffAdd", { bg = utils.blend(mocha.green, mocha.base, 0.20) })
hi("DiffDelete", { bg = utils.blend(mocha.red, mocha.base, 0.20) })
hi("DiffChange", { bg = utils.blend(mocha.yellow, mocha.base, 0.10) })
hi("DiffText", { bg = utils.blend(mocha.yellow, mocha.base, 0.30) })

-- indent-blankline
hi("IndentBlanklineIndent1", { fg = mocha.surface0, nocombine = true })
hi("IndentBlanklineIndent2", { fg = mocha.surface1, nocombine = true })
hi("IndentBlanklineContextChar", { fg = mocha.overlay0, nocombine = true })
