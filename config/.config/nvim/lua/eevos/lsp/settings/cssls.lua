-- cssls LSP configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls

local capabilities = require("eevos.lsp.handlers").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
	capabilities = capabilities,
}

return opts
