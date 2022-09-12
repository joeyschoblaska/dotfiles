return {
	"neovim/nvim-lspconfig",

	config = function()
		local lspconfig = require("lspconfig")
		local settings = require("settings")

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.cmd("hi clear " .. hl)
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end

		local servers = settings.nvim_lsp_servers or {}

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
				},
			})
		end
	end,
}
