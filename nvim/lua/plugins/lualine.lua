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

		local copilot = function(bufn)
			if vim.b.copilot_suggestion_auto_trigger then
				return " CPLT"
			else
				return ""
			end
		end

		local current_mark = function(bufn)
			return "m:" .. require("functions").bookmarks.get_current()
		end

		require("lualine").setup({
			theme = "tokyonight",

			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = { copilot },
				lualine_b = { current_mark },
				lualine_c = {},
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
