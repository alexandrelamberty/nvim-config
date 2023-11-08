-- Nvim Tree sitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require 'nvim-treesitter.configs'.setup {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {
		"haskell"
	},
	highlight = {
		enable = true
	},
	indent = {
		enable = true,
		disable = {
			"yaml",
			"python",
			"html",
			"javascript"
		}
	},
	-- TODO seems to be broken
	-- indent = {enable = {"javascriptreact"}},
	autotag = {
		enable = true
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
 	
	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["at"] = "@class.outer",
				["it"] = "@class.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["a/"] = "@comment.outer",
				["i/"] = "@comment.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["as"] = "@statement.outer",
				["is"] = "@scopename.inner",
				["aA"] = "@attribute.outer",
				["iA"] = "@attribute.inner",
				["aF"] = "@frame.outer",
				["iF"] = "@frame.inner",
			},
		},
	},
}
