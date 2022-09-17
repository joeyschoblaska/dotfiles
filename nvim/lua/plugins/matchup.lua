return {
	"andymass/vim-matchup",

	config = function()
		vim.g.matchup_surround_enabled = 1

		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
			},
		})
	end,
}
