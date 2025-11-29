-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use( 'nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'})
	use('ThePrimeagen/harpoon')
	use( 'nvim-treesitter/playground')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use({
		'rose-pine/neovim',
		as = "rose-pine",
		config=function()
			vim.cmd('colorscheme rose-pine')
		end
	})
	use {
	      'williamboman/mason.nvim',
	      'williamboman/mason-lspconfig.nvim',
	      'neovim/nvim-lspconfig',
	  }
	
	use {
	      'hrsh7th/nvim-cmp',           -- The completion plugin
	      'hrsh7th/cmp-nvim-lsp',       -- lsp completion source
	      'hrsh7th/cmp-buffer',         -- buffer completion source
	      'hrsh7th/cmp-path',           -- path completion source
	      'saadparwaiz1/cmp_luasnip',   -- snippet completion source
	      'L3MON4D3/LuaSnip',           -- snippet engine
	      'rafamadriz/friendly-snippets', -- useful snippets
	  }
end)
