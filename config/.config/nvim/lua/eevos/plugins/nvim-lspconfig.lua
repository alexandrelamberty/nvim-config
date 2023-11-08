--- lspconfig module
-- https://github.com/neovim/nvim-lspconfig/

local lspconfig = require('lspconfig')

-- Need to be shared with mason and mason lspconfig
local servers = {
	-- 'bashls',
	'clangd',
	-- 'cmake',
	'gopls',
	'lua_ls',
	'cssls',
	'html',
	'jsonls',
	'yamlls',
	'lemminx',
	-- 'markdownlint',
	'dockerls',
	'sqlls',
	--
	'tsserver',
	'tailwindcss',
}

-- Setup LSP configurations
-- https://linovox.com/configuring-language-server-protocol-lsp-in-neovim/
local opts = {}
for _, lsp in pairs(servers) do
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

