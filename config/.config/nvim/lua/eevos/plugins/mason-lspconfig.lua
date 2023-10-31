--- mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim

require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		'lua_ls',
		'html'
	},
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
