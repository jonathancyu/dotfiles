return {
	'echasnovski/mini.nvim',
	config = function()
		-- Bracketed
		require('mini.bracketed').setup()
		-- Files
		require('mini.files').setup({
			windows = {
				max_number = 2,
				preview = true,
				width_preview = 40,
			},
		})
		-- require('mini.ai').setup { n_lines = 500 }
		require('mini.surround').setup()
		-- Indentscope
		local indentscope = require('mini.indentscope')
		indentscope.setup({
			symbol = '┃',
			draw = {
				delay = 50,
				animation = indentscope.gen_animation.none(),
			},
			mappings = {},
		})
		vim.api.nvim_create_autocmd({ 'FileType' }, {
			desc = 'Disable indentscope for filetypes',
			callback = function()
				local blacklist = {
					'alpha',
				}
				if vim.tbl_contains(blacklist, vim.bo.filetype) then
					vim.b.miniindentscope_disable = true
				end
			end,
		})
	end,
	keys = {
		{
			'-',
			function()
				require('mini.files').open(vim.api.nvim_buf_get_name(0))
			end,
			desc = 'Open parent directory',
		},
	},
}
