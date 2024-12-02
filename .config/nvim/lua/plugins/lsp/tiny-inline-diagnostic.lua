return {
	'rachartier/tiny-inline-diagnostic.nvim',
	event = 'LspAttach',
	priority = 1000,
	opts = {
		preset = 'classic',
	},
	config = function(opts)
		require('tiny-inline-diagnostic').setup(opts)
		vim.diagnostic.config({ virtual_text = false })
	end,
}
