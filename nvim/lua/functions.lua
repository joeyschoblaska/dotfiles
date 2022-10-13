M = {}

M.toggle_diagnostic_virtual_text = function()
	local new_val = not vim.g.diagnosticVirtualText
	vim.g.diagnosticVirtualText = new_val
	vim.diagnostic.config({
		virtual_text = new_val,
	})
end

M.leap_all_windows = function()
	require("leap").leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end

M.ts_select_dir_for_grep = function(prompt_bufnr)
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
end

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
}

return M
