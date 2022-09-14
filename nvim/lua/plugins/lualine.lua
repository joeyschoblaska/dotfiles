return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local settings = require("settings")

		local context = settings.lualine_context_fn
			or function()
				local path = vim.fn.expand("%:.") -- path relative to cwd
				local _, _, parent = string.find(path, "([^/]+)/[^/]*$")

				if parent then
					return " " .. parent
				else
					return ""
				end
			end

		require("lualine").setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {
					{ "diagnostics", sources = { "nvim_workspace_diagnostic" } },
					{ "branch", separator = "" },
					{ "diff", padding = { left = 0, right = 1 } },
				},
				lualine_y = { context },
				lualine_z = {
					{
						"filetype",
						icon_only = true,
						colored = false,
						separator = "",
						padding = { right = 0, left = 1 },
					},
					"filename",
				},
			},
		})
	end,
}
