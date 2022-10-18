-- bg = "#1a1b26",
-- bg_dark = "#16161e",
-- bg_float = "#16161e",
-- bg_highlight = "#292e42",
-- bg_popup = "#16161e",
-- bg_search = "#3d59a1",
-- bg_sidebar = "#16161e",
-- bg_statusline = "#16161e",
-- bg_visual = "#33467c",
-- black = "#15161e",
-- blue = "#7aa2f7",
-- blue0 = "#3d59a1",
-- blue1 = "#2ac3de",
-- blue2 = "#0db9d7",
-- blue5 = "#89ddff",
-- blue6 = "#b4f9f8",
-- blue7 = "#394b70",
-- border = "#15161e",
-- border_highlight = "#3d59a1",
-- comment = "#565f89",
-- cyan = "#7dcfff",
-- dark3 = "#545c7e",
-- dark5 = "#737aa2",
-- diff = {
--   add = "#20303b",
--   change = "#1f2231",
--   delete = "#37222c",
--   text = "#394b70"
-- },
-- error = "#db4b4b",
-- fg = "#c0caf5",
-- fg_dark = "#a9b1d6",
-- fg_gutter = "#3b4261",
-- fg_sidebar = "#a9b1d6",
-- git = {
--   add = "#2c6c75",
--   change = "#6183b9",
--   delete = "#914c54",
--   ignore = "#545c7e"
-- },
-- gitSigns = {
--   add = "#266d6a",
--   change = "#526c9e",
--   delete = "#b2555b"
-- },
-- green = "#9ece6a",
-- green1 = "#73daca",
-- green2 = "#41a6b5",
-- hint = "#1abc9c",
-- info = "#0db9d7",
-- magenta = "#bb9af7",
-- magenta2 = "#ff007c",
-- none = "NONE",
-- orange = "#ff9e64",
-- purple = "#9d7cd8",
-- red = "#f7768e",
-- red1 = "#db4b4b",
-- teal = "#1abc9c",
-- terminal_black = "#414868",
-- warning = "#e0af68",
-- yellow = "#e0af68"

return {
	"folke/tokyonight.nvim",
	after = "indent-blankline.nvim",
	config = function()
		require("tokyonight").setup({
			style = "night",

			on_colors = function(colors)
				local util = require("tokyonight.util")

				-- make comments a little brighter
				colors.comment = util.blend(colors.comment, colors.fg, 0.8)
			end,

			on_highlights = function(hl, c)
				local util = require("tokyonight.util")

				-- tabs
				hl.TabLineSel = { fg = c.fg, bg = c.bg }
				hl.TabLineSeparatorSel = { fg = c.green }
				hl.TabLineSeparator = { fg = c.comment }
				hl.TabLine = { fg = c.comment, bg = c.black }
				hl.TabLineFill = { bg = c.black }

				-- hlslens / search highlight
				local search_hl = c.cyan
				local search_hl_dark = util.blend(search_hl, c.bg, 0.35)
				local search_hl_darker = util.blend(search_hl, c.bg, 0.2)

				hl.IncSearch = { fg = c.bg, bg = search_hl }
				hl.Search = { fg = c.fg, bg = search_hl_dark }
				hl.HlSearchLens = { fg = util.blend(c.bg, c.fg, 0.5), bg = search_hl_darker }
				hl.HlSearchLensNear = { fg = c.fg, bg = search_hl_dark }
				hl.HlSearchFloat = { fg = c.fg, bg = search_hl_dark }

				-- indent-blankline
				hl.IndentBlanklineIndent1 = { fg = c.bg_highlight }
				hl.IndentBlanklineIndent2 = { fg = util.blend(c.bg_highlight, c.comment, 0.5) }

				-- leap
				hl.LeapBackdrop = { fg = c.comment }

				-- marks
				hl.MarkSignHL = { fg = c.orange }
				hl.MarkVirtTextHL = { fg = c.orange }

				-- gitsigns
				hl.GitSignsAdd = { fg = c.green }
				hl.GitSignsChange = { fg = c.yellow }
				hl.GitSignsDelete = { fg = c.red1 }

				-- diffview
				hl.DiffAdd = { bg = util.blend(c.green, c.black, 0.25) }
				hl.DiffDelete = { bg = util.blend(c.red, c.black, 0.25) }
				hl.DiffChange = { bg = util.blend(c.yellow, c.black, 0.15) }
				hl.DiffText = { bg = util.blend(c.yellow, c.black, 0.35) }

				-- copilot
				hl.CmpItemKindCopilot = { fg = c.purple }
			end,
		})

		vim.cmd("colorscheme tokyonight-night")
	end,
}
