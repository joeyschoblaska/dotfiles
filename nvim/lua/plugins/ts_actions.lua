local action_state = require("telescope.actions.state")
local fb = require("telescope").extensions.file_browser

return {
	-- I'm not doing this right at all
	-- maybe this? https://www.reddit.com/r/neovim/comments/n9vt6d/chaining_2_telescope_pickers/
	select_dir_for_grep = function(prompt_bufnr)
		local current_picker = action_state.get_current_picker(prompt_bufnr)
		local current_line = action_state.get_current_line() -- the current prompt contents, I think?

		fb.file_browser({
			files = false,
			depth = false,
			mappings = {
				i = {
					["<CR>"] = function(prompt_bufnr)
						local fb_picker = action_state.get_current_picker(prompt_bufnr)
						local fb_finder = fb_picker.finder
						local entry_path = action_state.get_selected_entry().Path

						fb_finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()

						require("telescope.builtin").live_grep({
							search_dirs = { fb_finder.path },
							default_text = current_line,
						})
					end,
				},
			},
		})
	end,

	grep_in_dir = function(prompt_bufnr)
		local current_picker = action_state.get_current_picker(prompt_bufnr)
		local finder = current_picker.finder
		local entry_path = action_state.get_selected_entry().Path

		finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()
		-- finder.cwd = finder.path
		-- telescope.builtin.live_grep({ cwd = finder.path })
		require("telescope.builtin").live_grep({ search_dirs = { finder.path } })
	end,
}
