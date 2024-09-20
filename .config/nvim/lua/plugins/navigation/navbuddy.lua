return {
	'SmiteshP/nvim-navbuddy',
	dependencies = {
		'SmiteshP/nvim-navic',
		'MunifTanjim/nui.nvim',
	},
	opts = {
		window = {
			size = "80%"

		},
		lsp = { auto_attach = true },
	},
	keys = {
		{ '<leader>n', '<cmd>Navbuddy<cr>', desc = '[N]avbuddy' },
	},
}
