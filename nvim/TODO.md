# TODO
* **consolidate mappings:** mappings.lua can export mappings for other plugins (that need to be set in the plugin's setup call)
* **git diffing:** probably using diffview
  * file history
  * PR review (the whole path from looking at something in GH to viewing diff in nvim)
* **git blame:** see who wrote what in current file. integrate with git diffing?
* **telescope fb tree view:** I would need to actually build this into the plugin... [telescope-file-browser tree view](https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/165#issuecomment-1242515366)
* **telescope fb mappings:** more intuitive mappings, especially in insert mode (eg, `imap <C-foo>` should always do the same as `nmap foo`)
* **return to project dir:** nmap h / imap <C-h> in file-browser resets cwd to project root (replace proof-of-concept <leader>fh mapping). a way to reset after changing cwd
* **scoping monorepo:** I'm usually only working with a few packs / packages at a time
  * maybe a custom telescope picker to select packs, then file find and grep are scoped to just those packs: https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
  * or just additional mappings that scope file find or grep to the pack containing the current file
* **formatting in strange projects:** if I make a small change to a file in a forked repo and the whole file reformats. range formatting, or format only new code (so I can use prettier / whatever in codebases that don't have a fixer set up)
* **make ls ref / defs easier to scan:** customize entry display for telescope lsp refs / defs (if possible?)
  * maybe here (ENTRY_DISPLAY): https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L2136
* **nvim_cmp:** integrate LSP servers with nvim_cmp
* **mason?:** figure out what exactly mason is providing and whether I want to use it
* **ruby debugger?:** new Ruby debugger stuff? need to research: https://blog.testdouble.com/talks/2022-08-22-debugging-ruby-on-rails-with-vscode/
* **nvim_cmp delay:** figure out how to add a delay to cmp window: https://github.com/hrsh7th/nvim-cmp/issues/715#issuecomment-1069059428
  * this link for disabling prompt in telescope: https://github.com/hrsh7th/nvim-cmp/issues/60#issuecomment-905632958
* **markdown bullets:** for markdown editing, auto-insert bullets when starting a new line in a list
* **text objects?:** treesitter for text objects? look for ruby examples maybe
* **lua snippets?:** never used snippets before. look for examples of how to best use it in ruby / rails / ts / react
* **lazy load plugins?:** impatient.nvim?
* **ts-commentstring?:** maybe add JoosepAlviste/nvim-ts-context-commentstring once this is fixed: https://github.com/neovim/neovim/issues/12587
* **lock plugin versions:** some way to lock versions and do manual upgrades - I don't want to be suprised by breaking changes when I need to get work done
* **ts pair matching?:** treesitter-powered pair matching? https://github.com/andymass/vim-matchup
* **fzf-lua result path_display?:** possible to configure how fzf-lua abbreviates filenames (like I do with telescope)?
* **ts git highlighting:** possible to configure telescope git pickers to use delta / bat for paging?
* **theme switching:** easy way to switch themes without reloading (eg, switching to a light theme temporarily while working outside)
* **scratch:** (persistent?) scratch buffers. maybe store in a NOTES_DIR subfolder?
* **? cheat sheet:** weird idea, but a plugin that lets me show a little pop-up window on demand (this, probably: https://github.com/nvim-lua/popup.nvim). I could map one to `?` that has keymaps and hints for how to use my config that someone who was pairing with me could reference
* **vim-tmux-navigator?:** see if this would be an improvement to my workflow: https://github.com/christoomey/vim-tmux-navigator - maybe use karabiner / qmk to make tab work as a modifier key for hjkl
