return {
	"joeyschoblaska/nvim-hlslens",
	branch = "noh-insert",
	config = function()
		require("hlslens").setup({
			calm_down = true,
			nearest_float_when = "never",
		})
	end,
}
