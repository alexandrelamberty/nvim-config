-- Core editor settings shared by the entire configuration.
-- Everything is declared in Lua instead of :set commands so the intent is
-- easier to read and maintain.

local g = vim.g
local o = vim.o
local opt = vim.opt
local wo = vim.wo
local bo = vim.bo

-- Surface the terminal that launched Neovim. Some plugins use it to open
-- external commands, so we keep it global for backwards compatibility.
_G.TERMINAL = vim.env.TERMINAL or ""

-- Providers / syntax --------------------------------------------------------
g.loaded_perl_provider = 0
vim.cmd.syntax("on")

-- Text objects & command UX -------------------------------------------------
opt.iskeyword:append("-") -- treat dash separated words as one word
opt.inccommand = "split" -- incremental substitute preview
opt.whichwrap:append("<,>,[,],h,l") -- wrap cursor movement keys
opt.shortmess:append("c") -- keep completion quiet
opt.colorcolumn = "99999" -- workaround for indent guides bleeding
opt.tabstop = 2
opt.shiftwidth = 2

-- Global options ------------------------------------------------------------
g.mapleader = " "
g.material_style = "deep ocean"

o.termguicolors = true
o.hidden = true
o.title = true
o.titlestring = "%F"
o.pumheight = 10
o.fileencoding = "utf-8"
o.laststatus = 3
o.cmdheight = 0
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.conceallevel = 0
o.showtabline = 0
o.showmode = true
opt.backup = false
o.writebackup = false
o.updatetime = 300
o.timeoutlen = 100
o.clipboard = "unnamedplus"

-- Buffer options ------------------------------------------------------------
bo.expandtab = true
bo.smartindent = true

-- Window options ------------------------------------------------------------
wo.wrap = true
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.signcolumn = "yes"
