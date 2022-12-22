return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 35,
				float = {
					enable = true,
					-- todo: make this dynamic https://pastebin.com/5Hi876Md
					open_win_config = {
						width = 50,
					},
				},
				mappings = {
					list = {
						{ key = "s", action = "" },
					},
				},
			},
			tab = {
				sync = {
					open = true,
					close = true,
					ignore = {},
				},
			},
		})
	end,
}
