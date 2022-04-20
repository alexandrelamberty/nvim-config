-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#efm
-- https://github.com/mattn/efm-langserver
return {
  init_options = {
    documentFormatting = true,
    codeAction = false
  },
  filetypes = {},
  settings = {
    rootMarkers = {
      ".git/"
    },
    languages = {}
  }
}
