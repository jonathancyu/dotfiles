return {
	'tamton-aquib/duck.nvim',

	keys = {
		{
			'<C-q>',
			function()
				require('duck').hatch('🦍')
			end,
			desc = 'Duck',
		},
		{
			'<leader>dk',
			function()
				require('duck').cook()
			end,
			desc = 'Kill duck',
		},
		{
			'<leader>da',
			function()
				require('duck').cook_all()
			end,
			desc = 'Kill all ducks',
		},
	},
}
