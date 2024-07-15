return {
	'folke/trouble.nvim',
	cmd = 'Trouble',
	keys = {
		{
			'<leader>xx',
			'<cmd>Trouble diagnostics toggle<cr>',
			desc = '[D]iagnostics',
		},
		{
			'<leader>xd',
			'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
			desc = 'Buffer [D]iagnostics',
		},
		{
			'<leader>xs',
			'<cmd>Trouble symbols toggle focus=false<cr>',
			desc = '[S]ymbols',
		},
		{
			'gr',
			'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
			desc = '[G]o to [R]eferences',
		},
		{
			'<leader>xt',
			'<cmd>Trouble todo<cr>',
			desc = '[R]eferences',
		},
		{
			'<leader>xr',
			'<cmd>Trouble lsp toggle pinned=true<cr>',
			desc = '[R]eferences',
		},
		{
			'<leader>xl',
			'<cmd>Trouble loclist toggle<cr>',
			desc = '[L]ocations',
		},
		{
			'<leader>xq',
			'<cmd>Trouble qflist toggle<cr>',
			desc = '[Q]uickfix',
		},
	},
	opts = {},
}
