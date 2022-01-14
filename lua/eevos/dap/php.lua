-- DAP for PHP
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
-- https://github.com/xdebug/vscode-php-debug
local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = {
    os.getenv("HOME") .. '/repos/vscode-php-debug/out/phpDebug.js'
  }
}
-- @see 
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000
  }
}
