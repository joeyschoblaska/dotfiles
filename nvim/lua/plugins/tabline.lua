return {
	"seblj/nvim-tabline",

	config = function()
		require("tabline").setup({
			padding = 1,
			close_icon = "",
			show_index = true,
		})
	end,
}
