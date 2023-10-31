-- highlight
-- https://neovim.io/doc/user/syntax.html#%3Ahighlight
-- https://neovim.io/doc/user/syntax.html#highlight-default

print(os.getenv('TERM'))
vim.cmd('set termguicolors')

-- autocmd ColorScheme * highlight CursorLine guifg=none guibg=none
-- autocmd ColorScheme * highlight ColorColumn guifg=none guibg=none
-- autocmd ColorScheme * highlight LineNR cterm=none guifg=none guibg=none

vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight CursorLineNr gui=bold guifg=cyan guibg=none
autocmd ColorScheme * highlight DiagnosticVirtualTextError gui=bold guifg=8 guibg=8
autocmd ColorScheme * highlight DiagnosticVirtualTextInfo gui=italic guifg=#193549 guibg=8
autocmd ColorScheme * highlight DiagnosticVirtualTextWarn gui=bold guifg=8 guibg=#1935498
autocmd ColorScheme * highlight DiagnosticVirtualTextHint gui=italic guifg=#193549 guibg=8
autocmd ColorScheme * highlight EndOfBuffer guifg=#0F111A
autocmd ColorScheme * highlight GitSignsAdd guibg=none guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=none guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=none guifg=#ff2600
autocmd ColorScheme * highlight SignColumn guibg=none
augroup end
]])

-- set the desired theme
vim.cmd('colorscheme material')
