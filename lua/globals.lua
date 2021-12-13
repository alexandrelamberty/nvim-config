--[[
O is the global options object

Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

O = {
	auto_close_tree = 0,
	auto_complete = true,
	colorscheme = 'material',
	hidden_files = true,
	wrap_lines = false,
	number = true,
	relative_number = true,
	shell = 'bash',

	-- @usage pass a table with your desired languages
	treesitter = {
		ensure_installed = "all",
		ignore_install = {"haskell"},
		highlight = {enabled = true},
		playground = {enabled = true},
		rainbow = {enabled = false}
	},

	database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
	python = {
		linter = '',
		-- @usage can be 'yapf', 'black'
		formatter = '',
		autoformat = false,
		isort = false,
		diagnostics = {virtual_text = true, signs = true, underline = true}
	},
	dart = {sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'},
	lua = {
		-- @usage can be 'lua-format'
		formatter = '',
		autoformat = false,
		diagnostics = {virtual_text = true, signs = true, underline = true}
	},
	sh = {
		-- @usage can be 'shellcheck'
		linter = '',
		-- @usage can be 'shfmt'
		formatter = '',
		autoformat = false,
		diagnostics = {virtual_text = true, signs = true, underline = true}
	},
	tsserver = {
		-- @usage can be 'eslint'
		linter = '',
		-- @usage can be 'prettier'
		formatter = '',
		autoformat = false,
		diagnostics = {virtual_text = true, signs = true, underline = true}
	},
	json = {
		-- @usage can be 'prettier'
		formatter = '',
		autoformat = false,
		diagnostics = {virtual_text = true, signs = true, underline = true}
	},
	tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},
	clang = {
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	ruby = {
		diagnostics = {virtualtext = true, signs = true, underline = true},
		filetypes = {'rb', 'erb', 'rakefile'}
	}
	-- css = {formatter = '', autoformat = false, virtual_text = true},
	-- json = {formatter = '', autoformat = false, virtual_text = true}
}

O.clang.diagnostics.virtual_text = false
O.clang.diagnostics.signs = false
O.clang.diagnostics.underline = false

-- python
-- add things like O.python.formatter.yapf.exec_path
-- add things like O.python.linter.flake8.exec_path
-- add things like O.python.formatter.isort.exec_path
O.python.formatter = 'yapf'
-- O.python.linter = 'flake8'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true

-- lua
-- TODO look into stylua
O.lua.formatter = 'lua-format'
-- O.lua.formatter = 'lua-format'
O.lua.autoformat = false

-- javascript
O.tsserver.formatter = 'prettier'
O.tsserver.linter = nil
O.tsserver.autoformat = true

-- json
O.json.autoformat = true

-- create custom autocommand field (This would be easy with lua)

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

