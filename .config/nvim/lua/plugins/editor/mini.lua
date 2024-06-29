return {
	'echasnovski/mini.nvim',
	config = function()
		-- require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		local indentscope = require('mini.indentscope')
		indentscope.setup({
			symbol = '┃',
			draw = {
				delay = 50,
				animation = indentscope.gen_animation.none(),
			},
			mappings = {},
		})
	end,
}
