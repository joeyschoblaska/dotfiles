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
			}),
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.diagnostics.eslint_d,
		}
	end

	settings.nvim_lsp_servers = { "sorbet" }

	settings.telescope_layout_strategy = "vertical"
	settings.fzf_lua_layout_strategy = "vertical"

	settings.lualine_context_fn = function()
		local join = function(parent, child)
			return parent and (parent .. "/" .. child) or child
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

	settings.telescope_path_display = function(opts, path)
		local replacements = {
			{ vim.loop.cwd(), "" },
			{ "^/", "" },
			{ "^packs/", "p/" },
			{ "^frontend/javascripts/", "fe/js/" },
			{ "/app/controllers/", "/a/c/" },
			{ "/app/models/", "/a/m/" },
			{ "/app/services/", "/a/s/" },
			{ "/app/helpers/", "/a/h/" },
			{ "/app/views/", "/a/v/" },
			{ "/app/lib/", "/a/l/" },
			{ "/app/public/", "/a/p/" },
			{ "/spec/controllers/", "/s/c/" },
			{ "/spec/models/", "/s/m/" },
			{ "/spec/services/", "/s/s/" },
			{ "/spec/helpers/", "/s/h/" },
			{ "/spec/views/", "/s/v/" },
			{ "/spec/lib/", "/s/l/" },
			{ "/spec/public/", "/s/p/" },
			{ "/packages/", "/pkgs/" },
			{ "/components/", "/cmps/" },
		}

		for _, r in ipairs(replacements) do
			path = string.gsub(path, r[1], r[2])
		end

		return path
	end
end

return settings
