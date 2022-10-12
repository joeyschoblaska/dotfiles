-- run :PackerSync after modifying plugins

-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- without this, packer will try to delete itself on sync

	use(require("plugins.telescope")) -- framework for fuzzy finding / picking
	use(require("plugins.fzf_lua")) -- faster file finder, good for large repos
	use(require("plugins.gitsigns")) -- highlighting number col with git status
	use(require("plugins.tabline")) -- tabline (top)
	use(require("plugins.lualine")) -- statusline (bottom)
	use("kyazdani42/nvim-web-devicons") -- icons, mostly for filetypes
	use(require("plugins.hlslens")) -- advanced search highlighting
	use(require("plugins.nvim_cmp")) -- completion window
	use("tversteeg/registers.nvim") -- show popup with register contents on `"` press
	use(require("plugins.toggleterm")) -- wrapper around :term; used for lazygit
	use(require("plugins.colorizer")) -- highlight hex values with their corresponding color
	use(require("plugins.slime")) -- send text to another tmux window
	use(require("plugins.filetype")) -- filetype settings / definitions
	use(require("plugins.diffview")) -- for viewing git diffs
	use(require("plugins.autolist")) -- list completion for markdown docs
	use(require("plugins.gitlinker")) -- generate github link for cursor position
	use(require("plugins.markdown_preview")) -- live in-browser preview of markdown buffer
	use(require("plugins.leap")) -- "neovim's answer to the mouse"
	use(require("plugins.marks")) -- improve vim marks and add bookmarks

	-- syntax / treesitter
	use(require("plugins.treesitter")) -- syntax parsing for highlighting and indenting
	use({ "nvim-treesitter/playground", after = "nvim-treesitter" }) -- for debugging treesitter / hl groups
	use(require("plugins.context")) -- show context of visible buffer
	use(require("plugins.comment")) -- adding / removing comments
	use(require("plugins.autopairs")) -- closing pairs ((), {}, [], "", etc)
	use(require("plugins.indent_blankline")) -- vertical line showing block indent levels
	use(require("plugins.aerial")) -- give a symbol outline of the current file
	use(require("plugins.matchup")) -- useful operations on sets of matched (eg, parens, brackets, if ... end) text
	use(require("plugins.surround")) -- add / delete / change "surrounds" (brackets, quotes, backticks, html tags, etc)

	-- colors
	-- use("Mofiqul/dracula.nvim")
	-- use("sainnhe/sonokai")
	-- use("bluz71/vim-nightfly-guicolors")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- lsp
	use(require("plugins.nvim_lspconfig"))
	use(require("plugins.null_ls")) -- allows non-LSP sources (eg, prettier) to hook into nvim's LSP client
	use(require("plugins.lsp_format")) -- hooks into null-ls for formatting on save
	use(require("plugins.fidget")) -- lsp progress indicator
	use(require("plugins.trouble")) -- workplace diagnostics window

	if packer_bootstrap then
		require("packer").sync()
	end
end)
