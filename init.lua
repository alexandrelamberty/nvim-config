-- Neovim
-- https://neovim.io/
-- Core
require "eevos.globals"
require('eevos.settings')
require('eevos.utils')
require('eevos.autocommands')
require('eevos.keymappings')
require('eevos.colorscheme')

-- Plugins
require('eevos.plugins')
require('eevos.plugins.autopairs')
require('eevos.plugins.comment')
require('eevos.plugins.compe')
require('eevos.plugins.dashboard')
require('eevos.plugins.galaxyline')
require('eevos.plugins.gitsigns')
require('eevos.plugins.neogit')
require('eevos.plugins.nvimtree')
require('eevos.plugins.rnvimr')
require('eevos.plugins.telescope')
require('eevos.plugins.treesitter')

-- TODO Move to lua
vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- TODO Find a better way to manage all theses wrapper for plugins functions.
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- LSP
require "eevos.lsp"
require "eevos.lsp.bashls"
require "eevos.lsp.clangd"
require "eevos.lsp.cssls"
-- require('eevos.lsp.dockerls')
require('eevos.lsp.efm')
-- require('eevos.lsp.emmet-ls')
-- require('eevos.lsp.gopls')
-- require('eevos.lsp.graphql-ls')
require('eevos.lsp.html')
require('eevos.lsp.tsserver')
require('eevos.lsp.jsonls')
-- require('eevos.lsp.kotlin-ls')
-- require('eevos.lsp.latex-ls')
require('eevos.lsp.lua-ls')
-- require('eevos.lsp.php-ls')
-- require('eevos.lsp.python-ls')
-- require('eevos.lsp.ruby-ls')
-- require('eevos.lsp.rust-ls')
-- require('eevos.lsp.svelte-ls')
-- require('eevos.lsp.tailwindcss-ls')
-- require('eevos.lsp.terraform-ls')
-- require('eevos.lsp.vim-ls')
require('eevos.lsp.yaml-ls')

-- DAP
-- require('eevos.dap')
-- require('eevos.dap.javascript-da-chrome')
-- require'eevos.dap.php-da'
