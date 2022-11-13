return {
	"hrsh7th/nvim-cmp",

	requires = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"zbirenbaum/copilot.lua",
		"L3MON4D3/LuaSnip",
	},

	after = "nvim-autopairs",

	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local functions = require("functions")
		local luasnip = require("luasnip")

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local kind_icons = {
			Class = " ",
			Color = " ",
			Constant = "ﲀ ",
			Constructor = " ",
			Copilot = "",
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
			buffer = "(Buffer)",
			calc = "(Calc)",
			cmp_tabnine = "(Tabnine)",
			copilot = "(Copilot)",
			emoji = "(Emoji)",
			luasnip = "(Snippet)",
			nvim_lsp = "(LSP)",
			path = "(Path)",
			tmux = "(TMUX)",
			vsnip = "(Snippet)",
		}

		local duplicates = {
			nvim_lsp = 1,
		}

		local max_width = 50

		cmp.setup({
			completion = {
				autocomplete = { "TextChanged" },
			},

			mapping = {
				-- SUPER tab: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable() then
						luasnip.jump()
					elseif cmp.visible() then
						cmp.select_next_item()
					-- elseif has_words_before() then
					-- 	cmp.complete({
					-- 		reason = cmp.ContextReason.Auto,
					-- 	})
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					local copilot = require("copilot.suggestion")

					if cmp.visible() then
						cmp.select_prev_item()
					elseif copilot.is_visible() then
						copilot.accept()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- https://github.com/zbirenbaum/copilot-cmp#configuration
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.get_selected_entry() then
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
						})()
					else
						fallback()
					end
				end),

				["<BS>"] = cmp.mapping(function(fallback)
					if cmp.get_selected_entry() then
						-- cancel cmp, but only if an item has been selected
						cmp.mapping.abort()()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-u>"] = cmp.mapping.scroll_docs(-4),

				["<C-d>"] = cmp.mapping.scroll_docs(4),
			},

			performance = {
				fetching_timeout = 500,
			},

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "luasnip", priority = 2 },
				{ name = "path", priority = 3 },
				{ name = "copilot", priority = 3 },
				{ name = "nvim_lsp", priority = 1 },
				{
					name = "buffer",
					priority = 3,
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

		-- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
