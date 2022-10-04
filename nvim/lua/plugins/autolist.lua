return {
	"gaoDean/autolist.nvim",

	config = function()
		require("autolist").setup({
			colon = {
				priferred = "*",
			},
		})
	end,
}
