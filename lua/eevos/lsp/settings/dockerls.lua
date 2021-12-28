-- :LspInstall dockerls
require'lspconfig'.dockerls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
    on_attach = require'eevos.lsp'.common_on_attach,
}
