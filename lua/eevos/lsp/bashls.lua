-- :LspInstall bashls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua
require'lspconfig'.bashls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/bash/node_modules/.bin/bash-language-server", "start"},
    on_attach = require'eevos.lsp'.common_on_attach,
    filetypes = { "sh", "zsh" }
}
