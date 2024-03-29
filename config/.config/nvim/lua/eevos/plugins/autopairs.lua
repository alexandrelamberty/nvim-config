-- nvim-autopairs
-- https://github.com/windwp/nvim-autopairs
require('nvim-autopairs').setup()
local npairs = require('nvim-autopairs')

local function imap(lhs, rhs, opts)
    local options = {noremap = false}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap('i', lhs, rhs, options)
end

_G.MUtils = {}

-- TEST
vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            vim.fn["compe#confirm"]()
            -- return npairs.esc("<c-y>")
            return npairs.esc("")
        else
            vim.defer_fn(function()
                vim.fn["compe#confirm"]("<cr>")
            end, 20)
            return npairs.esc("<c-n>")
        end
    else
        return npairs.check_break_line_char()
    end
end
