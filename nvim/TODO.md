# TODO
* **consolidate mappings:** mappings.lua can export mappings for other plugins (that need to be set in the plugin's setup call)
* **testing integration:** This looks super interesting: https://github.com/nvim-neotest/neotest
  * in addition to running tests, it'd be great to have a way to jump to / automatically create the test file corresponding to the current file
  * vim-rails does some of this (and other things that are probably useful) https://github.com/tpope/vim-rails
* **PR review:** convenient way to check out a PR and open in diffview
  * maybe a custom command that calls `gh` and Diffview: `:PR 1234`
  * and another that does `:DiffviewOpen sha^!` (eg, `:GS sha`)
  * is there a cool way do have this commands pop an interactive command prompt window? eg, type `<leader>pr`, then a box pops up asking you for the branch number to pass as argument
    * yes there is! https://github.com/stevearc/dressing.nvim
* **telescope fb mappings:** more intuitive mappings, especially in insert mode (eg, `imap <C-foo>` should always do the same as `nmap foo`)
* **scratch:** (persistent?) scratch buffers. shortcut opens or creates SCRATCH_DIR/<project>.md - put in dropbox to sync across machines
  * Use `:drop` to switch to scratch tab if already open: https://vimtricks.com/p/quickly-access-project-notes/
* **select_dir_for_grep warnings?:** sometimes I get a warning about a var being a table instead of a number or something. probably easiest to use a local copy of telescope and try to get a stack trace of where exactly it's coming from
* **git blame:** see who wrote what in current file. easily open a commit in diffview
  * maybe I can just write this myself? there are a few git-blame options but I don't see any that will give me the diff. see: https://teukka.tech/vimtip-gitlens.html
  * it would be cool if I could toggle git-blame for the current line, and doing so would also turn on blame for any other lines in the file that belong to that same commit. then, provide some key binding that would open the commit in diffview
  * maybe a "gc" (Go to Commit) binding that opens up the last commit to touch the current line in diffview. see git-blame.nvim's get_sha function: https://github.com/f-person/git-blame.nvim/blob/master/lua/gitblame/init.lua#L294  - https://stackoverflow.com/questions/71143517/how-to-bind-a-luafunction-to-keypress-in-vim
* **fzf-lua result path_display?:** possible to configure how fzf-lua abbreviates filenames (like I do with telescope)? https://github.com/junegunn/fzf.vim/issues/960
* **formatting in strange projects:** if I make a small change to a file in a forked repo and the whole file reformats. range formatting, or format only new code (so I can use prettier / whatever in codebases that don't have a fixer set up)
  * range formatting might be nice for code blocks inside markdown too
* **mason? lsp-zero?:** look into using these plugins to simplify my lsp setup (and per-project configs)
* **telescope git highlighting:** possible to configure telescope git pickers to use delta / bat for paging?
* **text objects?:** treesitter for text objects? look for ruby examples maybe
* **lock plugin versions:** some way to lock versions and do manual upgrades - I don't want to be suprised by breaking changes when I need to get work done
* **ruby debugger?:** new Ruby debugger stuff? need to research: https://blog.testdouble.com/talks/2022-08-22-debugging-ruby-on-rails-with-vscode/
* **theme switching:** easy way to switch themes without reloading (eg, switching to a light theme temporarily while working outside)
* **? cheat sheet:** weird idea, but a plugin that lets me show a little pop-up window on demand (this, probably: https://github.com/nvim-lua/popup.nvim). I could map one to `?` that has keymaps and hints for how to use my config that someone who was pairing with me could reference
  * just use whichkey?
* **vim-tmux-navigator?:** see if this would be an improvement to my workflow: https://github.com/christoomey/vim-tmux-navigator - maybe use karabiner / qmk to make tab work as a modifier key for hjkl
* **telescope fb tree view:** I would need to actually build this into the plugin... [telescope-file-browser tree view](https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/165#issuecomment-1242515366)
* **lazy load plugins?:** impatient.nvim?
* **neo-tree:** Look at neo-tree as an alternative / addition to telescope-fb. Neo-tree seems highly configurable, so I can probably make it do what I want
* **ruby namespaced constant completion** If I have a Long::Constant::Name it's annoying to autocomplete each module individually.
  * Maybe configure the cmp menu to show automatically if the cursor is after ::
