return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
	},
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
	config = function()
		require('trouble').setup({})
		local actions = require('telescope.actions')
		local open_with_trouble = require('trouble.sources.telescope').open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require('trouble.sources.telescope').add

		local telescope = require('telescope')

		telescope.setup({
			defaults = {
				mappings = {
					i = { ['<c-t>'] = open_with_trouble },
					n = { ['<c-t>'] = open_with_trouble },
				},
			},
		})
	end,
}
