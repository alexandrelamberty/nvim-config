-- DAP for Javascript & Typescript with Chrome
-- chrome has to be started with a remote debugging port google-chrome-stable --remote-debugging-port=9222
local dap = require('dap')

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/repos/vscode-chrome-debug/out/src/chromeDebug.js"}
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        name = 'Attach to process javascriptreact',
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        name = 'Attach to process typescript',
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}
