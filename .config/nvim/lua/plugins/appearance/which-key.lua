return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require('which-key').setup()

		require('which-key').add({
			{ '<leader>c', desc = '[C]ode', icon = { icon = ' ', color = 'orange' } },
			{ '<leader>d', desc = '[D]ebug', icon = { icon = '󰃤 ', color = 'red' } },
			{ '<leader>g', desc = '[G]it' },
			{ '<leader>h', desc = 'Git [H]unk', icon = { name = 'git' } },
			{ '<leader>h', desc = 'Git [H]unk', mode = 'v' },
			{ '<leader>l', desc = '[L]LM', icon = { icon = ' ', color = 'green' } },
			{ '<leader>s', desc = '[S]earch', icon = { icon = '', color = 'blue' } },
			{ '<leader>t', desc = '[T]est', icon = {} },
			{ '<leader>r', desc = '[R]un' },
			{ '<leader>w', desc = '[W]indow', icon = { icon = ' ', color = 'blue' } },
			{ '<leader>x', desc = 'Trouble', icon = { icon = '󱖫 ', color = 'green' } },
		})
	end,
}
