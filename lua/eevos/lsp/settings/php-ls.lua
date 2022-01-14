-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/intelephense.lua
-- https://intelephense.com/
require'lspconfig'.intelephense.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense",
        "--stdio"
    },
    on_attach = require'eevos.lsp'.common_on_attach
}
