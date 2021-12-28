vim.cmd('let g:nvcode_termcolors=256')
vim.cmd('colorscheme ' .. O.colorscheme)

vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight SignColumn guibg=#193549
autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
]])
vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight EndOfBuffer guifg=#0F111A
augroup end
]])
