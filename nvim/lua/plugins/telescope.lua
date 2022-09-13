return {
	"nvim-telescope/telescope.nvim",

	requires = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"stevearc/aerial.nvim",
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				wrap_results = true,
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
				file_ignore_patterns = { "^.git/" },
			},

			pickers = {
				buffers = {
					sort_mru = true,
				},

				find_files = {
					hidden = true,
				},

				lsp_references = {
					include_declaration = false,
				},
			},

			extensions = {
				file_browser = {
					hidden = true,
					file_ignore_patterns = { ".git" }, -- the "^.git/" pattern wasn't working for some reason...
					depth = 2,
					display_stat = false, -- don't display date or file size
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("file_browser")
		telescope.load_extension("aerial")
	end,
}
