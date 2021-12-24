-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/jsonls.lua
-- https://github.com/hrsh7th/vscode-langservers-extracted
-- npm install -g vscode-json-languageserver

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
  cmd = {
	DATA_PATH .. "/lsp_servers/jsonls/node_modules/.bin/vscode-json-language-server",
	"--stdio"
  },
  on_attach = require'eevos.lsp'.common_on_attach,
  capabilities = capabilities,
  commands = {
	Format = {
	  function()
		vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
	  end
	}
  },
  settings = {
	json = {
	  schemas = {
		{
		  description = 'TypeScript compiler configuration file',
		  fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
		  url = 'http://json.schemastore.org/tsconfig'
		},
		{
		  description = 'Lerna config',
		  fileMatch = {'lerna.json'},
		  url = 'http://json.schemastore.org/lerna'
		},
		{
		  description = 'Babel configuration',
		  fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
		  url = 'http://json.schemastore.org/lerna'
		},
		{
		  description = 'ESLint config',
		  fileMatch = {'.eslintrc.json', '.eslintrc'},
		  url = 'http://json.schemastore.org/eslintrc'
		},
		{
		  description = 'Bucklescript config',
		  fileMatch = {'bsconfig.json'},
		  url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json'
		},
		{
		  description = 'Prettier config',
		  fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
		  url = 'http://json.schemastore.org/prettierrc'
		},
		{
		  description = 'Vercel Now config',
		  fileMatch = {'now.json'},
		  url = 'http://json.schemastore.org/now'
		},
		{
		  description = 'Stylelint config',
		  fileMatch = {'.stylelintrc', '.stylelintrc.json', 'stylelint.config.json'},
		  url = 'http://json.schemastore.org/stylelintrc'
		},
	  }
	},
  }
}
