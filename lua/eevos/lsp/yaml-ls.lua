-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/yamlls.lua
-- https://github.com/redhat-developer/yaml-language-server
require'lspconfig'.yamlls.setup{
  cmd = {DATA_PATH .. "/lsp_servers/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
  on_attach = require'eevos.lsp'.common_on_attach,
  settings = {
	yaml = {
	  trace = {
		server = "verbose"
	  },
	  format = { enable = true },
	  schemas = {
		['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
		['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
	  },
	  schemaDownload = {  enable = true },
	  validate = true,
	},
  }
}
