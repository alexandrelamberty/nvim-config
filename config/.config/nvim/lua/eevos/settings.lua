-- Settings for Global variables, Global options and Window options
TERMINAL = vim.fn.expand('$TERMINAL')

-- Setters
vim.cmd('set iskeyword+=-')           -- treat dash separated words as a word text object"
vim.cmd('set inccommand=split')       -- Make substitution work in realtime
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on')                  -- Set syntax highlights on
vim.cmd('set colorcolumn=99999')      -- fix indentline for now
vim.cmd('set ts=4')                   -- Insert 2 spaces for a tab
vim.cmd('set sw=2')                   -- Change the number of space characters inserted for indentation
vim.cmd('set clipboard+=unnamedplus')

-- Global options
vim.g.material_style = "deep ocean"

-- Options
vim.o.termguicolors = true   -- set term giu colors most terminals support this
vim.o.hidden = true          -- Required to keep multiple buffers open multiple buffers
vim.o.title = true           -- Terminal title
vim.o.titlestring = "%F"
vim.o.pumheight = 10         -- Makes popup menu smalr
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.laststatus = 2         -- Single status bar Neovim 8.0
-- vim.o.cmdheight = 1 -- More space for displaying messages
vim.o.mouse = "a"            -- Enable your mouse
vim.o.splitbelow = true      -- Horizontal splits will automatically be below
vim.o.splitright = true      -- Vertical splits will automatically be to the right
vim.o.conceallevel = 0       -- So that I can see `` in markdown files
vim.o.showtabline = 0        -- Always show tabs
vim.o.showmode = true        -- We don't need to see things like -- INSERT -- anymore
-- TODO: Check backup workflow, change dirs

vim.o.writebackup = false       -- This is recommended by coc
vim.o.updatetime = 300          -- Faster completion
vim.o.timeoutlen = 100          -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else

vim.opt.backup = false
vim.opt.swapfile = false -- Disable swapfile

vim.opt.scrolloff = 8    -- Keep lines of context

-- Format
-- vim.opt.formatoptions:remove('r') 
-- vim.opt.formatoptions:remove { "c", "r", "o" }

-- Spell
-- @see eevos.spell
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Buffer options
vim.bo.expandtab = true   -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart

-- Window options
vim.wo.wrap = true           -- Display long lines as just one line
vim.wo.number = true         -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true     -- Enable highlighting of the current line
vim.wo.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
