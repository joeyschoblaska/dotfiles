return {
	"L3MON4D3/LuaSnip",

	requires = { {
		"joeyschoblaska/friendly-snippets",
		branch = "joey",
	} },

	config = function()
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		luasnip.filetype_extend("ruby", { "rails" })

		luasnip.setup({
			region_check_events = "CursorMovedI,CursorMoved",
		})
	end,
}
