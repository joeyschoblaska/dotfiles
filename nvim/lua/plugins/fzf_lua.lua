return {
	"ibhagwan/fzf-lua",

	config = function()
		require("fzf-lua").setup({
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
					title_align = "center",
					delay = 0,
				},
			},
			keymap = {
				-- These override the default tables completely
				-- no need to set to `false` to disable a bind
				-- delete or modify is sufficient
				builtin = {
					-- neovim `:tmap` mappings for the fzf win
					-- ["<F1>"] = "toggle-help",
					-- ["<F2>"] = "toggle-fullscreen",
					-- Only valid with the 'builtin' previewer
					-- ["<F3>"] = "toggle-preview-wrap",
					-- ["<F4>"] = "toggle-preview",
					-- Rotate preview clockwise/counter-clockwise
					-- ["<F5>"] = "toggle-preview-ccw",
					-- ["<F6>"] = "toggle-preview-cw",
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
					-- ["<S-left>"] = "preview-page-reset",
				},
				fzf = {
					-- fzf '--bind=' options
					-- ["ctrl-z"] = "abort",
					-- ["ctrl-u"] = "unix-line-discard",
					-- ["ctrl-f"] = "half-page-down",
					-- ["ctrl-b"] = "half-page-up",
					-- ["ctrl-a"] = "beginning-of-line",
					-- ["ctrl-e"] = "end-of-line",
					-- ["alt-a"] = "toggle-all",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					-- ["f3"] = "toggle-preview-wrap",
					-- ["f4"] = "toggle-preview",
					["ctrl-d"] = "preview-page-down",
					["ctrl-u"] = "preview-page-up",
				},
			},
		})
	end,
}
