M = {}

M.toggle_diagnostic_virtual_text = function()
	local new_val = not vim.g.diagnosticVirtualText
	vim.g.diagnosticVirtualText = new_val
	vim.diagnostic.config({
		virtual_text = new_val,
	})
end

M.cmp = {
	is_enabled = function()
		if vim.b.autoCmpIsEnabled == nil then
			-- enabled by default, so if buffer val is nil then auto cmp is enabled
			return true
		else
			return vim.b.autoCmpIsEnabled
		end
	end,

	toggle = function()
		vim.b.autoCmpIsEnabled = not require("functions").cmp.is_enabled()

		if vim.b.autoCmpIsEnabled then
			require("functions").copilot.disable()
			require("functions").cmp.enable()
		else
			require("functions").cmp.disable()
		end
	end,

	disable = function()
		vim.b.autoCmpIsEnabled = false

		require("cmp").setup.buffer({
			completion = {
				autocomplete = false,
			},
		})
	end,

	enable = function()
		vim.b.autoCmpIsEnabled = true

		require("cmp").setup.buffer({
			completion = {
				autocomplete = { "TextChanged" },
			},
		})
	end,
}

M.copilot = {
	toggle = function()
		if vim.b.copilot_suggestion_auto_trigger then
			require("functions").copilot.disable()
		else
			require("functions").cmp.disable()
			require("functions").copilot.enable()
		end
	end,

	enable = function()
		if not vim.b.copilot_suggestion_auto_trigger then
			require("copilot.suggestion").toggle_auto_trigger()
		end
	end,

	disable = function()
		if vim.b.copilot_suggestion_auto_trigger then
			require("copilot.suggestion").toggle_auto_trigger()
		end
	end,
}

M.leap_all_windows = function()
	require("leap").leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end

M.telescope = {
	select_dir_for_grep = function(prompt_bufnr)
		local action_state = require("telescope.actions.state")
		local fb = require("telescope").extensions.file_browser
		local lga = require("telescope").extensions.live_grep_args
		local current_line = action_state.get_current_line()

		fb.file_browser({
			files = false,
			depth = false,
			attach_mappings = function(prompt_bufnr)
				require("telescope.actions").select_default:replace(function()
					local entry_path = action_state.get_selected_entry().Path
					local dir = entry_path:is_dir() and entry_path or entry_path:parent()
					local relative = dir:make_relative(vim.fn.getcwd())
					local absolute = dir:absolute()

					lga.live_grep_args({
						results_title = relative .. "/",
						cwd = absolute,
						default_text = current_line,
					})
				end)

				return true
			end,
		})
	end,
}

M.jargon_insert_header = function()
	local line = vim.api.nvim_win_get_cursor(0)[1]

	vim.api.nvim_buf_set_lines(0, line, line, false, {
		"",
		"## ",
		"---",
		"datetime: " .. string.gsub(vim.fn.system("date -u -Iseconds"), "\n", ""),
		"tags: ",
		"public: false",
		"---",
	})

	vim.api.nvim_feedkeys("jjA", "n", false)
end

M.bookmarks = {
	set_current = function(n)
		vim.g.currentBookmarkNumber = n
	end,

	get_current = function()
		return vim.g.currentBookmarkNumber or 1
	end,

	next = function()
		local current = require("functions").bookmarks.get_current()

		if current == "git" then
			require("gitsigns").next_hunk()
		else
			require("marks")["next_bookmark" .. current]()
		end
	end,

	prev = function()
		local current = require("functions").bookmarks.get_current()

		if current == "git" then
			require("gitsigns").prev_hunk()
		else
			require("marks")["prev_bookmark" .. current]()
		end
	end,

	set = function()
		local current = require("functions").bookmarks.get_current()

		if current ~= "git" then
			require("marks")["set_bookmark" .. current]()
		end
	end,

	delete_all = function()
		local current = require("functions").bookmarks.get_current()

		if current ~= "git" then
			require("marks")["delete_bookmark" .. current]()
		end
	end,

	quickfix = function()
		local current = require("functions").bookmarks.get_current()

		if current == "git" then
			print("TODO")
		else
			require("marks").bookmark_state:to_list("quickfixlist", current)
		end
	end,
}

-- https://www.reddit.com/r/neovim/comments/nrz9hp/comment/h0lg5m1/?utm_source=reddit&utm_medium=web2x&context=3
M.close_floating_windows = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

M.reset = function()
	local luasnip = require("luasnip")
	local functions = require("functions")

	vim.cmd("noh") -- clear highlights
	functions.close_floating_windows()

	-- cancel active luasnip, if any
	if luasnip.get_active_snip() then
		luasnip.unlink_current()
	end
end

return M
