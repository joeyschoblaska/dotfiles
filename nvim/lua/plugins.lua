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

	use(require("plugins.gitsigns")) -- highlighting number col with git status
	use(require("plugins.lualine")) -- statusline
	use(require("plugins.tabline")) -- tabline
	use("kyazdani42/nvim-web-devicons") -- icons, mostly for filetypes
	use("pgdouyon/vim-evanesco") -- search highlighting
	use(require("plugins.nvim_cmp")) -- completion window
	use("tversteeg/registers.nvim") -- show popup with register contents on `"` press
	use(require("plugins.toggleterm")) -- wrapper around :term; used for lazygit
	use(require("plugins.colorizer")) -- highlight hex values with their corresponding color
	use(require("plugins.slime")) -- send text to another tmux window

	-- syntax
	use(require("plugins.treesitter")) -- syntax parsing for highlighting and indenting
	use({ "nvim-treesitter/playground", after = "nvim-treesitter" }) -- for debugging treesitter / hl groups
	use(require("plugins.context")) -- show context of visible buffer
	use(require("plugins.comment")) -- adding / removing comments
	use(require("plugins.autopairs")) -- closing pairs ((), {}, [], "", etc)
	use("lukas-reineke/indent-blankline.nvim") -- vertical line showing block indent levels

	-- colors
	use("Mofiqul/dracula.nvim")
	use("sainnhe/sonokai")
	use("bluz71/vim-nightfly-guicolors")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- lsp
	use("neovim/nvim-lspconfig")
	use(require("plugins.null_ls"))
	use(require("plugins.lsp_format")) -- hooks into null-ls for formatting on save

	-- telescope
	use(require("plugins.telescope"))
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
