-- tsserver lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx"
	},
	root_dir = require('lspconfig/util').root_pattern("package.json",
		"tsconfig.json",
		"jsconfig.json", ".git"),
	settings = {
		documentFormatting = false
	},
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic
			.on_publish_diagnostics,
			{
				virtual_text = O.tsserver.diagnostics.virtual_text,
				signs = O.tsserver.diagnostics.signs,
				underline = O.tsserver.diagnostics.underline,
				update_in_insert = true

			})
	}
}
return opts
