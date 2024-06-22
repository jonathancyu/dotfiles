return {
	'mbbill/undotree',
	branch = '*',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle undotree' },
	},
}
