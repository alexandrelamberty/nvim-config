-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/sumneko_lua.lua
-- https://github.com/sumneko/lua-language-server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local sumneko_root_path = DATA_PATH .. "/lsp_servers/sumneko_lua/extension/server/bin"
local sumneko_binary = sumneko_root_path .. "/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
on_attach = require'eevos.lsp'.common_on_attach,
  settings = {
	Lua = {
	  runtime = {
		version = 'Lua 5.3',
		path = {
		  '?.lua',
		  '?/init.lua',
		}
	  },
	  workspace = {
		library = {
		  '/usr/share/lua/5.3'
		}
	  }
	}
  }
}
