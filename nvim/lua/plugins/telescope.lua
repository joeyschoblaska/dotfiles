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
		local fb_actions = require("telescope").extensions.file_browser.actions
		local settings = require("settings")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = settings.telescope_layout_strategy or "flex",
				wrap_results = true,
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
						results_width = 0.5,
						preview_cutoff = 1, -- set to a low value since flex will handle swapping to vertical if necessary
					},
					vertical = {
						prompt_position = "top",
						preview_height = 0.60,
					},
					flex = {
						flip_columns = 140, -- use horizontal mode if buffer has at least this many columns
					},
					width = 0.95,
					height = 0.95,
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
					show_line = false,
				},

				lsp_definitions = {
					jump_type = "vsplit",
					include_declaration = false,
					show_line = false,
				},

				lsp_dynamic_workspace_symbols = {
					show_line = false,
					fname_width = 45,
				},
			},

			extensions = {
				file_browser = {
					hidden = true,
					wrap_results = false,
					file_ignore_patterns = { ".git" }, -- the "^.git/" pattern wasn't working for some reason...
					depth = 2,
					display_stat = false, -- don't display date or file size

					mappings = {
						["i"] = {
							["<C-h>"] = function()
								-- go to home dir
							end,
							["<C-c>"] = fb_actions.create,
						},
						["n"] = {
							-- your custom normal mode mappings
							-- thd xues
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("file_browser")
		telescope.load_extension("aerial")
	end,
}
