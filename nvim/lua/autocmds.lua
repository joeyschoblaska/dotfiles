-- resize splits whenever parent window resizes
vim.api.nvim_create_autocmd({ "VimResized" }, {
	pattern = "*",
	command = [[exe "normal \<C-w>="]],
})
