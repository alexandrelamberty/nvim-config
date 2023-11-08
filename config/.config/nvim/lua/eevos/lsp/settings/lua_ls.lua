-- luals lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

local opts = {
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilities,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { 'vim' }
			}
		},
	},
}

return opts
