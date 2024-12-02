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
		words = { enabled = true, debounce = 100, notify_jump = true },
	},
	keys = {
		{
			'[r',
			function()
				require('snacks.words').jump(-1)
			end,
			mode = { 'n' },
			desc = 'Previous reference',
		},
		{
			']r',
			function()
				require('snacks.words').jump(1)
			end,
			desc = 'Next reference',
		},
	},
}
