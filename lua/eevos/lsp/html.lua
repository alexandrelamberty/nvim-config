local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
    cmd = {DATA_PATH .. "/lsp_servers/html/node_modules/.bin/vscode-html-language-server", "--stdio"},
    on_attach = require'eevos.lsp'.common_on_attach,
    capabilities = capabilities
}
