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

			local function desc(text)
				return { text = text }
			end

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Actions
			map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
			map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
			map('v', '<leader>hs', function()
				gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Stage hunk' })
			map('v', '<leader>hr', function()
				gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
			end, { desc = 'Reset hunk' })
			map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
			map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
			map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
			map('n', '<leader>hb', function()
				gitsigns.blame_line({ full = true })
			end, { desc = 'Blame line' })
			map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
			map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff unstaged changes?' })
			map('n', '<leader>hD', function()
				gitsigns.diffthis('~')
			end, { desc = 'Diff previous commit?' })
			map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Toggle deleted' })

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
