return {
	"nvim-telescope/telescope.nvim",

	requires = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.95,
					height = 0.95,
					preview_cutoff = 120,
				},
			},

			pickers = {
				buffers = {
					sort_mru = true,
				},

				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" }, -- show hidden files but ignore the .git dir
				},
			},

			extensions = {
				file_browser = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("file_browser")
	end,
}
