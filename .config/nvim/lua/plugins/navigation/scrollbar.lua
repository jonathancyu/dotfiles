return {
	'petertriho/nvim-scrollbar',
	dependencies = { 'catppuccin' },
	config = function()
		local colors = require('catppuccin.palettes').get_palette('macchiato')
		require('scrollbar').setup({
			handle = {
				color = colors.surface1,
			},
			handlers = {
				cursor = false,
			},
			excluded_filetypes = {
				'alpha',
				'dropbar_menu',
				'dropbar_menu_fzf',
				'DressingInput',
				'cmp_docs',
				'cmp_menu',
				'noice',
				'prompt',
				'TelescopePrompt',
			},
		})
	end,
}
