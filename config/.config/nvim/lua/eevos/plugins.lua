local fn = vim.fn

local function ensure_packer()
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.schedule(function()
    vim.notify("[nvim-config] packer is not available", vim.log.levels.ERROR)
  end)
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
    threshold = 0,
  },
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

return packer.startup(function(use)
  -- Packer manages itself ----------------------------------------------------
  use("wbthomason/packer.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use({ "nvim-neotest/nvim-nio" })

  -- Editing niceties --------------------------------------------------------
  use("windwp/nvim-autopairs")
  use("terrortylor/nvim-comment")
  use("folke/which-key.nvim")
  use("kevinhwang91/nvim-bqf")
  use("folke/zen-mode.nvim")

  -- UI / Theming ------------------------------------------------------------
  use("marko-cerovac/material.nvim")
  use("kyazdani42/nvim-web-devicons")
  -- use("glepnir/galaxyline.nvim")
  use({
    "rebelot/heirline.nvim",
  })

  -- Git integrations --------------------------------------------------------
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
  })

  -- Treesitter --------------------------------------------------------------
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("windwp/nvim-ts-autotag")

  -- Telescope & picker helpers ---------------------------------------------
  use("nvim-telescope/telescope.nvim")
  use("kishikaisei/telescope-js-package-scripts.nvim")

  -- Completion --------------------------------------------------------------
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("onsails/lspkind-nvim")
  use("L3MON4D3/LuaSnip")

  -- LSP / Diagnostics -------------------------------------------------------
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("glepnir/lspsaga.nvim")
  use("jose-elias-alvarez/null-ls.nvim")

  -- Debugging ---------------------------------------------------------------
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")

  -- File explorers ----------------------------------------------------------
  use("kyazdani42/nvim-tree.lua")
  use("kevinhwang91/rnvimr")
  use("akinsho/toggleterm.nvim")

  -- Markdown ----------------------------------------------------------------
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use({
    "MeanderingProgrammer/render-markdown.nvim",
    after = { "nvim-treesitter" },
    requires = { "echasnovski/mini.nvim", opt = true },
    config = function()
      require("render-markdown").setup({})
    end,
  })
  use("davidgranstrom/nvim-markdown-preview")

  -- Workflow helpers --------------------------------------------------------
  use("voldikss/vim-floaterm")

  if packer_bootstrap then
    packer.sync()
  end
end)
