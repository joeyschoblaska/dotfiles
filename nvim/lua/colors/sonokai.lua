vim.g.sonokai_style = "shusia"

vim.cmd("colorscheme sonokai")

-- tabs
vim.cmd("hi TabLineSel guifg=#E3E1E4 guibg=#2C2A2E")
vim.cmd("hi TabLineSeparatorSel guifg=#78DCE8")
vim.cmd("hi TabLine guifg=#848089 guibg=#36343A")
vim.cmd("hi TabLineFill guibg=#36343A")

-- cursorline highlights line number only
vim.cmd("hi clear CursorLine")
vim.cmd("hi clear CursorLineNR")
vim.cmd("hi CursorLineNR guifg=#E3E1E4")
