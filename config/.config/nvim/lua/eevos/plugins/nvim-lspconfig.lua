--- lspconfig module
-- https://github.com/neovim/nvim-lspconfig/

local lspconfig = require('lspconfig')

-- Need to be shared with mason and mason lspconfig
local servers = { 'lua_ls' }

-- Loop through configs
-- https://linovox.com/configuring-language-server-protocol-lsp-in-neovim/
local opts = {}
for _, lsp in pairs(servers) do
	opts = {
		on_attach = require("eevos.lsp.handlers").on_attach,
		capabilities = require("eevos.lsp.handlers").capabilities,
	}
	local require_ok, conf_opts = pcall(require, "eevos.lsp.settings." .. lsp)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	require('lspconfig')[lsp].setup(opts)
end

lspconfig["lua_ls"].setup({
	on_attach = require("eevos.lsp.handlers").on_attach,
	capabilities = require("eevos.lsp.handlers").capabilitie,
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = {
					'vim'
				}
			}
		},
	},
})
