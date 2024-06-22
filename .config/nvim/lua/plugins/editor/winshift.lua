return {
	'sindrets/winshift.nvim',
	opts = {},
	lazy = true,
	keys = {
		{ '<leader>wm', '<cmd>WinShift<cr>', desc = '[M]ove Window' },
		{ '<leader>ws', '<cmd>WinShift swap<cr>', desc = '[S]wap Window' },
	},
}
