return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "branch", "diff" },
				lualine_y = { "filetype" },
				lualine_z = { "filename" },
			},
		})
	end,
}
