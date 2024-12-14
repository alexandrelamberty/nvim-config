--- lspconfig module
-- https://github.com/neovim/nvim-lspconfig/

require('lspconfig')
-- FIXME:  Need to be shared with mason and mason lspconfig
local servers = require('eevos.plugins.nvim-lspconfig-servers')

-- Setup LSP configurations
-- https://linovox.com/configuring-language-server-protocol-lsp-in-neovim/
local opts = {}
for _, lsp in pairs(servers) do
	-- print("LSP: " .. lsp)

	opts = {
		-- default LSP on_attach and capabilities, overwrite in configurations if needed.
		on_attach = require("eevos.lsp.handlers").on_attach,
		capabilities = require("eevos.lsp.handlers").capabilities,
	}
	local require_ok, conf_opts = pcall(require, "eevos.lsp.settings." .. lsp)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end
	-- setup the LSP configurations
	require('lspconfig')[lsp].setup(opts)
end

