return {
	'miversen33/sunglasses.nvim',
	keys = {
		{
			'<leader>ws',
			'<cmd>SunglassesEnableToggle<cr><cmd>SunglassesRefresh<cr>',
			desc = 'Toggle [W]indow [S]unglasses',
		},
	},
	opts = {
		filter_type = 'SHADE',
		filter_percent = 0.25,
	},
}
