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
		format_after_save = function(bufnr)
			-- Enable autoformat on certain filetypes
			local enabled_filetypes = { 'lua', 'rust' }
			if not vim.tbl_contains(enabled_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match('/node_modules/') then
				return
			end
			-- ...additional logic...
			return { timeout_ms = 500, lsp_format = 'fallback' }
		end,
	},
}
