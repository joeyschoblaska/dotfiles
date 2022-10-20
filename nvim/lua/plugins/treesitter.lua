return {
	"nvim-treesitter/nvim-treesitter",

	requires = {
		"RRethy/nvim-treesitter-endwise",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"omnisyle/nvim-hidesig",
	},

	run = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			ignore_install = { "phpdoc" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "ruby" } },
			endwise = { enable = true },
			autotag = { enable = true },
			context_commentstring = {
				enable = true,
			},
			hidesig = {
				enable = true,
				opacity = 0.75,
				delay = 200,
			},
		})
	end,
}
