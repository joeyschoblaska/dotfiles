return {
	"tversteeg/registers.nvim",
	config = function()
		require("registers").setup({
			show_register_types = false,
			show_empty = false,
			window = {
				highlight_cursorline = false,
				border = "rounded",
				transparency = 0,
			},
			sign_highlights = {
				named = "Function",
			},
		})
	end,
}
