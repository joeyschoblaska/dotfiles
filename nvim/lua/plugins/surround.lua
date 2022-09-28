return {
	"kylechui/nvim-surround",
	tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		require("nvim-surround").setup({})
	end,
}
