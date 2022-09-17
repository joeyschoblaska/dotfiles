local action_state = require("telescope.actions.state")
local fb = require("telescope").extensions.file_browser
local lga = require("telescope").extensions.live_grep_args

return {
	select_dir_for_grep = function(prompt_bufnr)
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
