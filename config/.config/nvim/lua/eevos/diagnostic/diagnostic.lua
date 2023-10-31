-- Neovim Diagnostic module
-- https://neovim.io/doc/user/diagnostic.html

local M = {}
M.setup = function()
    -- https://neovim.io/doc/user/diagnostic.html
    -- https://neovim.io/doc/user/lsp.html#lsp-diagnostic
    -- https://neovim.io/doc/user/diagnostic.html#diagnostic-signs
    local signs = {
        {
            name = "DiagnosticSignError",
            text = ""
        },
        {
            name = "DiagnosticSignWarn",
            text = ""
        },
        {
            name = "DiagnosticSignInfo",
            text = ""
        },
        {
            name = "DiagnosticSignHint",
            text = ""
        }
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = sign.name
        })
    end

    -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "none",
            source = "always",
            header = "diagnostic",
            prefix = ""
        }
    }

    vim.diagnostic.config(config)
end
return M
