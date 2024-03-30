-- yamlls lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/yamlls.lua
-- https://github.com/redhat-developer/yaml-language-server

local opts = {
	settings = {
		yaml = {
			trace = {
				server = "verbose"
			},
			format = {
				enable = true
			},
			schemas = {
				['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
				['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
				['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = 'docker-compose*.{yml,yaml}',
				-- OpenAPI
				-- https://github.com/OAI/OpenAPI-Specification/tree/main/schemas
				-- ['https://spec.openapis.org/oas/3.0/schema/2021-09-28'] = 'api.{yml,yaml}',
				['https://spec.openapis.org/oas/3.1/schema/2022-10-07'] = 'api.{yml,yaml}'
			},
			schemaDownload = {
				enable = true
			},
			validate = true
		}
	}
}

return opts
