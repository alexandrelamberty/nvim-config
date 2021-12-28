-- :LspInstall clangd
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua
return {
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.clang.diagnostics.virtual_text,
            signs = O.clang.diagnostics.signs,
            underline = O.clang.diagnostics.underline,
            update_in_insert = true

        })
    }
}
