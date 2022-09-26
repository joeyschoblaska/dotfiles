return {
	"sindrets/diffview.nvim",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			enhanced_diff_hl = true,

			keymaps = {
				file_panel = {
					["<c-u>"] = actions.scroll_view(-0.25),
					["<c-d>"] = actions.scroll_view(0.25),
					["o"] = actions.goto_file_tab,
					["q"] = ":DiffviewClose<CR>",
				},

				file_history_panel = {
					["<c-u>"] = actions.scroll_view(-0.25),
					["<c-d>"] = actions.scroll_view(0.25),
					["o"] = actions.open_in_diffview,
					["q"] = ":DiffviewClose<CR>",
				},
			},
		})

		vim.cmd([[set fillchars+=diff:/]])
	end,
}
