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
	{ "v", "<leader>a", [["9y<ESC>:Telescope live_grep_args default_text=<C-r>9<CR>]] }, -- yank selection into reg 9 and grep for it
	{ "n", "<leader>km", ":Telescope keymaps<CR>" },
	{ "n", "<leader>be", ":Telescope buffers<CR>" }, -- buffer explore
	{ "n", "<leader>fb", ":Telescope file_browser<CR>" },
	{ "n", "<leader>fo", ":Telescope file_browser files=false<CR>" }, -- open browser in folder mode
	{ "n", "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>" }, -- open current file in browser
	{ "n", "<leader>fh", ":cd " .. vim.fn.getcwd() .. "<CR>" }, -- reset cwd to its value when vim session began
	{ "n", "<leader>ba", ":Telescope live_grep grep_open_files=true<CR>" }, -- live grep in all open buffers
	{ "v", "<leader>ba", [["9y<ESC>:Telescope live_grep grep_open_files=true default_text=<C-r>9<CR>]] }, -- yank selection into reg 9 and grep open files for it

	-- notes
	{ "n", "<leader>nt", ":Telescope find_files hidden=false cwd=$NOTES_DIR<CR>" }, -- open file in notes dir
	{ "n", "<leader>na", ":Telescope live_grep_args cwd=$NOTES_DIR<CR>" }, -- grep in notes dir
	{ "n", "<leader>no", [[:exec '!open obsidian://open?path="' . expand('%:.') . '"'<CR><CR>]] }, -- open file in obsidian (https://help.obsidian.md/Advanced+topics/Using+obsidian+URI)

	-- copy path to current file to system clipboard
	{ "n", "<leader>fc", ":let @+ = expand('%:.')<CR>" },

	-- symbols / lsp
	{ "n", "<leader>so", ":AerialOpen float<CR>" }, -- symbols outline (via aerial)
	{ "n", "gd", ":Telescope lsp_definitions<CR>" },
	{ "n", "gr", ":Telescope lsp_references<CR>" },
	{ "n", "K", ":lua vim.lsp.buf.hover()<CR>" },
	{ "n", "<leader>er", ":TroubleToggle workspace_diagnostics<CR>" }, -- toggle diagnostics window (ERrors)
	{ "n", "<leader>ws", ":Telescope lsp_dynamic_workspace_symbols<CR>" },
	{ "n", "E", [[:lua require("functions").toggle_diagnostic_virtual_text()<CR>]], norm_silent },

	-- git
	{ "n", "<leader>gs", ":Telescope git_status<CR>" },
	{ "n", "<leader>gc", ":Telescope git_commits<CR>" },
	{ "n", "<leader>gb", ":Telescope git_branches<CR>" },
	{ "n", "<leader>lg", ":lua _lazygit_toggle()<CR>", norm_silent },
	{ "n", "<leader>gh", ":DiffviewFileHistory %<CR>", norm_silent }, -- git history for current file
	{ "n", "<leader>gd", ":DiffviewOpen main...head<CR>", norm_silent }, -- git diff for current branch against main

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

	-- resend the last line in the next tmux window
	{ "n", "<leader>ll", [[:SlimeSend0 "!!\r"<CR>]], norm_silent },

	-- hlslens (these mappings are part of the setup instructions)
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
	{ "n", "<Esc>", ":noh<CR>", norm_silent }, -- clear highlights on escape

	-- markdown preview
	{ "n", "<leader>mp", ":MarkdownPreview<CR>" },

	-- leap
	{ "n", "s", [[:lua require("functions").leap_all_windows()<CR>]], norm_silent },

	-- marks
	{ "n", "m1", [[:lua require("functions").bookmarks.set_current(1)<CR>:echo "set mark 1"<CR>]] },
	{ "n", "m2", [[:lua require("functions").bookmarks.set_current(2)<CR>:echo "set mark 2"<CR>]] },
	{ "n", "m3", [[:lua require("functions").bookmarks.set_current(3)<CR>:echo "set mark 3"<CR>]] },
	{ "n", "m4", [[:lua require("functions").bookmarks.set_current(4)<CR>:echo "set mark 4"<CR>]] },
	{ "n", "m5", [[:lua require("functions").bookmarks.set_current(5)<CR>:echo "set mark 5"<CR>]] },
	{ "n", "m6", [[:lua require("functions").bookmarks.set_current(6)<CR>:echo "set mark 6"<CR>]] },
	{ "n", "m7", [[:lua require("functions").bookmarks.set_current(7)<CR>:echo "set mark 7"<CR>]] },
	{ "n", "m8", [[:lua require("functions").bookmarks.set_current(8)<CR>:echo "set mark 8"<CR>]] },
	{ "n", "m9", [[:lua require("functions").bookmarks.set_current(9)<CR>:echo "set mark 9"<CR>]] },
	{ "n", "m0", [[:lua require("functions").bookmarks.set_current(0)<CR>:echo "set mark 0"<CR>]] },
	{ "n", "mm", [[:lua require("functions").bookmarks.set()<CR>]], norm_silent },
	{ "n", "mc", [[:lua require("functions").bookmarks.delete_all()<CR>]], norm_silent }, -- (m)arks (c)lear
	{ "n", "md", [[:lua require("marks").delete_bookmark()<CR>]], norm_silent }, -- (m)arks (d)elete
	{ "n", "ml", [[:lua require("functions").bookmarks.quickfix()<CR>:Trouble quickfix<CR>]], norm_silent },
	{ "n", "ma", [[:lua require("marks").annotate()<CR>]], norm_silent },
	{ "n", "<", [[:lua require("functions").bookmarks.prev()<CR>]], norm_silent },
	{ "n", ">", [[:lua require("functions").bookmarks.next()<CR>]], norm_silent },

	-- jargon
	{ "n", "<leader>ja", [[:lua require("functions").jargon_insert_header()<CR>]], norm_silent },

	-- copilot
	{ "n", "<leader>co", [[:lua require("copilot.suggestion").toggle_auto_trigger()<CR>]], norm_silent },
}

for _, m in ipairs(mappings) do
	vim.api.nvim_set_keymap(m[1], m[2], m[3], m[4] or {})
end

-- format synchronously when saving + quitting
-- https://github.com/lukas-reineke/lsp-format.nvim#wq-will-not-format-when-not-using-sync
vim.cmd([[cabbrev wq execute "Format sync" <bar> wq]])
