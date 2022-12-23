return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 45,
				adaptive_size = true,
				centralize_selection = true,
				mappings = {
					list = {
						{ key = "s", action = "" },
					},
				},
			},
			renderer = {
				group_empty = true,
				highlight_opened_files = "all",
			},
			actions = {
				open_file = {
					quit_on_open = true,
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}
