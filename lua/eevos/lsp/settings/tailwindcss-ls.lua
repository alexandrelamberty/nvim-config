-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tailwindcss.lua
-- https://github.com/tailwindlabs/tailwindcss-intellisense
return {
    filetypes = O.tailwindls.filetypes,
    root_dir = require('lspconfig/util').root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    handlers = {
        ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            -- tailwindcss lang server waits for this repsonse before providing hover
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", {_id = params._id})
        end
    }
}
