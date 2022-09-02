-- lunarvim config: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/cmp.lua

return {
	"hrsh7th/nvim-cmp",

	requires = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	after = "nvim-autopairs",

	config = function()
		local cmp = require("cmp")

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local kind_icons = {
			Class = " ",
			Color = " ",
			Constant = "ﲀ ",
			Constructor = " ",
			Enum = "練",
			EnumMember = " ",
			Event = " ",
			Field = " ",
			File = "",
			Folder = " ",
			Function = " ",
			Interface = "ﰮ ",
			Keyword = " ",
			Method = " ",
			Module = " ",
			Operator = "",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = " ",
			Unit = "塞",
			Value = " ",
			Variable = " ",
		}

		local source_names = {
			nvim_lsp = "(LSP)",
			emoji = "(Emoji)",
			path = "(Path)",
			calc = "(Calc)",
			cmp_tabnine = "(Tabnine)",
			vsnip = "(Snippet)",
			luasnip = "(Snippet)",
			buffer = "(Buffer)",
			tmux = "(TMUX)",
		}

		local duplicates = {
			buffer = 1,
			path = 1,
			nvim_lsp = 0,
			luasnip = 1,
		}

		local max_width = 50

		cmp.setup({
			completion = {
				autocomplete = false,
			},

			mapping = {
				-- SUPER tab: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- elseif luasnip.expand_or_jumpable() then
					-- 	luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete({
							reason = cmp.ContextReason.Auto,
						})
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "path" },
				{
					name = "buffer",
					option = {
						-- https://github.com/hrsh7th/cmp-buffer#all-buffers
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
			}),

			formatting = {
				fields = { "kind", "abbr", "menu" },

				format = function(entry, vim_item)
					if #vim_item.abbr > max_width then
						vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
					end

					vim_item.kind = kind_icons[vim_item.kind]
					vim_item.menu = source_names[entry.source.name] or entry.source.name

					-- :h complete-items
					-- dup   when non-zero this match will be added even when an
					-- 		   item with the same word is already present.
					vim_item.dup = duplicates[entry.source.name] or 0

					return vim_item
				end,
			},
		})
	end,
}
