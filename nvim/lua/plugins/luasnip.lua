return {
	"L3MON4D3/LuaSnip",

	requires = "rafamadriz/friendly-snippets",

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		require("luasnip").setup({
			region_check_events = "CursorMoved",
		})
	end,
}
