return {
	"kevinhwang91/nvim-bqf",

	ft = "qf",

	config = function()
		require("bqf").setup({
			func_map = {
				drop = "<CR>",
				open = "o",
				stoggledown = "",
				stogglevm = "",
			},
		})
	end,
}
