vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

vim.cmd("colorscheme catppuccin")

-- tabs
vim.cmd("hi TabLineSel guifg=#CDD6F4 guibg=#1E1E2E")
vim.cmd("hi TabLineSeparatorSel guifg=#74c7ec")
vim.cmd("hi TabLine guifg=#585B70 guibg=#181825")
vim.cmd("hi TabLineFill guibg=#181825")

-- make comments a little brighter
vim.cmd("hi Comment guifg=#6c7086") -- default: #585b70

-- hlslens / search highlight
vim.cmd("hi IncSearch guifg=#1e1e2e guibg=#74c7ec")
vim.cmd("hi Search guibg=#585b70")
