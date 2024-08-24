return {
	'kevinhwang91/nvim-ufo',
	dependencies = { 'kevinhwang91/promise-async' },
	keys = {
		-- { 'n', 'zR', require('ufo').openAllFolds },
		-- { 'n', 'zM', require('ufo').closeAllFolds },
	},
	opts = {
		{
			provider_selector = function()
				return { 'treesitter', 'indent' }
			end,
		},
	},
}
