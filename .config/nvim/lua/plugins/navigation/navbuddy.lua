return {
	'SmiteshP/nvim-navbuddy',
	dependencies = {
		'SmiteshP/nvim-navic',
		'MunifTanjim/nui.nvim',
	},
	opts = { lsp = { auto_attach = true } },
	keys = {
		{ '<leader>m', '<cmd>Navbuddy<cr>' },
	},
}
