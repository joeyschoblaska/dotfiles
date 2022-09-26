return {
	"andymass/vim-matchup",

	requires = "nvim-treesitter/nvim-treesitter",
	after = "nvim-treesitter",

	config = function()
		vim.g.matchup_surround_enabled = 1

		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
			},
		})
	end,
}
