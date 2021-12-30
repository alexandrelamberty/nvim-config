local python = {}
-- TODO replace with path argument
local flake8 = {
    lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

if O.python.linter == 'flake8' then table.insert(python, flake8) end
if O.python.isort then table.insert(python, isort) end
if O.python.formatter == 'yapf' then
    table.insert(python, yapf)
elseif O.python.formatter == 'black' then
    table.insert(python, black)
end

-- lua
local lua = {}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
local lua_fmt = {formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true}
if O.lua.formatter == 'lua-format' then
    table.insert(lua, luaFormat)
elseif O.lua.formatter == 'lua-fmt' then
    table.insert(lua, lua_fmt)
end

-- sh
local sh = {}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
local shellcheck = {
    lintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
if O.sh.formatter == 'shfmt' then table.insert(sh, shfmt) end
if O.sh.linter == 'shellcheck' then table.insert(sh, shellcheck) end

-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g.
-- vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to
-- global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

-- Tsserver
local tsserver = {}
if O.tsserver.formatter == 'prettier' then table.insert(tsserver, prettier) end
if O.tsserver.linter == 'eslint' then table.insert(tsserver, eslint) end

-- Markdown
local markdown = {}
local markdownlint = {
    -- https://github.com/DavidAnson/markdownlint
    -- TODO default to global lintrc
    -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
    lintCommand = 'markdownlint -s',
    lintStdin = true,
    lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
}
local pandoc = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}
if O.markdown.formatter == 'markdownlint' then table.insert(markdown, markdownlint) end
if O.markdown.formatter == 'pandoc' then table.insert(markdown, pandoc) end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#efm
-- https://github.com/mattn/efm-langserver
return {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = lua,
            python = python,
            sh = sh,
            javascript = tsserver,
            javascriptreact = tsserver,
            typescript = tsserver,
            typescriptreact = tsserver,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            markdown = markdown
        }
    }
}
