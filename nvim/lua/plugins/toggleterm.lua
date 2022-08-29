local present, _ = pcall(require, "toggleterm")

if present then
	local lazygit = require("toggleterm.terminal").Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",

		float_opts = {
			border = "curved",

			width = function(term)
				return vim.o.columns - 2
			end,

			height = function(term)
				return vim.o.lines - 2
			end,

			winblend = 0,
		},

		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
	})

	function _lazygit_toggle()
		lazygit:toggle()
	end
end

return {
	"akinsho/toggleterm.nvim",
	tag = "v2.*",

	config = function()
		require("toggleterm").setup()
	end,
}
