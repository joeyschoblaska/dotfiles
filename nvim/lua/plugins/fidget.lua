return {
	"j-hui/fidget.nvim",

	config = function()
		require("fidget").setup({
			window = {
				blend = 0,
			},
			timer = {
				spinner_rate = 125, -- frame rate of spinner animation, in ms
				fidget_decay = 500, -- how long to keep around empty fidget, in ms
				task_decay = 200, -- how long to keep around completed task, in ms
			},
			fmt = {
				stack_upwards = false,

				-- override the defaults just to add a little padding to the return string
				-- https://github.com/j-hui/fidget.nvim/blob/main/lua/fidget.lua#L51-L61
				fidget = function(fidget_name, spinner)
					return string.format("%s %s ", spinner, fidget_name)
				end,
				task = function(task_name, message, percentage)
					return string.format(
						" %s%s [%s] ",
						message,
						percentage and string.format(" (%.0f%%)", percentage) or "",
						task_name
					)
				end,
			},
		})
	end,
}
