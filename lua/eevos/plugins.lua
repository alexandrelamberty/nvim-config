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

  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "terrortylor/nvim-comment"
  use "kevinhwang91/nvim-bqf"

  -- LSP
  use "neovim/nvim-lspconfig"
  use 'williamboman/nvim-lsp-installer'
  use "glepnir/lspsaga.nvim"
	use "jose-elias-alvarez/null-ls.nvim"
  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"
  -- use "hrsh7th/cmp-look" -- look command line tool
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind-nvim"
  use "L3MON4D3/LuaSnip"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "windwp/nvim-ts-autotag"

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
    -- tag = 'release' -- To use the latest release
  }
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim"
  }

  -- Explorer
  use "kyazdani42/nvim-tree.lua"
  use "kevinhwang91/rnvimr"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Status bar
  use "glepnir/galaxyline.nvim"

  -- use "liuchengxu/vim-which-key"
  use "folke/which-key.nvim"

  use "davidgranstrom/nvim-markdown-preview"

  -- Themes & Icons
  use "kaicataldo/material.vim"
  use "kyazdani42/nvim-web-devicons"
  use "ChristianChiarulli/dashboard-nvim"

  if packer_bootstrap then
    require('packer').sync()
  end

end)
