-- NvimTree
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
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
    width = 50,
    side = 'right',
  },
  filters = {
    dotfiles = false,
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
