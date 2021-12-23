-- :LspInstall clangd
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua
require'lspconfig'.clangd.setup {
    cmd = {DATA_PATH .. "/lsp_servers/clangd/clangd"},
    on_attach = require'eevos.lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = true

        })
    }
}
