local settings = require("settings")

vim.g.mapleader = " "

local norm_silent = { noremap = true, silent = true }

local mappings = {
	-- fix for when I press, eg, CAPS + j to escape and go down, but hold CAPS
	-- too long and end up sending <Down> instead
	{ "i", "<Up>", "<Esc><Up><Right>", { noremap = true } },
	{ "i", "<Down>", "<Esc><Down><Right>", { noremap = true } },
	{ "i", "<Left>", "<Esc><Left><Right>", { noremap = true } },
	{ "i", "<Right>", "<Esc><Right><Right>", { noremap = true } },

	-- tabs
	{ "n", "<leader>1", "1gt<CR>" },
	{ "n", "<leader>2", "2gt<CR>" },
	{ "n", "<leader>3", "3gt<CR>" },
	{ "n", "<leader>4", "4gt<CR>" },
	{ "n", "<leader>5", "5gt<CR>" },
	{ "n", "<leader>6", "6gt<CR>" },
	{ "n", "<leader>7", "7gt<CR>" },
	{ "n", "<leader>8", "8gt<CR>" },
	{ "n", "<leader>9", "9gt<CR>" },
	{ "n", "<leader>0", ":tabnew<CR>:setlocal nobuflisted<CR>" }, -- nobuflisted: don't list empty tabs in buffer list

	-- telescope
	{ "n", "<leader>t", settings.file_find_cmd or ":Telescope find_files<CR>" },
	{ "n", "<leader>a", ":Telescope live_grep_args<CR>" },
	{ "v", "<leader>a", [["9y<ESC>:Telescope live_grep_args default_text=<c-r>9<CR>]] }, -- yank selection into reg 9 and grep for it
	{ "n", "<leader>km", ":Telescope keymaps<CR>" },
	{ "n", "<leader>be", ":Telescope buffers<CR>" },
	{ "n", "<leader>fb", ":Telescope file_browser<CR>" },
	{ "n", "<leader>fo", ":Telescope file_browser files=false<CR>" }, -- open browser in folder mode
	{ "n", "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>" }, -- open current file in browser
	{ "n", "<leader>fh", ":cd " .. vim.fn.getcwd() .. "<CR>" }, -- reset cwd to its value when vim session began
	{ "n", "<leader>gs", ":Telescope git_status<CR>" },
	{ "n", "<leader>gc", ":Telescope git_commits<CR>" },
	{ "n", "<leader>gb", ":Telescope git_branches<CR>" },
	{ "n", "<leader>nt", ":Telescope find_files cwd=$NOTES_DIR<CR>" },
	{ "n", "<leader>na", ":Telescope live_grep_args cwd=$NOTES_DIR<CR>" },

	-- symbols
	{ "n", "<leader>so", ":AerialOpen left<CR>" }, -- symbols outline (via aerial)

	-- [a f]ile
	{ "v", "af", ":<C-U>silent! normal! ggVG<CR>", { noremap = true } },
	{ "o", "af", ":normal Vaf<CR>" },

	-- yank to system clipboard
	{ "n", "<leader>y", [["+y]], { noremap = true } },
	{ "v", "<leader>y", [["+y]], { noremap = true } },

	-- death to smartquotes
	{ "n", "<leader>sq", [[:%s/’/'/ge<CR>:%s/‘/'/ge<CR>:%s/“/"/ge<CR>:%s/”/"/ge<CR>]], { silent = true } },

	-- use C-p to jump forward because C-i conflicts with Tab
	-- https://unix.stackexchange.com/a/563480
	{ "n", "<C-p>", "<C-i>", { noremap = true } },

	-- tab to switch windows
	{ "n", "<Tab>", "<C-W>w", { noremap = true } },

	-- allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
	-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
	-- empty mode is same as using <cmd> :map
	-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
	{ "n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true } },
	{ "n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true } },
	{ "n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true } },
	{ "n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true } },

	-- open lazygit (function is defined in plugins.toggleterm)
	{ "n", "<leader>lg", ":lua _lazygit_toggle()<CR>", norm_silent },

	-- resend the last line in the next tmux window
	{ "n", "<leader>ll", [[:SlimeSend0 "!!\r"<CR>]], norm_silent },

	-- hlslens
	{
		"n",
		"n",
		[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
		norm_silent,
	},
	{
		"n",
		"N",
		[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
		norm_silent,
	},
	{ "n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], norm_silent },
	{ "n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], norm_silent },
	{ "n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], norm_silent },
	{ "n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], norm_silent },
	{ "n", "<Esc>", ":noh<CR>", norm_silent },
}

for _, m in ipairs(mappings) do
	vim.api.nvim_set_keymap(m[1], m[2], m[3], m[4] or {})
end

-- format synchronously when saving + quitting
-- https://github.com/lukas-reineke/lsp-format.nvim#wq-will-not-format-when-not-using-sync
vim.cmd([[cabbrev wq execute "Format sync" <bar> wq]])
