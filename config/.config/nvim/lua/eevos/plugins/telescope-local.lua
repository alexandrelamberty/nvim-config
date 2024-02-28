local sorters = require "telescope.sorters"
local actions = require "telescope.actions"
local actions_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local dropdown = require("telescope.themes").get_dropdown {}

local M = {}

M.show = function()
	local function set_spell(prompt_bufnr)
		local selected = actions_state.get_selected_entry()
		if selected[1] == "none" then
			vim.cmd('set nospell')
		end
		local cmd = 'set spell spelllang=' .. selected[1]
		vim.cmd(cmd)
		actions.close(prompt_bufnr)
		print(selected[1])
	end

	local opts = {
		prompt_title = "Spell",
		finder = finders.new_table {
			results = {
				{ "English", "en_US" },
				{ "French",  "fr_BE" },
				{ "Spanish", "es" },
				{ "None",    "none" },
			},
			entry_maker = function(entry)
				return {
					value = entry[2],
					display = entry[1],
					ordinal = entry[1],
				}
			end
		},
		sorter = sorters.get_generic_fuzzy_sorter({}),

		attach_mappings = function(_, map)
			actions.select_default:replace(function()
				map("i", "<CR>", set_spell)
				-- actions.close(prompt_bufnr)
				-- local selection = action_state.get_selected_entry()
				-- print(vim.inspect(selection))
				-- vim.api.nvim_put({ selection[1] }, "", false, true)
			end)
			return true
		end,
	}

	local picker = pickers.new(dropdown, opts)
	picker:find()
end

vim.api.nvim_create_user_command("Spell", function()
	M.show()
end, {})

return M
