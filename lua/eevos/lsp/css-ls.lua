-- :LspInstall cssls
require'lspconfig'.cssls.setup {
    cmd = {
        "node", DATA_PATH .. "/lsp_servers/cssls/node_modules/.bin/vscode-css-language-server",
        "--stdio"
    },
    on_attach = require'eevos.lsp'.common_on_attach
}
