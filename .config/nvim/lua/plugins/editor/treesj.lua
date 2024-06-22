return {
	'Wansmer/treesj',
	keys = {
		{ '<space>j', ':TSJToggle<CR>', desc = 'Toggle [j]oin line' },
	},
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	opts = {
		max_join_length = 500,
		use_default_keymaps = false,
	},
}
