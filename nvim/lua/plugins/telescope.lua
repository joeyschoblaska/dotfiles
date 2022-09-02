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

		telescope.load_extension("fzf")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("file_browser")
	end,
}
