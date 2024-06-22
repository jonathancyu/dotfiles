return {
	'stevearc/conform.nvim',
	keys = {
		{
			'<leader>f',
			mode = { 'n' },
			function()
				require('conform').format({ async = true, lsp_format = 'fallback' })
			end,
			desc = '[F]ormat',
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			rust = { 'rustfmt' },
		},
		format_on_save = function(bufnr)
			local autoformat_whitelist = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = autoformat_whitelist[vim.bo[bufnr].filetype],
			}
		end,
	},
}
