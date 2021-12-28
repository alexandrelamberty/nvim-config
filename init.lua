-- Neovim
-- https://neovim.io/
-- Core
require "eevos.globals"
require 'eevos.settings'
require 'eevos.keymappings'
require 'eevos.plugins'
require 'eevos.colorscheme'
require 'eevos.utils'
require 'eevos.autocommands'

-- Plugins
require 'eevos.plugins.autopairs'
require 'eevos.plugins.cmp'
require 'eevos.plugins.comment'
require 'eevos.plugins.galaxyline'
require 'eevos.plugins.gitsigns'
require 'eevos.plugins.neogit'
require 'eevos.plugins.nvimtree'
require 'eevos.plugins.telescope'
require 'eevos.plugins.treesitter'
require "eevos.plugins.toggleterm"
require 'eevos.plugins.rnvimr'

-- LSP
require "eevos.lsp"

-- DAP
-- require('eevos.dap.node')
-- require('eevos.dap.javascript-da-chrome')
-- require'eevos.dap.php-da'

-- TODO Move to lua
vim.cmd('source ~/.config/nvim/vimscript/lv-whichkey/init.vim')
-- TODO Find a better way to manage all theses wrapper for plugins functions.
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

