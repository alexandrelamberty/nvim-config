-- bashls LSP configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
	filetypes = {
		"sh",
		"zsh"
	}
}

return opts
