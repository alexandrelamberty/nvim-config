-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#texlab
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/texlab.lua
-- https://github.com/latex-lsp/texlab
require'lspconfig'.texlab.setup {
  cmd = {
    DATA_PATH .. "/lspinstall/latex/texlab"
  },
  on_attach = require'eevos.lsp'.common_on_attach
}
