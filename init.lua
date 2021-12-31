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
require 'eevos.plugins.dap-ui'
require "eevos.plugins.dap"
-- require 'eevos.plugins.emmet'
require 'eevos.plugins.galaxyline'
require 'eevos.plugins.gitsigns'
require 'eevos.plugins.neogit'
require 'eevos.plugins.nvimtree'
require 'eevos.plugins.rnvimr'
require 'eevos.plugins.telescope'
require "eevos.plugins.toggleterm"
require 'eevos.plugins.treesitter'
require 'eevos.plugins.whichkey'

-- LSP
require "eevos.lsp"

-- DAP

require "eevos.dap.node"
require "eevos.dap.chrome"
require 'eevos.dap.php'
