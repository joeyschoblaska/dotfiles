## Git
* octo.nvim
* easy way to browse history of a file
* easy way to git blame file / explore revisions
* easy way to explore PR diffs

## File browsing
* [telescope-file-browser tree view](https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/165#issuecomment-1242515366)
* telescope-fb: more intuitive mappings, especially in insert mode (eg, `imap <C-foo>` should always do the same as `nmap foo`)
* nmap h / imap <C-h> in file-browser resets cwd to project root (replace proof-of-concept <leader>fh mapping)
* monorepo ergonomics?
  * maybe a custom telescope picker to select packs, then file find and grep are scoped to just those packs: https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
  * or just additional mappings that scope file find or grep to the pack containing the current file
  * show current pack in lualine instead of file type

## Formatting
* range formatting, or format only new code (so I can use prettier / whatever in codebases that don't have a fixer set up)
* Fast JS / TS formatting for Gusto
  * https://www.npmjs.com/package/eslint_d ?

## LSP
* customize entry display for telescope lsp refs / defs (if possible?)
  * maybe here (ENTRY_DISPLAY): https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L2136
* integrate with nvim_cmp
* mason for server management
* new Ruby debugger stuff? https://blog.testdouble.com/talks/2022-08-22-debugging-ruby-on-rails-with-vscode/

## General editing
* for markdown editing, auto-insert bullets when starting a new line in a list
* treesitter for text objects? lua snippets? https://www.reddit.com/r/neovim/comments/v9e85n/what_do_you_use_treesitter_for_other_than/
* expirment with using nvim-cmp more normally? (have the window pop up automatically after a pause)

## Plugins
* automatically do PackerSync and MasonWhatever, as needed. maybe this? https://github.com/junnplus/lsp-setup.nvim#lua-dev
* lazy load plugins? (impatient.nvim?)
* maybe add JoosepAlviste/nvim-ts-context-commentstring once this is fixed: https://github.com/neovim/neovim/issues/12587
* some way to lock versions and do manual upgrades - I don't want to be suprised by breaking changes when I need to get work done
* treesitter-powered pair matching? https://github.com/andymass/vim-matchup
* possible to configure how fzf-lua abbreviates filenames in the left pane? I want to always see the pack at least
* trouble.nvim for diagnostics violations
* possible to configure telescope git pickers to use delta / bat for paging?
* https://github.com/rlane/pounce.nvim

## Other
* snippets? (nvchad: luasnip, friendly-snippets, cmp_luasnip; lunarvim: ?)
* easy way to switch themes without reloading (eg, switching to a light theme temporarily while working outside)
* filepath completion (including in live grep args - or fzf in live grep args...?) (it might be easier to scope files by setting cwd via file-browser, now that I have an easy way to reset cwd to project root)
* crib from lvim lualine (or at least put some LSP stuff in there) https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/core/lualine/styles.lua#L68
* (persistent?) scratch buffers
* only show signcolumn when active config supports diagnostics?
* weird idea, but a plugin that lets me show a little pop-up window on demand (this, probably: https://github.com/nvim-lua/popup.nvim). I could map one to `?` that has keymaps and hints for how to use my config that someone who was pairing with me could reference
* use https://github.com/christoomey/vim-tmux-navigator - maybe use karabiner / qmk to make tab work as a modifier key for hjkl
