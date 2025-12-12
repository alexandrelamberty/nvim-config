--- vim.cmd('let g:nvim_termcolors=256')
vim.cmd('colorscheme material-deep-ocean')

vim.cmd([[
augroup GitSigns
autocmd!
autocmd ColorScheme * highlight SignColumn guibg=#193549
autocmd ColorScheme * highlight GitSignsAdd guibg=#193549 guifg=#3ad900
autocmd ColorScheme * highlight GitSignsChange guibg=#193549 guifg=#ffc600
autocmd ColorScheme * highlight GitSignsDelete guibg=#193549 guifg=#ff2600
autocmd ColorScheme * highlight ColorColumn guifg=NONE guibg=#204563 gui=NONE
augroup end
]])

vim.cmd([[
augroup EndOfBuffer
autocmd!
autocmd ColorScheme * highlight EndOfBuffer guifg=#0F111A ctermfg=#0F111A
augroup end
]])

vim.cmd [[
  highlight TelescopeNormal guibg=#1e222a guifg=#c8d0e0
  highlight TelescopeBorder guibg=#1e222a guifg=#3b4048
  highlight TelescopeSelection guibg=#3b4048 guifg=#ffffff
]]

--- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#16161e" })
--- vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "#16161e" })

