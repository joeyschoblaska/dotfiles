return {
	"ibhagwan/fzf-lua",

	config = function()
		require("fzf-lua").setup({
			fzf_opts = {
				["--keep-right"] = "", -- not sure if this is working...
			},
			winopts = {
				width = 0.95,
				height = 0.95,

				hl = {
					normal = "Normal", -- window normal color (fg+bg)
					border = "TelescopeBorder", -- border color
					help_normal = "Normal", -- <F1> window normal
					help_border = "TelescopeBorder", -- <F1> window border

					-- Only used with the builtin previewer:
					cursor = "Cursor", -- cursor highlight (grep/LSP matches)
					cursorline = "CursorLine", -- cursor line
					cursorlinenr = "CursorLineNr", -- cursor line number
					search = "IncSearch", -- search matches (ctags|help)
					title = "Normal", -- preview border title (file/buffer)

					-- Only used with 'winopts.preview.scrollbar = 'float'
					scrollfloat_e = "PmenuSbar", -- scrollbar "empty" section highlight
					scrollfloat_f = "PmenuThumb", -- scrollbar "full" section highlight

					-- Only used with 'winopts.preview.scrollbar = 'border'
					scrollborder_e = "FloatBorder", -- scrollbar "empty" section highlight
					scrollborder_f = "FloatBorder", -- scrollbar "full" section highlight
				},

				preview = {
					horizontal = "right:50%",
					title_align = "center",
					delay = 0,
				},
			},
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
				},
				fzf = {
					["change"] = "first",
					["ctrl-d"] = "preview-page-down",
					["ctrl-u"] = "preview-page-up",
				},
			},
		})
	end,
}
