-- DAP for Javascript and Typescript with Firefox
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-firefox
-- https://github.com/firefox-devtools/vscode-firefox-debug.git
local dap = require('dap')

dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/path/to/vscode-firefox-debug/dist/adapter.bundle.js'},
}

dap.configurations.typescript = {
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/usr/bin/firefox'
}
