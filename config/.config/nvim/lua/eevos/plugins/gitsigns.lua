-- gitsigns
-- https://github.com/lewis6991/gitsigns.nvim

require('gitsigns').setup {
	signs = {
		-- TODO: add hl to colorscheme
		add          = {
			hl = 'GitSignsAdd',
			text = '▎',
			numhl = 'GitSignsAddNr',
			linehl = 'GitSignsAddLn'
		},
		change       = {
			hl = 'GitSignsChange',
			text = '▎',
			numhl = 'GitSignsChangeNr',
			linehl = 'GitSignsChangeLn'
		},
		delete       = {
			hl = 'GitSignsDelete',
			text = '契',
			numhl = 'GitSignsDeleteNr',
			linehl = 'GitSignsDeleteLn'
		},
		topdelete    = {
			hl = 'GitSignsDelete',
			text = '契',
			numhl = 'GitSignsDeleteNr',
			linehl = 'GitSignsDeleteLn'
		},
		changedelete = {
			hl = 'GitSignsChange',
			text = '▎',
			numhl = 'GitSignsChangeNr',
			linehl = 'GitSignsChangeLn'
		},
	},
	numhl = false,
	linehl = false,
	sign_priority = 6,
	update_debounce = 200,
	status_formatter = nil,

	on_attach = function(bufnr)
		-- print("Gitsigns attached to buffer")
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation

		-- next hunk
		map('n', ']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, { expr = true, desc = "Next Hunk" })

		-- previous hunk
		map('n', '[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true, desc = "Previous Hunk" })

		-- Actions
		map('n', '<leader>hs', gs.stage_hunk, { desc = "Hunk Stage" })
		map('n', '<leader>hr', gs.reset_hunk, { desc = "Hunk Reset" })
		map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "Hunk stage" })
		map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = "Hunk reset" })
		map('n', '<leader>hS', gs.stage_buffer, { desc = "Hunk Stage" })
		map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Hunk Undo" })
		map('n', '<leader>hR', gs.reset_buffer, { desc = "Hunk reset" })
		map('n', '<leader>hp', gs.preview_hunk, { desc = "Hunk preview" })
		map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = "Hunk blame" })
		map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle blame" })
		map('n', '<leader>hd', gs.diffthis, { desc = "Hunk diff" })
		map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Hunk diff ~" })
		map('n', '<leader>td', gs.toggle_deleted, { desc = "Toggle delete" })

		-- Text object
		map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
	end
}
