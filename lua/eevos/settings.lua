-- Settings for Global variables, Global options and Window options
TERMINAL = vim.fn.expand('$TERMINAL')

-- Setters
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
--vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on')
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
-- vim.cmd('set highlight EndOfBuffer ctermbg=333333 ctermfg=333333') -- Change the ≃

-- Global options
vim.g.material_theme_style = "ocean-community"


-- Options
vim.opt.completeopt = { "menuone", "noselect" }
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
vim.o.title = true
vim.o.titlestring = "%<%F%=%l/%L - nvim"
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.showtabline = 0 -- Always show tabs
vim.o.showmode = true -- We don't need to see things like -- INSERT -- anymore
vim.opt.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.guifont = "FiraCode Nerd Font:h17"

-- Buffer options
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart

-- Window options
vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
vim.wo.number = O.number -- set numbered lines
vim.wo.relativenumber = O.relative_number -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
