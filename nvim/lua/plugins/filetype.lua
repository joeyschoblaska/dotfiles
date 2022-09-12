return {
	"nathom/filetype.nvim",
	config = function()
		require("filetype").setup({
			overrides = {
				extensions = {
					rbi = "ruby",
				},
			},
		})
	end,
}
