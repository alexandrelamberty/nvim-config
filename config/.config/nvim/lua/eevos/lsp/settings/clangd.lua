-- clangd LSP configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/clangd.lua

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic
			.on_publish_diagnostics,
			{
				virtual_text = O.clang.diagnostics.virtual_text,
				signs = O.clang.diagnostics.signs,
				underline = O.clang.diagnostics.underline,
				update_in_insert = true

			})
	}
}

return opts
