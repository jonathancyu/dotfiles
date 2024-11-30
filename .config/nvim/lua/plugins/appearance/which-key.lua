return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function() -- This is the function that runs, AFTER loading
		local wk = require('which-key')
		wk.add({
			-- [C]ode
			{
				mode = 'n',
				{ '<leader>c', group = '[C]ode', icon = { icon = ' ', color = 'orange' } },
				{ '<leader>ci', desc = '[I]DE', icon = { icon = ' ', color = 'orange' } },
				{ '<leader>cn', '<cmd>set rnu!<cr>', desc = 'Toggle relative line [n]umbers' },
				{
					'<leader>cij',
					function()
						vim.cmd('!idea .')
					end,
					{ desc = 'Open in [I]ntelliJ' },
				},
				{
					'<leader>cip',
					function()
						vim.cmd('!pycharm .')
					end,
					{ desc = 'Open in [P]yCharm' },
				},
			},
			-- [L]azy / [L]ua
			{
				mode = 'n',
				{ '<leader>L', group = '[L]azy / [L]ua', icon = '󰒲 ' },
				{ '<leader>Ls', '<cmd>source %<cr>', desc = '[S]ource current file' },
				{
					'<leader>Lr',
					function()
						local plugin = vim.fn.expand('%:t'):gsub('%.lua$', '.nvim')
						print(plugin)
						if require('lazy.core.config').plugins[plugin] ~= nil then
							vim.cmd('Lazy reload ' .. plugin)
						else
							vim.notify('Plugin ' .. plugin .. ' does not exist.', vim.log.levels.WARN)
						end
					end,
					desc = '[L]azy.vim [r]eload current file',
				},
			},
			{ '<leader>d', desc = '[D]ebug', icon = { icon = '󰃤 ', color = 'red' } },
			{ '<leader>g', desc = '[G]it' },
			{ '<leader>h', desc = 'Git [H]unk', icon = { name = 'git' } },
			{ '<leader>h', desc = 'Git [H]unk', mode = 'v' },
			{ '<leader>l', desc = '[L]LM', icon = { icon = ' ', color = 'green' } },
			{ '<leader>s', desc = '[S]earch', icon = { icon = '', color = 'blue' } },
			{ '<leader>t', desc = '[T]est', icon = {} },
			{ '<leader>r', desc = '[R]un', icon = { icon = ' ', color = 'green' } },
			{ '<leader>x', desc = 'Trouble', icon = { icon = '󱖫 ', color = 'green' } },
		})

		-- [W]indow
		wk.add({
			mode = 'n',
			{ '<leader>w', group = '[W]indow', icon = { icon = ' ', color = 'blue' } },
			{ '<leader>wt', '<cmd>tab split<CR>', desc = 'Send [W]indow to new [T]ab' },
			{
				'<leader>wh',
				function()
					require('overseer').close()
					require('neo-tree').close_all()
					require('trouble').close()
					require('avante').close_sidebar()
					require('dapui').close()
					require('iron.core').hide_repl()
					vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z]])
				end,
				desc = '[H]ide windows',
			},
			{
				'<leader>wd',
				function()
					if vim.o.background == 'dark' then
						vim.o.background = 'light'
					else
						vim.o.background = 'dark'
					end
				end,
				desc = 'Toggle [D]ark mode',
			},
		})
		wk.setup({
			delay = function(ctx)
				return ctx.plugin and 0 or 200
			end,
		})
	end,
}
