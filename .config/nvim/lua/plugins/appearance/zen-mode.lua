return {
	'folke/zen-mode.nvim',
	keys = {
		{
			'<leader>z',
			function()
				require('zen-mode').toggle({
					window = {
						width = 200,
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
