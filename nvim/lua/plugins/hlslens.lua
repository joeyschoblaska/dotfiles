return {
	"kevinhwang91/nvim-hlslens",
	commit = "cad6ce2e0d4f9c26467712791a70fae9d0b0b6cf",

	config = function()
		require("hlslens").setup({
			calm_down = true,
			nearest_float_when = "never",
		})
	end,
}
