return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	opts = {
		open_fold_hl_timeout = 100,
		provider_selector = function()
			return { 'treesitter', 'indent' }
		end,
	},
}
