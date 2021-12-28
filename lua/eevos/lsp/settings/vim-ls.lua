-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/vimls.lua
-- https://github.com/iamcco/vim-language-server
require'lspconfig'.vimls.setup {
    cmd = {DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
    on_attach = require'eevos.lsp'.common_on_attach
}
