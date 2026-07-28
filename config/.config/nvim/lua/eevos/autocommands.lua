-- ============================================================================
-- Autocommands
-- Modern Lua-based implementation
-- ============================================================================

local api = vim.api
local handlers = require("eevos.handlers")

-- ----------------------------------------------------------------------------
-- Helpers
-- ----------------------------------------------------------------------------

local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

-- ----------------------------------------------------------------------------
-- General settings
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("TextYankPost", {
  group = augroup("general_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
  end,
})

api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  group = augroup("general_formatoptions"),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- ----------------------------------------------------------------------------
-- Dashboard
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("FileType", {
  group = augroup("dashboard"),
  pattern = "dashboard",
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.swapfile = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.cursorcolumn = false
    vim.opt_local.spell = false
    vim.opt_local.list = false
    vim.opt_local.bufhidden = "wipe"
    vim.opt_local.colorcolumn = ""
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.matchpairs = ""

    vim.opt.showtabline = 0

    api.nvim_create_autocmd("BufLeave", {
      buffer = 0,
      once = true,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })
  end,
})

-- ----------------------------------------------------------------------------
-- Markdown
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("FileType", {
  group = augroup("markdown"),
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- ----------------------------------------------------------------------------
-- Filetype fixes
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("solidity"),
  pattern = "*.sol",
  callback = function()
    vim.bo.filetype = "solidity"
  end,
})

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("gemini"),
  pattern = "*.gmi",
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})

-- ----------------------------------------------------------------------------
-- Buffer-local bindings
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("FileType", {
  group = augroup("buffer_q"),
  pattern = { "dashboard", "lspinfo", "floaterm" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = true, silent = true })
  end,
})

-- ----------------------------------------------------------------------------
-- Auto formatters
-- ----------------------------------------------------------------------------

local format_group = augroup("auto_format")

if O.python.autoformat then
  api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*.py",
    callback = function()
      handlers.format()
    end,
  })
end

if O.tsserver.autoformat then
  api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = { "*.js", "*.jsx" },
    callback = function()
      handlers.format()
    end,
  })
end

if O.lua.autoformat then
  api.nvim_create_autocmd("BufWritePost", {
    group = format_group,
    pattern = "*.lua",
    callback = function()
      handlers.format()
    end,
  })
end

if O.json.autoformat then
  api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*.json",
    callback = function()
      lsp_format(1000)
    end,
  })
end
