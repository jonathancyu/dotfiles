return {
	'nvimtools/none-ls.nvim',
	dependencies = {
		'nvimtools/none-ls-extras.nvim',
		{ 'ThePrimeagen/refactoring.nvim', opts = {
			show_success_message = true,
		} },
	},

	config = function()
		-- deprecated sources here https://github.com/nvimtools/none-ls.nvim/issues/58
		local null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				require('none-ls.diagnostics.ruff'),
				require('none-ls.diagnostics.yamllint'),
				require('none-ls.formatting.latexindent'),
				null_ls.builtins.code_actions.refactoring,
			},
			debug = true,
		})
	end,
}
