--- mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
local servers = require('eevos.plugins.nvim-lspconfig-servers')
require('mason-lspconfig').setup({
	-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
	ensure_installed = servers,
	automatic_installation = false, -- TODO: Check this to use lsp-config settings ?
	-- handlers = {
	-- 	lsp_zero.default_setup,
	-- }
})

-- require("mason-tool-installer").setup({
-- 	ensure_installed = {
-- 		"prettier",     -- prettier formatter
-- 		"stylua",       -- lua formatter
-- 		"isort",        -- python formatter
-- 		"black",        -- python formatter
-- 		"pylint",       -- python linter
-- 		"eslint_d",     -- js linter
-- 	},
-- })
