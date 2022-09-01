-- TODOS:
--
-- GIT
-- octo.nvim
-- easy way to browse history of a file
-- easy way to git blame file / explore revisions
--
-- FORMATTING
-- range formatting, or format only new code (so I can use prettier / whatever in codebases that don't have a fixer set up)
-- per-project formatting configuration (this? https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md#conditional-sources or this? https://prettier.io/docs/en/configuration.html#configuration-overrides or this? https://github.com/tamago324/nlsp-settings.nvim)
--
-- LSP
-- LSP setup (document and workspace symbols; references; def; nvim-cmp (see cmp-nvim-lsp))
-- mason for server management
-- new Ruby debugger stuff? https://blog.testdouble.com/talks/2022-08-22-debugging-ruby-on-rails-with-vscode/
--
-- GENERAL EDITING
-- better search highlighting (highlight all matches while typing; clear on ESC or anything evanseco clears on)
-- syntax highlighting in markdown code blocks
-- for markdown editing, auto-insert bullets when starting a new line in a list
--
-- PLUGINS
-- automatically do PackerSync and MasonWhatever, as needed. maybe this? https://github.com/junnplus/lsp-setup.nvim#lua-dev
-- lazy load plugins? (impatient.nvim?)
-- maybe add JoosepAlviste/nvim-ts-context-commentstring once this is fixed: https://github.com/neovim/neovim/issues/12587
-- some way to lock versions and do manual upgrades - I don't want to be suprised by breaking changes when I need to get work done
-- treesitter-powered pair matching? https://github.com/andymass/vim-matchup
-- fidget? ("LSP eye candy for the impatient"): https://github.com/j-hui/fidget.nvim
--
-- OTHER
-- snippets? (nvchad: luasnip, friendly-snippets, cmp_luasnip; lunarvim: ?)
-- slicker telescope colors / layout (the "ivy" theme is close, but make it full-height, put the search box on the bottom and add some padding around it)
-- easy way to switch themes without reloading (eg, switching to a light theme temporarily while working outside)
-- filepath completion (including in live grep args - or fzf in live grep args...?)
-- crib from lvim lualine (or at least put some LSP stuff in there) https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/core/lualine/styles.lua#L68
-- (persistent?) scratch buffers
-- start a new `dotfiles` project for updated configs; push to public repo; archive current project in private `dotfiles-old` repo
-- hide col left of numbers unless it's being used by diagnostics or whatever? https://www.reddit.com/r/neovim/comments/oiyq17/comment/hkky89o/?utm_source=reddit&utm_medium=web2x&context=3
-- weird idea, but a plugin that lets me show a little pop-up window on demand (this, probably: https://github.com/nvim-lua/popup.nvim). I could map one to `?` that has keymaps and hints for how to use my config that someone who was pairing with me could reference
-- use https://github.com/christoomey/vim-tmux-navigator - maybe use karabiner / qmk to make tab work as a modifier key for hjkl
-- define a function that does `rm -rf ~/.local/share/nvim` and PackerSync?

require("plugins")

require("opts")
require("colors.catppuccin")
require("mappings")
require("autocmds")

-- when called via pcall, require will not raise an error if file does not exist
pcall(require, "local")
