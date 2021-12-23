require'lspconfig'.rust_analyzer.setup{
    cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
    on_attach = require'eevos.lsp'.common_on_attach
}

