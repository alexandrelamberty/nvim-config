O = {
	shell = {
		-- @usage can be 'shellcheck',
		formatter = 'shfmt',
		autoformat = true,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	python = {
		-- @usage can be flake8
		linter = 'flake8',
		-- @usage can be 'yapf', 'black'
		formatter = '',
		autoformat = true,
		isort = false,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	lua = {
		-- @usage can be 'lua-format' or 'lua-fmt'
		formatter = 'lua-format',
		autoformat = true,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	tsserver = {
		-- @usage can be 'eslint'
		linter = 'eslint',
		formatter = 'prettier',
		autoformat = true,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	json = {
		-- @usage can be 'prettier'
		formatter = 'prettier',
		autoformat = false,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	yaml = {
		-- @usage can be 'prettier'
		formatter = 'prettier',
		autoformat = false,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	xml = {
		-- @usage can be 'prettier'
		formatter = 'prettier',
		autoformat = false,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	tailwindls = {
		filetypes = {
			'html',
			'css',
			'scss',
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact'
		}
	},
	clang = {
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	},
	ruby = {
		diagnostics = {
			virtualtext = true,
			signs = true,
			underline = true
		},
		filetypes = {
			'rb',
			'erb',
			'rakefile'
		}
	},
	markdown = {
		-- @usage can be 'prettier'
		formatter = 'markdownlint',
		autoformat = true,
		diagnostics = {
			virtual_text = true,
			signs = true,
			underline = true
		}
	}
}
