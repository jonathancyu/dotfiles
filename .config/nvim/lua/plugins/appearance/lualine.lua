return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/lsp-status.nvim',
	},
	opts = {
		options = {
			ignore_focus = { 'neo-tree', 'fugitive', 'OverseerList' },
		},
		sections = {
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_x = {
				-- '%=',
				{
					'harpoon2',
					indicators = { ' 1 ', ' 2 ', ' 3 ', ' 4 ' },
					active_indicators = { '[1]', '[2]', '[3]', '[4]' },
				},
				{
					'overseer',
				},
			},
		},
	},
}
