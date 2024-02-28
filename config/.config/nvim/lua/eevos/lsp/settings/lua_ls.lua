-- luals lsp configuration
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls

local opts = {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true
                }
            },
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                globals = { 'vim' }
            },
        },
    },
}

return opts
