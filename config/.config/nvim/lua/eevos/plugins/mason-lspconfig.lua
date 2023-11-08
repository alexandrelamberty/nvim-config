--- mason-lspconfig
-- https://github.com/williamboman/mason-lspconfig.nvim
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install

	-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
	ensure_installed = {
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
	},
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
