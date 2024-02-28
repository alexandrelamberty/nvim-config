-- tsserver lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

local opts = {
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    root_dir = require('lspconfig/util').root_pattern("package.json",
        "tsconfig.json",
        "jsconfig.json", ".git"),
    settings = {
        documentFormatting = false
    },
}
return opts
