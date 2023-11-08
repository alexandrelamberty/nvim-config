-- phpls lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/intelephense.lua
-- https://intelephense.com/

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
}

return opts
