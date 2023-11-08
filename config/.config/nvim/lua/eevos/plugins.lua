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

	-- Helper
	use "windwp/nvim-autopairs"
	use "windwp/nvim-ts-autotag"
	use "terrortylor/nvim-comment"
	use "kevinhwang91/nvim-bqf"

	-- Replace ?
	use "davidgranstrom/nvim-markdown-preview"

	-- Command palette
	use "folke/which-key.nvim"

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-buffer"
	-- use "hrsh7th/cmp-look" -- look command line tool
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use "onsails/lspkind-nvim" -- TODO: check utility

	-- Debugging
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"

	-- File Explorer
	use "kevinhwang91/rnvimr"

	-- Git client
	use {
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim"
	}

	-- Git gutter signs
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		requires = {
			-- LSP Support
			-- Completion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}

	-- Status bar
	use "glepnir/galaxyline.nvim"

	-- Themes & icons
	use 'marko-cerovac/material.nvim'
	use 'nvim-tree/nvim-web-devicons'

	-- Terminal
	use "akinsho/toggleterm.nvim"
	use "voldikss/vim-floaterm"

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use "kishikaisei/telescope-js-package-scripts.nvim"

	-- Treesitter
	-- use {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	run = ":TSUpdate"
	-- }
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Tree File Explorer
	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			'nvim-tree/nvim-web-devicons'
		}
	}

	-- Utils
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	if packer_bootstrap then
		require('packer').sync()
	end
end)
