local execute = vim.api.nvim_command
local fn = vim.fn

-- Install if is not present
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(function(use)
	-- Package manager
	use "wbthomason/packer.nvim"

	-- Utils
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"


	-- Helper
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use "terrortylor/nvim-comment"
	use "kevinhwang91/nvim-bqf"

	-- Replace ?
	use "davidgranstrom/nvim-markdown-preview"

	-- Command palette
	use "folke/which-key.nvim"

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-buffer"
	-- use "hrsh7th/cmp-look" -- look command line tool
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "onsails/lspkind-nvim" -- TODO: check utility
	use "L3MON4D3/LuaSnip"


	-- Debugging
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use "kishikaisei/telescope-js-package-scripts.nvim"


	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}

	-- Git gutter signs
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- Git client
	use {
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim"
	}

	-- Tree File Explorer
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			'nvim-tree/nvim-web-devicons'
		}
	}

	-- File Explorer
	use "kevinhwang91/rnvimr"

	-- Terminal
	use "akinsho/toggleterm.nvim"
	use "voldikss/vim-floaterm"

	-- Status bar
	use "glepnir/galaxyline.nvim"

	-- Themes & icons
	use "kaicataldo/material.vim"
	use "kyazdani42/nvim-web-devicons"
	-- use 'nvim-tree/nvim-web-devicons'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
