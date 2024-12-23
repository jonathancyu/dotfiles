return {
	'folke/zen-mode.nvim',
	keys = {
		{
			'<leader>Z',
			function()
				require('zen-mode').toggle({
					window = {
						width = 150,
					},
					options = {
						-- TODO: make this work
						-- colorcolumn = nil,
					},
					plugins = {
						tmux = {
							enabled = true,
						},
					},
				})
			end,
			desc = '[Z]en mode',
		},
	},
}
