-- Settings for Global variables, Global options and Window options
TERMINAL = vim.fn.expand('$TERMINAL')

-- Setters
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
-- vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- Set syntax highlights on
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=2') -- Change the number of space characters inserted for indentation
-- vim.cmd('set highlight EndOfBuffer ctermbg=333333 ctermfg=333333') -- Change the ≃

-- Global options
vim.g.colorscheme = 'material'
vim.g.material_theme_style = "ocean-community"

-- Options
vim.o.termguicolors = true -- set term giu colors most terminals support this
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.title = true -- Terminal title
vim.o.titlestring = "%<%F% - nvim"
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.showtabline = 0 -- Always show tabs
vim.o.showmode = true -- We don't need to see things like -- INSERT -- anymore
-- TODO: Check backup workflow, change dirs
vim.opt.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else

-- Buffer options
vim.bo.expandtab = true -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart

-- Window options
vim.wo.wrap = true -- Display long lines as just one line
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
