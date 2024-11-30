return {
	'Vigemus/iron.nvim',
	keys = {
		{ '<leader>rp', '<cmd>IronRepl<cr>', desc = '[R]un RE[P]L' },
		{
			'<leader>rp',
			function()
				require('iron.core').visual_send()
			end,
			mode = { 'v' },
			desc = '[R]un RE[P]L',
		},
	},
	config = function()
		require('iron.core').setup({
			config = {
				repl_definition = {
					python = require('iron.fts.python').python,
				},
			},
		})
	end,
}
