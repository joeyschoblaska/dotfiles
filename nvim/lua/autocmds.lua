-- resize splits whenever parent window resizes
vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = "*",
	command = [[exe "normal \<C-w>="]],
})

-- disable cmp in git commit messages
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "gitcommit,markdown,md",
	command = [[lua require("functions").auto_cmp.disable()]],
})
