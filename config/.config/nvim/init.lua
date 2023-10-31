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
require 'eevos.plugins.emmet'
require 'eevos.plugins.galaxyline'
require 'eevos.plugins.gitsigns'
require 'eevos.plugins.mason'
require 'eevos.plugins.mason-lspconfig'
require 'eevos.plugins.neogit'
require 'eevos.plugins.nvim-lspconfig'
require 'eevos.plugins.nvim-tree'
require 'eevos.plugins.rnvimr'
require 'eevos.plugins.telescope'
require "eevos.plugins.toggleterm"
require 'eevos.plugins.treesitter'
require 'eevos.plugins.whichkey'

-- Diagnostic

require 'eevos.diagnostic.diagnostic'.setup()

-- LSP

require "eevos.lsp"

-- DAP

require "eevos.dap"
