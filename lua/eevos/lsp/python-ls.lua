-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
-- https://github.com/microsoft/pyright
-- npm i -g pyright
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'eevos.lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true

        })
    }
}
