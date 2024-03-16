--- Autocmd
-- module autocmd
-- @see https://neovim.io/doc/user/api.html#api-autocmd
-- @see https://neovim.io/doc/user/autocmd.html#autocommand
-- @see https://neovim.io/doc/user/autocmd.html#autocmd-events
-- @see https://neovim.io/doc/user/autocmd.html#autocmd-groups

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

