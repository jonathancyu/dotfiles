return {
	'nvimtools/none-ls.nvim',
	dependencies = {
		'nvimtools/none-ls-extras.nvim',
		{ 'ThePrimeagen/refactoring.nvim', opts = {
			show_success_message = true,
		} },
	},

	config = function()
		local null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.code_actions.refactoring,
			},
		})
	end,
}
