local settings = {}
local homedir = vim.fn.expand("$HOME")

if vim.fn.getcwd():match(homedir .. "/workspace/zenpayroll") then
	settings.file_find_cmd = ":FzfLua files<CR>"

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
	settings.fzf_lua_layout_strategy = "vertical"

	settings.lualine_context_fn = function()
		local join = function(parent, child)
			if parent then
				return parent .. "/" .. child
			else
				return child
			end
		end

		local path = vim.fn.expand("%:.") -- path relative to cwd
		local _, _, parent = string.find(path, "([^/]+)/[^/]*$")
		local _, _, pack = string.find(path, "^packs/([^/]+)/")
		local _, _, component = string.find(path, "^frontend/javascripts.*/components/([^/]+)/")
		local _, _, page = string.find(path, "^frontend/javascripts.*/pages/([^/]+)/")
		local _, _, js_subdir = string.find(path, "^frontend/javascripts/([^/]+)/")
		local _, _, js_package = string.find(path, "^frontend/javascripts/packages/([^/]+)/")

		if js_subdir == "pages" or js_subdir == "components" then
			js_subdir = nil
		end

		if pack then
			return " " .. pack
		elseif component then
			return "ﰆ " .. join(js_package or js_subdir, component)
		elseif page then
			return "ﯺ " .. join(js_package or js_subdir, page)
		elseif js_package or js_subdir then
			return " " .. (js_package or js_subdir)
		elseif parent then
			return " " .. parent
		else
			return ""
		end
	end
end

return settings
