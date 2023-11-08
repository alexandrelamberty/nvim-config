-- vimls lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/vimls.lua
-- https://github.com/iamcco/vim-language-server

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
}

return opts
