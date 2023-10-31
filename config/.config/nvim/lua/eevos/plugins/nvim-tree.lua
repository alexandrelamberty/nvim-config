-- NvimTree
-- https://github.com/nvim-tree/nvim-tree.lua

require 'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,
	-- open_on_setup = false,
	-- ignore_ft_on_setup = {},
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true
	-- },
	-- auto_close = false,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = ""
		}
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {}
	},
	system_open = {
		cmd = nil,
		args = {}
	},
	view = {
		width = 40,
		-- height = 30,
		side = 'left',
		-- auto_resize = false,
		-- mappings = {
		--   custom_only = false,
		--   list = {}
		-- }
	},
	filters = {
		dotfiles = true,
		custom = {}
	}
}

vim.g.nvim_tree_icons = {
	default = '',
	symlink = '',
	git = {
		unstaged = "",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = ""
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = ""
	}
}


vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
