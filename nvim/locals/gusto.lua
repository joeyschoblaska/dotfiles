local settings = {}
local homedir = vim.fn.expand("$HOME")

if vim.fn.getcwd():match(homedir .. "/workspace/zenpayroll") then
	settings.file_find_cmd = ":FzfLua files <CR>"

	settings.null_ls_sources = function(null_ls)
		local rcop_server = {
			command = "/Users/joey.schoblaska/projects/utils/rubocop_server",
		}

		return {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.rubocop.with(rcop_server),
			null_ls.builtins.diagnostics.rubocop.with(rcop_server),
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.eslint_d,
		}
	end

	settings.nvim_lsp_servers = { "sorbet", "solargraph", "tsserver" }
	settings.telescope_layout_strategy = "vertical"
end

return settings
