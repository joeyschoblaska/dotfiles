return {
	"jose-elias-alvarez/null-ls.nvim",

	requires = { "nvim-lua/plenary.nvim", "lukas-reineke/lsp-format.nvim" },
	after = { "lsp-format.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local settings = require("settings")

		null_ls.setup({
			sources = settings.null_ls_sources or {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"css",
						"graphql",
						"handlebars",
						"html",
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"less",
						"scss",
						"typescript",
						"typescriptreact",
						"vue",
						"yaml",
					},

					extra_filetypes = { "ruby" },
				}),
			},

			on_attach = require("lsp-format").on_attach,
		})
	end,
}
