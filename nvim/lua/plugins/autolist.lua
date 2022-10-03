return {
	"gaoDean/autolist.nvim",

	commit = "9a6cb3c5a35ccfc35ecfaf9b3bfd234f8919ce5a",

	config = function()
		require("autolist").setup({
			colon = {
				priferred = "*",
			},
		})
	end,
}
