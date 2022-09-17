local action_state = require("telescope.actions.state")
local fb = require("telescope").extensions.file_browser
local live_grep_args = require("telescope").extensions.live_grep_args

return {
	select_dir_for_grep = function(prompt_bufnr)
		local current_picker = action_state.get_current_picker(prompt_bufnr)
		local current_line = action_state.get_current_line() -- the current prompt contents, I think?

		fb.file_browser({
			files = false,
			depth = false,
			attach_mappings = function(prompt_bufnr)
				require("telescope.actions").select_default:replace(function()
					local fb_picker = action_state.get_current_picker(prompt_bufnr)
					local fb_finder = fb_picker.finder
					local entry_path = action_state.get_selected_entry().Path

					fb_finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()

					live_grep_args.live_grep_args({
						cwd = fb_finder.path,
						default_text = current_line,
					})
				end)

				return true
			end,
		})
	end,
}
