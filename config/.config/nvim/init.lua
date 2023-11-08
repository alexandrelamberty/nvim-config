-- Neovim
-- https://neovim.io/

-- Core
require "eevos.globals"
require 'eevos.settings'
require 'eevos.autocommands'
require 'eevos.colorscheme' -- after plugin ?
require 'eevos.diagnostic'
require 'eevos.keymappings'
require 'eevos.utils'

-- Plugins
require 'eevos.plugins' -- need to be first
require 'eevos.plugins.autopairs'
require 'eevos.plugins.cmp'
require 'eevos.plugins.comment'
require 'eevos.plugins.emmet'
require 'eevos.plugins.galaxyline'
require 'eevos.plugins.gitsigns'
require 'eevos.plugins.material'
require 'eevos.plugins.mason'
require 'eevos.plugins.mason-lspconfig'
require 'eevos.plugins.neogit'
require 'eevos.plugins.nvim-lspconfig' -- always after mason and mason-lspconfig
require 'eevos.plugins.nvim-tree'
require 'eevos.plugins.rnvimr'
require 'eevos.plugins.telescope'
require "eevos.plugins.toggleterm"
require 'eevos.plugins.treesitter'
require 'eevos.plugins.whichkey'

-- LSP
require "eevos.lsp"

-- DAP
require "eevos.dap"
