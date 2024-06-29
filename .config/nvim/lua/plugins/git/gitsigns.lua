return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',
	opts = {
		sign_priority = 15, -- higher than diagnostic, todo signs. lower than dapui breakpoint sign
		signs = {
			add = { text = '▐' },
			change = { text = '▐' },
		},
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Hunks
			map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[S]tage hunk' })
			map('v', '<leader>hs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = '[S]tage hunk' })
			map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[R]eset hunk' })
			map('v', '<leader>hr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = '[R]eset hunk' })
			map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = '[U]ndo stage hunk' })
			map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[P]review hunk' })

			-- Git
			map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
			map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
			map('n', '<leader>gd', gitsigns.toggle_deleted, { desc = 'Toggle [D]eleted' })
			map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff unstaged changes' })
			map('n', '<leader>gD', function()
				gitsigns.diffthis('~')
			end, { desc = '[D]iff previous commit' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
		end,
	},
	keys = {
		{
			']c',
			'<cmd>Gitsigns next_hunk<CR>',
			desc = 'Next diff hunk',
		},
		{
			'[c',
			'<cmd>Gitsigns prev_hunk<CR>',
			desc = 'Next diff hunk',
		},
	},
}
