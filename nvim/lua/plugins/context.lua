return {
	"nvim-treesitter/nvim-treesitter-context",

	config = function()
		require("treesitter-context").setup({
			separator = "-",
			patterns = {
				default = {
					"block",
					"class",
					"function",
					"method",
					"module",
				},
			},
		})
	end,
}
