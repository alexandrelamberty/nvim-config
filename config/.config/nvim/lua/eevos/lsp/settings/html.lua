-- HTML LSP configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
-- https://github.com/hrsh7th/vscode-langservers-extracted

local capabilities = require("eevos.lsp.handlers").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
	capabilities = capabilities,
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		},
		provideFormatter = true
	}
}

return opts
