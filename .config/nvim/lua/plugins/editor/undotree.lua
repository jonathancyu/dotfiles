return {
	'mbbill/undotree',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{ '<leader>u', vim.cmd.UndotreeToggle, desc = '[U]ndotree' },
	},
}
