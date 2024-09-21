-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim' 

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- theme manager
	use 'zaldih/themery.nvim'

	-- themes
	use 'folke/tokyonight.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'shaunsingh/nord.nvim'
	use 'maxmx03/solarized.nvim'
	use 'navarasu/onedark.nvim'
	use 'tanvirtin/monokai.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'marko-cerovac/material.nvim'
	use 'mhartington/oceanic-next'

	-- tree-sitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- lsp-zero
	use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
end)
