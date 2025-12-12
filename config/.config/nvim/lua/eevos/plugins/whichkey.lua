local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  triggers = {
    { "<leader>", mode = { "n", "v" } },
  },
  plugins = {
    marks = true,      -- shows a list of your marks on ' and `
    registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20 -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false,      -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = true              -- bindings for prefixed with g
    }
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "",   -- symbol used between a key and it's label
    group = "",       -- symbol prepended to a group
    rules = {},
  },
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    height = {
      min = 4,
      max = 25
    }, -- min and max height of the columns
    width = {
      min = 20,
      max = 50
    },             -- min and max width of the columns
    spacing = 3,   -- spacing between columns
    align = "left" -- align columns left, center or right
  }
}

local keys = {
  { "<leader>F",  "function() require('telescope.builtin').find_files() end",                                                       desc = "Find files",            nowait = true, remap = false },
  { "<leader>H",  "<cmd>nohlsearch<CR>",                                                                                            desc = "No Highlight",          nowait = true, remap = false },
  { "<leader>T",  "<cmd>Telescope live_grep theme=ivy<cr>",                                                                         desc = "Find Text",             nowait = true, remap = false },
  { "<leader>b",  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers",               nowait = true, remap = false },
  { "<leader>z",  "<cmd>lua require('zen-mode').toggle()<CR>",                                                                      desc = "Toggle Zen Mode",       nowait = true, remap = false },
  { "<leader>c",  "<cmd>bd!<CR>",                                                                                                   desc = "Close Buffer",          nowait = true, remap = false },
  { "<leader>q",  "<cmd>q!<CR>",                                                                                                    desc = "Quit",                  nowait = true, remap = false },
  { "<leader>v",  "<cmd>vsplit<CR>",                                                                                                desc = "Split right",           nowait = true, remap = false },
  { "<leader>h",  "<cmd>split<CR>",                                                                                                 desc = "Split below",           nowait = true, remap = false },
  { "<leader>w",  "<cmd>w!<CR>",                                                                                                    desc = "Save",                  nowait = true, remap = false },
  { "<leader>d",  group = "DAP",                                                                                                    nowait = true,                  remap = false },
  { "<leader>dI", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",                               desc = "Breakpoint condition",  nowait = true, remap = false },
  { "<leader>da", "<cmd>lua require'dap'.continue()<cr>",                                                                           desc = "Continue",              nowait = true, remap = false },
  { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",                                                                  desc = "Toggle Breakpoint",     nowait = true, remap = false },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",                                                                          desc = "Step Into",             nowait = true, remap = false },
  { "<leader>dj", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",                        desc = "Log point message",     nowait = true, remap = false },
  { "<leader>dl", "<cmd>lua require'dap'.repl.open()<cr>",                                                                          desc = "Repl Open",             nowait = true, remap = false },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",                                                                          desc = "Step Over",             nowait = true, remap = false },
  { "<leader>dq", "<cmd>lua require'dap'.run_last()<cr>",                                                                           desc = "Run Last",              nowait = true, remap = false },
  { "<leader>dt", "<cmd>lua require'dap'.step_out()<cr>",                                                                           desc = "Step Out",              nowait = true, remap = false },
  { "<leader>du", "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<cr>",                      desc = "Scopes",                nowait = true, remap = false },
  { "<leader>dv", "<cmd>lua require'dap.ui.variables'.visual_hover()<cr>",                                                          desc = "UI Variable Hover",     nowait = true, remap = false },
  { "<leader>dw", "<cmd>lua require'dap.ui.widgets'.hover()<cr>",                                                                   desc = "Widget Hover",          nowait = true, remap = false },
  { "<leader>dx", "<cmd>lua require'dap.ui.variables'.scopes()<cr>",                                                                desc = "UI Scopes",             nowait = true, remap = false },
  { "<leader>dy", "<cmd>lua require'dap.ui.variables'.hover()<cr>",                                                                 desc = "UI Hover",              nowait = true, remap = false },
  { "<leader>dz", "<cmd>lua require'dapui'.toggle()<cr>",                                                                           desc = "UI",                    nowait = true, remap = false },
  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                                                                        desc = "Explorer",              nowait = true, remap = false },
  { "<leader>f",  group = "Fold",                                                                                                   nowait = true,                  remap = false },
  { "<leader>fC", "<cmd>set foldlevel=0<cr>",                                                                                       desc = "Close All",             nowait = true, remap = false },
  { "<leader>fO", "<cmd>set foldlevel=20<cr>",                                                                                      desc = "Open All",              nowait = true, remap = false },
  { "<leader>fc", "<cmd>foldclose<cr>",                                                                                             desc = "Close",                 nowait = true, remap = false },
  { "<leader>fo", "<cmd>foldopen<cr>",                                                                                              desc = "Open",                  nowait = true, remap = false },
  { "<leader>g",  group = "Git",                                                                                                    nowait = true,                  remap = false },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                                                                 desc = "Reset Buffer",          nowait = true, remap = false },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>",                                                                                desc = "Checkout branch",       nowait = true, remap = false },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>",                                                                                 desc = "Checkout commit",       nowait = true, remap = false },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                                                                                desc = "Diff",                  nowait = true, remap = false },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                                                                                 desc = "Lazygit",               nowait = true, remap = false },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                                                                    desc = "Next Hunk",             nowait = true, remap = false },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                                                                    desc = "Prev Hunk",             nowait = true, remap = false },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                                                   desc = "Blame",                 nowait = true, remap = false },
  { "<leader>go", "<cmd>Telescope git_status<cr>",                                                                                  desc = "Open changed file",     nowait = true, remap = false },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                                                                 desc = "Preview Hunk",          nowait = true, remap = false },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                                                   desc = "Reset Hunk",            nowait = true, remap = false },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                                                   desc = "Stage Hunk",            nowait = true, remap = false },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                                                              desc = "Undo Stage Hunk",       nowait = true, remap = false },
  { "<leader>l",  group = "LSP",                                                                                                    nowait = true,                  remap = false },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>",                                                                                        desc = "Installer Info",        nowait = true, remap = false },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                                                               desc = "Workspace Symbols",     nowait = true, remap = false },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                                         desc = "Code Action",           nowait = true, remap = false },
  { "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>",                                                                    desc = "Document Diagnostics",  nowait = true, remap = false },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>",                                                                          desc = "Format",                nowait = true, remap = false },
  { "<leader>li", "<cmd>LspInfo<cr>",                                                                                               desc = "Info",                  nowait = true, remap = false },
  { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                                                                    desc = "Next Diagnostic",       nowait = true, remap = false },
  { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",                                                                    desc = "Prev Diagnostic",       nowait = true, remap = false },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                                                                            desc = "CodeLens Action",       nowait = true, remap = false },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",                                                                  desc = "Quickfix",              nowait = true, remap = false },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                                                              desc = "Rename",                nowait = true, remap = false },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",                                                                        desc = "Document Symbols",      nowait = true, remap = false },
  { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>",                                                                   desc = "Workspace Diagnostics", nowait = true, remap = false },
  { "<leader>p",  group = "Packer",                                                                                                 nowait = true,                  remap = false },
  { "<leader>pS", "<cmd>PackerStatus<cr>",                                                                                          desc = "Status",                nowait = true, remap = false },
  { "<leader>pc", "<cmd>PackerCompile<cr>",                                                                                         desc = "Compile",               nowait = true, remap = false },
  { "<leader>pi", "<cmd>PackerInstall<cr>",                                                                                         desc = "Install",               nowait = true, remap = false },
  { "<leader>ps", "<cmd>PackerSync<cr>",                                                                                            desc = "Sync",                  nowait = true, remap = false },
  { "<leader>pu", "<cmd>PackerUpdate<cr>",                                                                                          desc = "Update",                nowait = true, remap = false },
  { "<leader>s",  group = "Search",                                                                                                 nowait = true,                  remap = false },
  { "<leader>sC", "<cmd>Telescope commands<cr>",                                                                                    desc = "Commands",              nowait = true, remap = false },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>",                                                                                   desc = "Man Pages",             nowait = true, remap = false },
  { "<leader>sR", "<cmd>Telescope registers<cr>",                                                                                   desc = "Registers",             nowait = true, remap = false },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>",                                                                                desc = "Checkout branch",       nowait = true, remap = false },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>",                                                                                 desc = "Colorscheme",           nowait = true, remap = false },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                                                   desc = "Find Help",             nowait = true, remap = false },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>",                                                                                     desc = "Keymaps",               nowait = true, remap = false },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>",                                                                                    desc = "Open Recent File",      nowait = true, remap = false },
  { "<leader>t",  group = "Terminal",                                                                                               nowait = true,                  remap = false },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",                                                                            desc = "Float",                 nowait = true, remap = false },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",                                                               desc = "Horizontal",            nowait = true, remap = false },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>",                                                                                    desc = "Node",                  nowait = true, remap = false },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>",                                                                                  desc = "Python",                nowait = true, remap = false },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                                                                                    desc = "Htop",                  nowait = true, remap = false },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                                                                                    desc = "NCDU",                  nowait = true, remap = false },
}


which_key.setup(setup)
which_key.add(keys)
