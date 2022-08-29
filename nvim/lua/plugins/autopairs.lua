return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			map_cr = true,
			check_ts = true,
		})
	end,
}
