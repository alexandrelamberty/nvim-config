-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup {
  on_attach = require'eevos.lsp'.common_on_attach
}
