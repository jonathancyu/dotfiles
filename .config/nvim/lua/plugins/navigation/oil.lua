return {
	'stevearc/oil.nvim',
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
		}
	},
	-- Optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{
			'-',
			'<cmd>Oil<cr>',
			desc = 'Open parent directory',
		},
	},
}
