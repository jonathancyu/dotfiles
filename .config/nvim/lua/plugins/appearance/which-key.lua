return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require('which-key').setup()

		require('which-key').add({
			{ '<leader>c', desc = '[C]ode' },
			{ '<leader>d', desc = '[D]ebug' },
			{ '<leader>g', desc = '[G]it' },
			{ '<leader>h', desc = 'Git [H]unk' },
			{ '<leader>h', desc = 'Git [H]unk', mode = 'v' },
			{ '<leader>s', desc = '[S]earch' },
			{ '<leader>t', desc = '[T]est' },
			{ '<leader>r', desc = '[R]un' },
			{ '<leader>w', desc = '[W]indow' },
			{ '<leader>x', desc = 'Trouble' },
		})
	end,
}
