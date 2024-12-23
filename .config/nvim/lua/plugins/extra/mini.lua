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
			mappins = {
				synchronize = '<CR>',
			},
			windows = {
				max_number = 2,
				preview = true,
				width_preview = 100,
			},
		})
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesActionRename',
			callback = function(event)
				Snacks.rename.on_rename_file(event.data.from, event.data.to)
			end,
		})

		-- Surround: saiw)
		require('mini.surround').setup()

		-- Move: move text blocks around
		require('mini.move').setup({
			mappings = {
				left = nil,
				right = nil,
				down = nil,
				up = nil,
				line_left = '<M-Left>',
				line_right = '<M-Right>',
				line_down = '<M-Down>',
				line_up = '<M-Up>',
			},
		})
	end,
	-- stylua: ignore
	keys = {
		{ 'H', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end, desc = 'Open parent directory' },
		-- Mode: x
		{ 'H', function() require('mini.move').move_selection('left') end, desc = 'Move line left', mode = 'x'},
		{ 'J', function() require('mini.move').move_selection('down') end, desc = 'Move line down', mode = 'x'},
		{ 'K', function() require('mini.move').move_selection('up') end, desc = 'Move line up', mode = 'x'},
		{ 'L', function() require('mini.move').move_selection('right') end, desc = 'Move line right', mode = 'x'},
	},
}
