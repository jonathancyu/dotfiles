return {
	{
		'OXY2DEV/markview.nvim',
		lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {
			latex = { enable = false },
		},
	},
	{
		-- 'epilande/checkbox-cycle.nvim',
		-- ft = 'markdown',
		-- opts = {
		-- 	states = { '[ ]', '[/]', '[x]', '[~]' },
		-- },
		-- keys = {
		-- 	{
		-- 		'<CR>',
		-- 		'<Cmd>CheckboxCycleNext<CR>',
		-- 		desc = 'Checkbox Next',
		-- 		ft = { 'markdown' },
		-- 		mode = { 'n', 'v' },
		-- 	},
		-- 	{
		-- 		'<S-CR>',
		-- 		'<Cmd>CheckboxCyclePrev<CR>',
		-- 		desc = 'Checkbox Previous',
		-- 		ft = { 'markdown' },
		-- 		mode = { 'n', 'v' },
		-- 	},
		-- },
	},
}
