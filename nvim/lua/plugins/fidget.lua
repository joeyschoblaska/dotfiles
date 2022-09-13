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
			},
		})
	end,
}
