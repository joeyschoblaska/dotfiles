return {
	"stevearc/aerial.nvim",

	requires = "nvim-treesitter/nvim-treesitter",
	after = "nvim-treesitter",

	config = function()
		require("aerial").setup({
			close_on_select = true,
			highlight_on_jump = false,
			max_width = 0.95,
			min_width = 60,
		})
	end,
}
