-- nvim-dap
-- https://github.com/mfussenegger/nvim-dap
vim.fn.sign_define('DapBreakpoint', {text = '', texthl = 'red', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointCondition', {text = '', texthl = 'blue', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected', {text = '', texthl = 'blue', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint', {text = '', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped', {text = '', texthl = '', linehl = '', numhl = ''})

-- dap-ui
require("dapui").setup()

-- Protocols
require('eevos.dap.settings.chrome')
require('eevos.dap.settings.firefox')
require('eevos.dap.settings.node')
require('eevos.dap.settings.php')
require('eevos.dap.settings.python')
require('eevos.dap.settings.rust')
