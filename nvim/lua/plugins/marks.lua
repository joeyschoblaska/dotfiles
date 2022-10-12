return {
	"chentoast/marks.nvim",

	config = function()
		require("marks").setup({
			default_mappings = false,

			mappings = {
				delete_bookmark = "md",
				annotate = "ma",
				delete_bookmark0 = "dma",
				set_bookmark0 = "mm",
				next_bookmark0 = ">",
				prev_bookmark0 = "<",
			},

			bookmark_0 = {
				sign = "",
			},
		})
	end,
}
