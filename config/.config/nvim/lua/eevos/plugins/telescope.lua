local actions = require('telescope.actions')

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    find_command = { 'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
    prompt_position = "bottom",
    -- prompt_prefix = " ",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_defaults = { horizontal = { mirror = false }, vertical = { mirror = false } },
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '', '', '', '', '', '', '', '' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,
        ["<esc>"] = actions.close,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        ["<CR>"] = actions.select_default + actions.center

        -- You can perform as many actions in a row as you like
        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        -- ["<C-i>"] = my_cool_custom_action,
      }
    },
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 0.4, -- Adjust the height (30% of the editor)
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    buffers = {
      layout_strategy = "bottom_pane",
      layout_config = {
        height = 0.4, -- 40% height
        width = 1.0, -- Full width
      },
      prompt_prefix = "🗂 ", -- Optional: Custom prefix for buffers picker
      sorting_strategy = "ascending", -- Sort buffers in ascending order
      ignore_current_buffer = true, -- Don't show the current buffer
      win = {
        border = "none",
      },
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer, -- Delete buffer
        },
        n = {
          ["dd"] = actions.delete_buffer, -- Delete buffer in normal mode
        },
      },
    }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
