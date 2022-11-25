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

		local servers = settings.nvim_lsp_servers
			or {
				"tsserver",
				"rust_analyzer",
				"prismals",

				{
					"solargraph",
					{
						init_options = { formatting = false },
						settings = {
							solargraph = {
								diagnostics = false,
							},
						},
					},
				},
			}

		for _, lsp in ipairs(servers) do
			local name = type(lsp) == "table" and lsp[1] or lsp
			local config = type(lsp) == "table" and lsp[2] or {}

			lspconfig[name].setup(config)
		end
	end,
}
