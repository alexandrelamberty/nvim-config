-- FIXME make local variabel belong to the class
local efm = {}

-- efm python configuration
efm.python = {}

-- TODO replace with path argument
local flake8 = {
    lintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

if O.python.linter == 'flake8' then table.insert(efm.python, flake8) end
if O.python.isort then table.insert(efm.python, isort) end
if O.python.formatter == 'yapf' then
    table.insert(efm.python, yapf)
elseif O.python.formatter == 'black' then
    table.insert(efm.python, black)
end

-- lua
efm.lua = {}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
local lua_fmt = {formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true}
if O.lua.formatter == 'lua-format' then
    table.insert(efm.lua, luaFormat)
elseif O.lua.formatter == 'lua-fmt' then
    table.insert(efm.lua, lua_fmt)
end

-- sh
efm.sh = {}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
local shellcheck = {
    lintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
if O.sh.formatter == 'shfmt' then table.insert(efm.sh, shfmt) end
if O.sh.linter == 'shellcheck' then table.insert(efm.sh, shellcheck) end

-- tsserver/web javascript react, vue, json, html, css, yaml
efm.prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

efm.eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

-- Tsserver
efm.tsserver = {}
if O.tsserver.formatter == 'prettier' then table.insert(efm.tsserver, efm.prettier) end
if O.tsserver.linter == 'eslint' then table.insert(efm.tsserver, efm.eslint) end

-- Markdown
efm.markdown = {}
local markdownlint = {
    -- https://github.com/DavidAnson/markdownlint
    -- TODO default to global lintrc
    -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
    lintCommand = 'markdownlint -s',
    lintStdin = true,
    lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
}
local pandoc = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}
if O.markdown.formatter == 'markdownlint' then table.insert(efm.markdown, markdownlint) end
if O.markdown.formatter == 'pandoc' then table.insert(efm.markdown, pandoc) end

return efm;
