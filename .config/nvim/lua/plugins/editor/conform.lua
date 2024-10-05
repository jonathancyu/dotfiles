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
		{
			'<leader>cf',
			mode = { 'n' },
			function()
				local message = ''
				if vim.g.disable_autoformat == true then
					vim.g.disable_autoformat = false
					message = 'Enabled auto-formatting'
				else
					vim.g.disable_autoformat = true
					message = 'Disabled auto-formatting'
				end
				vim.notify(message, vim.log.levels.INFO, { title = 'Conform' })
				require('conform').format({ async = true, lsp_format = 'fallback' })
			end,
			desc = 'Disable auto[f]ormat',
		},
	},
	config = function()
		vim.g.disable_autoformat = true
		require('conform').setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				rust = { 'rustfmt' },
				python = { 'black' },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = 'fallback' }
			end,
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
		})
	end,
}
