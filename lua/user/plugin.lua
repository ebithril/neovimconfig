local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system {
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
		}
		print "Installing packer close and reopen Neovim..."
		vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugin.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
		return
end

-- Have packer use a popup window
packer.init {
		display = {
				open_fn = function()
						return require("packer.util").float { border = "rounded" }
				end,
		},
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself

	use {
		"nvim-telescope/telescope.nvim", tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}

	use "overcache/NeoSolarized"

	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	use "neovim/nvim-lspconfig"
	use "simrat39/rust-tools.nvim"

	-- Completion framework:
	use 'hrsh7th/nvim-cmp' 

	-- LSP completion source:
	use 'hrsh7th/cmp-nvim-lsp'

	-- Useful completion sources:
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'                             
	use 'hrsh7th/cmp-path'                              
	use 'hrsh7th/cmp-buffer'                            
	use 'hrsh7th/vim-vsnip'           

	use 'voldikss/vim-floaterm'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
