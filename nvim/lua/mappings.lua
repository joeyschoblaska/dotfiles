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
	{ "n", "<leader>fh", ":cd " .. vim.fn.getcwd() .. "<CR>" }, -- reset cwd to its value when vim session began
	{ "n", "<leader>ba", ":Telescope live_grep grep_open_files=true<CR>" }, -- live grep in all open buffers
	{ "v", "<leader>ba", [["9y<ESC>:Telescope live_grep grep_open_files=true default_text=<C-r>9<CR>]] }, -- yank selection into reg 9 and grep open files for it

	-- file browsing
	{ "n", "<leader>fb", ":NvimTreeToggle<CR>" },
	{ "n", "<leader>ff", ":NvimTreeFindFile<CR>" }, -- open current file in browser
	{ "n", "<leader>fo", ":Telescope file_browser files=false<CR>" }, -- open browser in folder mode
	{ "n", "<leader>ft", ":Telescope file_browser path=%:p:h select_buffer=true<CR>" }, -- open current file in browser

	-- notes
	{ "n", "<leader>nt", ":Telescope find_files hidden=false cwd=$NOTES_DIR<CR>" }, -- open file in notes dir
	{ "n", "<leader>na", ":Telescope live_grep_args cwd=$NOTES_DIR<CR>" }, -- grep in notes dir
	{ "n", "<leader>no", [[:exec '!open obsidian://open?path="' . expand('%:.') . '"'<CR><CR>]] }, -- open file in obsidian (https://help.obsidian.md/Advanced+topics/Using+obsidian+URI)

	-- copy path to current file to system clipboard
	{ "n", "<leader>fc", [[:let @+ = expand('%:.')<CR>:echo "copied file path"<CR>]], norm_silent },

	-- symbols / lsp
	{ "n", "<leader>so", ":AerialOpen float<CR>" }, -- symbols outline (via aerial)
	{ "n", "gd", ":lua vim.lsp.buf.definition()<CR>" },
	{ "n", "gr", ":Telescope lsp_references<CR>" },
	{ "n", "K", ":lua vim.lsp.buf.hover()<CR>" },
	{ "n", "<leader>ws", ":Telescope lsp_dynamic_workspace_symbols<CR>" },
	-- { "n", "E", [[:lua require("functions").toggle_diagnostic_virtual_text()<CR>]], norm_silent },
	{ "n", "E", [[:lua vim.diagnostic.open_float({ border = "rounded" })<CR>]], norm_silent },
	{ "n", "<leader>ca", ":CodeActionMenu<CR>" },

	-- git
	{ "n", "<leader>gc", ":Telescope git_commits<CR>" },
	{ "n", "<leader>gb", [[:lua require("gitsigns").blame_line{full=true}<CR>]] },
	{ "n", "<leader>lg", ":lua _lazygit_toggle()<CR>", norm_silent },
	{ "n", "<leader>gh", ":DiffviewFileHistory %<CR>", norm_silent }, -- git history for current file
	{ "n", "<leader>gd", ":DiffviewOpen main...head<CR>", norm_silent }, -- git diff for current branch against main
	{ "n", "<leader>gp", ":Gitsigns preview_hunk<CR>", norm_silent },
	{ "n", "<leader>gs", ":DiffviewOpen<CR>" },

	-- [a f]ile
	{ "v", "af", ":<C-U>silent! normal! ggVG<CR>", { noremap = true } },
	{ "o", "af", ":normal Vaf<CR>" },

	-- yank to system clipboard
	{ "n", "<leader>y", [["+y]], { noremap = true } },
	{ "v", "<leader>y", [["+y]], { noremap = true } },

	-- death to smartquotes
	{ "n", "<leader>sq", [[:%s/???/'/ge<CR>:%s/???/'/ge<CR>:%s/???/"/ge<CR>:%s/???/"/ge<CR>]], { silent = true } },

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
	{ "n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]], norm_silent },
	{ "n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]], norm_silent },
	{ "n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]], norm_silent },
	{ "n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]], norm_silent },

	-- clear highlights and close floating windows on escape
	{ "n", "<Esc>", [[:lua require("functions").reset()<CR>]], norm_silent },

	-- markdown preview
	{ "n", "<leader>mp", ":MarkdownPreview<CR>" },

	-- leap
	{ "n", "s", [[:lua require("functions").leap_all_windows()<CR>]], norm_silent },

	-- marks
	{ "n", "m1", [[:lua require("functions").bookmarks.set_current(1)<CR>]], norm_silent },
	{ "n", "m2", [[:lua require("functions").bookmarks.set_current(2)<CR>]], norm_silent },
	{ "n", "m3", [[:lua require("functions").bookmarks.set_current(3)<CR>]], norm_silent },
	{ "n", "m4", [[:lua require("functions").bookmarks.set_current(4)<CR>]], norm_silent },
	{ "n", "m5", [[:lua require("functions").bookmarks.set_current(5)<CR>]], norm_silent },
	{ "n", "m6", [[:lua require("functions").bookmarks.set_current(6)<CR>]], norm_silent },
	{ "n", "m7", [[:lua require("functions").bookmarks.set_current(7)<CR>]], norm_silent },
	{ "n", "m8", [[:lua require("functions").bookmarks.set_current(8)<CR>]], norm_silent },
	{ "n", "m9", [[:lua require("functions").bookmarks.set_current(9)<CR>]], norm_silent },
	{ "n", "m0", [[:lua require("functions").bookmarks.set_current(0)<CR>]], norm_silent },
	{ "n", "mg", [[:lua require("functions").bookmarks.set_current("git")<CR>]], norm_silent },
	{ "n", "mm", [[:lua require("functions").bookmarks.set()<CR>]], norm_silent },
	{ "n", "mc", [[:lua require("functions").bookmarks.delete_all()<CR>]], norm_silent }, -- (m)arks (c)lear
	{ "n", "md", [[:lua require("marks").delete_bookmark()<CR>]], norm_silent }, -- (m)ark (d)elete
	{ "n", "ml", [[:lua require("functions").bookmarks.quickfix()<CR>:copen<CR>]], norm_silent },
	{ "n", "ma", [[:lua require("marks").annotate()<CR>]], norm_silent },
	{ "n", "<", [[:lua require("functions").bookmarks.prev()<CR>]], norm_silent },
	{ "n", ">", [[:lua require("functions").bookmarks.next()<CR>]], norm_silent },

	-- jargon
	{ "n", "<leader>ja", [[:lua require("functions").jargon_insert_header()<CR>]], norm_silent },

	-- copilot
	{ "n", "<leader>co", [[:lua require("functions").copilot.toggle()<CR>]], norm_silent },

	-- nvim-cmp
	{ "n", "<leader>cm", [[:lua require("functions").auto_cmp.toggle()<CR>]], norm_silent },
}

for _, m in ipairs(mappings) do
	vim.api.nvim_set_keymap(m[1], m[2], m[3], m[4] or {})
end

-- format synchronously when saving + quitting
-- https://github.com/lukas-reineke/lsp-format.nvim#wq-will-not-format-when-not-using-sync
vim.cmd([[cabbrev wq execute "Format sync" <bar> wq]])
