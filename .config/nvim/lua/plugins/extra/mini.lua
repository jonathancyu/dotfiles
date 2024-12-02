return {
	'echasnovski/mini.nvim',
	config = function()
		-- Bracketed: Add square bracket support
		require('mini.bracketed').setup({
			diagnostic = {
				options = {
					float = false, -- Disable opening float
				},
			},
		})

		-- Files: Manipulate files
		require('mini.files').setup({
			windows = {
				max_number = 2,
				preview = true,
				width_preview = 40,
			},
		})

		-- Surround: saiw)
		require('mini.surround').setup()

		-- Move: move text blocks around
		require('mini.move').setup({
			mappings = {
				left = 'H',
				right = 'L',
				down = 'J',
				up = 'K',
			},
		})

		-- Indentscope: Scope line marker
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
					'help',
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
