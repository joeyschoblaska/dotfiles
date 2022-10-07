return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "│" },
			},
			signcolumn = true,
			numhl = false,
		})
	end,
}
