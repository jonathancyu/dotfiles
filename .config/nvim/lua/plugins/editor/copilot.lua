return {
	{
		'AndreM222/copilot-lualine',
	},
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				filetypes = {
					yaml = true,
					markdown = true,
					['.'] = true,
				},
			})
		end,
	},
}
