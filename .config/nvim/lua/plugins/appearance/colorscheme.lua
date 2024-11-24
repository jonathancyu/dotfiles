local colorscheme = 'catppuccin'
return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			if colorscheme ~= 'catppuccin' then
				return
			end
			require('catppuccin').setup({
				background = {
					light = 'latte',
					dark = 'frappe',
				},
			})
			vim.cmd('colorscheme catppuccin-frappe')
		end,
	},
	{
		'scottmckendry/cyberdream.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			if colorscheme ~= 'cyberdream' then
				return
			end
			require('cyberdream').setup({
				transparent = true,
				italic_comments = false,
				hide_fillchars = false,
				-- borderless_telescope = { border = false },
				terminal_colors = false,
				theme = {
					variant = 'dark',
				},
				extensions = {
					alpha = true,
					cmp = true,
					dashboard = true,
					fzflua = true,
					gitpad = true,
					gitsigns = true,
					grapple = true,
					heirline = true,
					indentblankline = true,
					kubectl = true,
					lazy = false,
					leap = true,
					markview = true,
					mini = true,
					noice = true,
					notify = true,
					rainbow_delimiters = true,
					telescope = false,
					trouble = true,
					whichkey = true,
				},
			})
			vim.cmd('colorscheme cyberdream')
		end,
	},
	{
		'jonathancyu/kanagawa.nvim',
		priority = 1000,
		config = function()
			if colorscheme ~= 'kanagawa' then
				return
			end
			local kanagawa = require('kanagawa')
			kanagawa.setup({
				-- transparent = true, -- this breaks JDTLS appearance
				theme = 'wave',
			})
			vim.opt.termguicolors = true
			kanagawa.load('wave')
		end,
	},
}
