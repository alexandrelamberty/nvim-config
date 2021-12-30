O = {
    shell = 'bash',
    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },

    python = {
        -- @usage can be flake8
        linter = 'flake8',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = true,
        isort = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    lua = {
        -- @usage can be 'lua-format' or 'lua-fmt'
        formatter = 'lua-fmt',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck' or 'shfmt'
        linter = 'shellcheck',
        formatter = '',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = 'eslint',
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},
    clang = {diagnostics = {virtual_text = true, signs = true, underline = true}},
    ruby = {diagnostics = {virtualtext = true, signs = true, underline = true}, filetypes = {'rb', 'erb', 'rakefile'}},
    -- css = {formatter = '', autoformat = false, virtual_text = true},
    -- json = {formatter = '', autoformat = false, virtual_text = true}
    markdown = {
        -- @usage can be 'prettier'
        formatter = 'markdownlint',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    }
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

