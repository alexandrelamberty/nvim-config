-- Highlight
-- @module colorscheme
-- @see https://neovim.io/doc/user/syntax.html#%3Ahighlight
-- @see https://neovim.io/doc/user/syntax.html#highlight-default

-- autocmd ColorScheme * highlight CursorLine guifg=none guibg=none
-- autocmd ColorScheme * highlight ColorColumn guifg=none guibg=none
-- autocmd ColorScheme * highlight LineNR cterm=none guifg=none guibg=none
-- vim.cmd('set highlight EndOfBuffer ctermbg=333333 ctermfg=333333') -- Change the ≃
-- autocmd ColorScheme * highlight CursorLineNr gui=bold guifg=cyan guibg=none

vim.cmd([[
augroup Global
autocmd!
autocmd ColorScheme * highlight EndOfBuffer guifg=#0F111A
autocmd ColorScheme * highlight SignColumn guibg=none
augroup end
]])

-- Diagnostic
vim.cmd([[
augroup Diagnostic
autocmd!
autocmd ColorScheme * highlight DiagnosticVirtualTextError gui=bold guifg=8 guibg=8
autocmd ColorScheme * highlight DiagnosticVirtualTextInfo gui=italic guifg=#193549 guibg=8
autocmd ColorScheme * highlight DiagnosticVirtualTextWarn gui=bold guifg=8 guibg=#1935498
autocmd ColorScheme * highlight DiagnosticVirtualTextHint gui=italic guifg=#193549 guibg=8
augroup end
]])

-- GitSigns
-- gitsigns-highlight-groups
vim.cmd([[
augroup GitSigns
autocmd!
autocmd ColorScheme * highlight GitSignsAdd guibg=none guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=none guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=none guifg=#ff2600
augroup end
]])

-- Spell checking
-- https://neovim.io/doc/user/spell.html
vim.cmd([[
augroup Spell
autocmd!
autocmd ColorScheme * highlight SpellBad gui=bold guifg=cyan guibg=none
autocmd ColorScheme * highlight SpellCap gui=bold guifg=cyan guibg=none
autocmd ColorScheme * highlight SpellRare gui=bold guifg=cyan guibg=none
autocmd ColorScheme * highlight SpellLocal gui=bold guifg=cyan guibg=none
augroup end
]])

-- set the desired theme
vim.cmd('colorscheme material') -- must be set after custom highlight
