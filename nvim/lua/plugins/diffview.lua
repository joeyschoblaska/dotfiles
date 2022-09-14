return {
	"sindrets/diffview.nvim",
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			enhanced_diff_hl = true,

			keymaps = {
				file_panel = {
					["<c-u>"] = actions.scroll_view(-0.25),
					["<c-d>"] = actions.scroll_view(0.25),
				},

				file_history_panel = {
					["<c-u>"] = actions.scroll_view(-0.25),
					["<c-d>"] = actions.scroll_view(0.25),
				},
			},
		})

		vim.cmd([[set fillchars+=diff:/]])
	end,
}
