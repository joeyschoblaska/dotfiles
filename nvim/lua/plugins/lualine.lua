return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local settings = require("settings")

		-- if on a git branch that starts with "jms.", only show portion of the
		-- branch name after the final period.
		-- eg: "jms.JIRA-1234.implement-foo" -> "implement-foo"
		local shortgit = function(branch)
			if string.find(branch, "^jms%..") then
				local _, _, description = string.find(branch, "%.([^%.]+)$")
				return description or branch
			else
				return branch
			end
		end

		local context = settings.lualine_context_fn
			or function()
				local path = vim.fn.expand("%:.") -- path relative to cwd
				local _, _, parent = string.find(path, "([^/]+)/[^/]*$")

				return parent and (" " .. parent) or ""
			end

		local current_line_diagnostics = function()
			local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()

			if not next(diagnostics) then
				return ""
			end

			local hl_groups = {
				"DiagnosticError",
				"DiagnosticWarn",
				"DiagnosticInfo",
				"DiagnosticHint",
			}

			local signs = { " ", " ", " ", " " }
			local severity = diagnostics[1].severity
			local message = diagnostics[1].message

			return "%#" .. hl_groups[severity] .. "#" .. signs[severity] .. message
		end

		require("lualine").setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { current_line_diagnostics },
				lualine_x = {
					{ "diagnostics", sources = { "nvim_workspace_diagnostic" } },
					{ "branch", separator = "", fmt = shortgit },
					{ "diff", padding = { left = 0, right = 1 } },
				},
				lualine_y = { context },
				lualine_z = {
					{
						"filetype",
						icon_only = true,
						colored = false,
						separator = "",
						padding = { left = 1, right = 0 },
					},
					"filename",
				},
			},
		})
	end,
}
