return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',

		config = function()
			local configs = require('nvim-treesitter.configs')

			configs.setup({
				highlight = { enable = true },
				sync_install = true,
				indent = { enable = true },
				ignore_install = {},
				modules = {},
				auto_install = true,
				ensure_installed = {
					'bash',
					'c',
					'diff',
					'html',
					'javascript',
					'json',
					'jsonc',
					'lua',
					'luadoc',
					'luap',
					'markdown',
					'markdown_inline',
					'python',
					'regex',
					'toml',
					'typescript',
					'vim',
					'vimdoc',
					'xml',
					'yaml',
				},
			})
			-- vim.treesitter.language.register('toml', 'spotifyd.conf')
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		config = function()
			require('nvim-treesitter.configs').setup({
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@comment.outer', -- TODO: fix
							['ic'] = '@comment.inner',
						},
					},
				},
			})
		end,
	},
	{
		'chrisgrieser/nvim-various-textobjs',
		lazy = false,
		opts = { useDefaultKeymaps = true },
	},
	{ 'nvim-treesitter/nvim-treesitter-context', opts = {
		max_lines = 1,
	} },
}
