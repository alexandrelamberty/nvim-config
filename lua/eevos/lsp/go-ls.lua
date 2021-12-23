require'lspconfig'.gopls.setup{
    cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
    on_attach = require'eevos.lsp'.common_on_attach
}
