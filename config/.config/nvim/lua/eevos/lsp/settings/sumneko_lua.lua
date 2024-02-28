--- sunmenko_lua LSP configuration
-- @module eevos.lsp.settings.sumneko_lua

local opts = {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim"
        }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true
        }
      }
    }
  }
}

return opts