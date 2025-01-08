return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		notifier = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		rename = { enabled = true },
		indent = { enabled = false, chunk = { only_scope = true, only_current = true } },
		scratch = {
			enabled = true,
			win = {
				width = 0.6,
				height = 0.6,
				bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
				minimal = false,
				noautocmd = false,
				-- position = "right",
				zindex = 20,
				wo = { winhighlight = 'NormalFloat:Normal' },
				border = 'rounded',
				title_pos = 'center',
				footer_pos = 'center',
			},
		},
		statuscolumn = {
			enabled = true,
			left = {
				'sign', -- neotest signs, dapui breakpoints
				'fold',
				'mark', -- vim marks
			},
			right = {
				'git',
			},
			folds = {
				open = false, -- Don't show symbol for folds that aren't closed
				git_hl = true, -- TODO: what does this do?
			},
		},
		styles = {
			zen = {
				backdrop = {
					transparent = true,
					blend = 40,
				},
				keys = {
					q = 'close',
				},
			},
		},
		words = { enabled = true, debounce = 100, notify_jump = true },
		zen = { enabled = true, toggles = { dim = false } },
	},

	-- stylua: ignore
	keys = {
		{ '<leader>ns', function() Snacks.notifier.show_history() end, desc = '[N]otification [S]ummary' },
		{ '<leader>nc', function() Snacks.notifier.hide() end, desc = '[C]lear Notifications' },
		{ '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
		{ '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
		{ '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
		{ '[k', function() Snacks.words.jump(-1) end, mode = { 'n' }, desc = 'Previous reference' },
		{ ']k', function() Snacks.words.jump(1) end, desc = 'Next reference' },
		{ '<leader>z', function()
			Snacks.zen.zen({
				width = 150,
				show = {
					statusline = true
				}
			})
		end, desc = 'Less [z]en mode' },
	},
}
