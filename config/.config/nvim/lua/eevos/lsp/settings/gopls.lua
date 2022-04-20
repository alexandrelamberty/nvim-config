-- :LspInstall gols
require'lspconfig'.gopls.setup {
  cmd = {
    DATA_PATH .. "/lsp_servers/go/gopls"
  },
  on_attach = require'eevos.lsp'.common_on_attach
}
