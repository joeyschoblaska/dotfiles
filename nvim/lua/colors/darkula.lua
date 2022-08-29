-- darkula: dracula with hd tweaks
-- color adjuster: https://siduck.github.io/hex-tools/
vim.g.dracula_colors = {
	bg = "#232531", -- #282A36 - 5%
	bg_light = "#282A36", -- #282A36 (not used in original theme)
	selection = "#3f4255", -- #44475A - 5%
	comment = "#6777a9", -- #6272A4 + 5%
	menu = "#1c1d27", -- #21222C - 5%
	visual = "#393f4d", -- #3E4452 - 5%
	gutter_fg = "#464d5e", -- #4B5263 - 5%
	nontext = "#363b43", -- #3B4048 - 5%
	black = "#14151c", -- #191A21 - 5%
}

vim.cmd("colorscheme dracula")

local dracula = require("dracula").colors()

-- tabs
vim.cmd("hi TabLineSel guifg=" .. dracula.fg)
vim.cmd("hi TabLineSeparatorSel guifg=" .. dracula.purple)
vim.cmd("hi TabLine guibg=" .. dracula.black)
vim.cmd("hi TabLineFill guibg=" .. dracula.black)

-- cursorline highlights line number only
vim.cmd("hi clear CursorLine")
vim.cmd("hi clear CursorLineNR")
vim.cmd("hi CursorLineNR guifg=" .. dracula.fg)

-- telescope
vim.cmd("hi TelescopeSelection guibg=" .. dracula.selection .. " guifg=" .. dracula.fg)
