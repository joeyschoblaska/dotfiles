local settings = {}
local homedir = vim.fn.expand("$HOME")

if vim.fn.getcwd():match(homedir .. "/workspace/zenpayroll") then
	settings.file_find_cmd = ":FzfLua files <CR>"

	settings.null_ls_sources = function(null_ls)
		return {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.rubocop.with({
				command = "/Users/joey.schoblaska/projects/utils/rubocop_server",
			}),
			null_ls.builtins.diagnostics.rubocop.with({
				command = "/Users/joey.schoblaska/projects/utils/rubocop_server",
			}),
		}
	end

	settings.nvim_lsp_servers = { "sorbet", "solargraph" }
end

return settings
