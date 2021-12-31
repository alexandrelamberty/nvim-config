require("dapui").setup()

-- nvim-dap signs
vim.fn.sign_define('DapBreakpoint', {text = '', texthl = '#3498DB', linehl = '#3498DB', numhl = '#3498DB'})
vim.fn.sign_define('DapBreakpointCondition', {text = '', texthl = 'blue', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'blue', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint', {text = '', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '', texthl = '', linehl = '', numhl = ''})
