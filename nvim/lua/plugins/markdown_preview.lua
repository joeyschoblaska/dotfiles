-- this plugin may need to be installed manually:
--
-- ```
-- cd ~/.local/share/nvim/site/pack/packer/start/
-- git clone https://github.com/iamcco/markdown-preview.nvim.git
-- cd markdown-preview.nvim
-- yarn install
-- yarn build
-- ```

return {
	"iamcco/markdown-preview.nvim",

	run = function()
		vim.fn["mkdp#util#install"]()
	end,
}
