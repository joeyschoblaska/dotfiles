-- if vim.fn.getcwd():match(homedir .. "/projects/dotfiles") then
-- 	settings.catppuccin_flavor = "frappe"
-- else
-- 	settings.catppuccin_flavor = "mocha"
-- end

return {
	file_find_cmd = ":FzfLua files <CR>",

	null_ls_sources = function(null_ls)
		return {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.rubocop.with({
				command = "bin/rubocop_server",
			}),
			null_ls.builtins.diagnostics.rubocop.with({
				command = "bin/rubocop_server",
			}),
		}
	end,
}
