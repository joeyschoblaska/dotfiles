vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "" -- don't link nvim and system clipboard
vim.opt.cmdheight = 1 -- default commandline height
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
-- vim.opt.diffopt = "internal,filler,closeoff,linematch" -- https://neovim.io/doc/user/options.html#'diffopt'
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- enable mouse support
vim.opt.mousescroll = "ver:6,hor:6" -- how far to scroll for each click of the mouse wheel
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 3 -- width for col containing line numbers
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.shada = "!,'0,<50,s10,h" -- default, but changed to not remember marks
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1 -- show tabline only when n tabs > 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.ttimeoutlen = 5 -- time to wait for a key code sequence to complete (default: 50)
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = false -- disable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.wrap = true -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
