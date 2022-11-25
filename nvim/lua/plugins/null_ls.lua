return {
	"jose-elias-alvarez/null-ls.nvim",

	requires = { "nvim-lua/plenary.nvim", "lukas-reineke/lsp-format.nvim" },
	after = { "lsp-format.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local settings = require("settings")
		local sources = settings.null_ls_sources(null_ls)
			or {
				null_ls.builtins.formatting.stylua,

				null_ls.builtins.formatting.prettierd.with({
					-- defaults minus markdown
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

				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.prismaFmt,
			}

		null_ls.setup({
			sources = sources,
			on_attach = require("lsp-format").on_attach,
		})
	end,
}
