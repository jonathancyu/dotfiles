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
}
