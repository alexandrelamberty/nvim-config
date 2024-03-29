-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/yamlls.lua
-- https://github.com/redhat-developer/yaml-language-server
return {
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
        ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}'
      },
      schemaDownload = {
        enable = true
      },
      validate = true
    }
  }
}
