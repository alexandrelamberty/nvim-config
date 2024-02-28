--- Autocommand
-- @module autocommand
-- @see https://neovim.io/doc/user/autocmd.html#autocommand
-- @see https://neovim.io/doc/user/autocmd.html#autocmd-events
-- @see https://neovim.io/doc/user/api.html#api-autocmd

-- General
local yankGroup = vim.api.nvim_create_augroup("_YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()'",
	group = yankGroup
})

-- FileType
local fileGroup = vim.api.nvim_create_augroup("_FileType", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal wrap'",
	group = fileGroup
})

-- Keybindings
local keymapGroup = vim.api.nvim_create_augroup("_Keymap", { clear = true })

-- Convenient close
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard", "lspinfo", "floaterm", "man", "help" },
	command = "nnoremap <silent> <buffer> q :q<CR>'",
	group = keymapGroup
})

-- Spell
-- Use multiple dictionaries for spell checking
local spellGroup = vim.api.nvim_create_augroup("_Spell", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "setlocal spellfile+=~/.config/nvim/spell/brand.utf-8.add",
	group = spellGroup
})

-- User commands

-- Build spell file
vim.api.nvim_create_user_command(
	'SpellBuild',
	"echo 'Building spell file'",
	{ bang = true, desc = "Build spell file" }
)

-- Open remote Git repository
vim.api.nvim_create_user_command(
	'GitRepo',
	"lua require('eevos.utils').open_git_repo()",
	{ bang = true, desc = "Open remote Git repository" }
)

-- 		{
-- 			'FileType', 'dashboard',
-- 			'setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= '
-- 		}, { 'FileType', 'dashboard', 'set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2' }
