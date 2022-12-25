return {
	"jose-elias-alvarez/typescript.nvim",
	config = function()
		require("typescript").setup({
			server = {
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "TypescriptAddMissingImports",
					})

					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "TypescriptOrganizeImports",
					})
				end,
			},
		})
	end,
}
