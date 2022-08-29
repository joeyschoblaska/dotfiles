vim.g.nightflyUndercurls = false
vim.g.nightflyUnderlineMatchParen = false

vim.cmd("colorscheme nightfly")

-- tabs
vim.cmd("hi TabLineSel guifg=#C3CCDD guibg=#011727")
vim.cmd("hi TabLineSeparatorSel guifg=#82AAFF")
vim.cmd("hi TabLine guifg=#7D8F8F guibg=#2C3043")
vim.cmd("hi TabLineFill guibg=#2C3043")

-- cursorline highlights line number only
vim.cmd("hi clear CursorLine")
vim.cmd("hi clear CursorLineNR")
vim.cmd("hi CursorLineNR guifg=#82AAFF")
