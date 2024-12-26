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
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['aC'] = '@comment.outer', -- TODO: fix
							['iC'] = '@comment.inner',
							['as'] = '@statement.outer',
							['ic'] = '@call.inner',
							['ac'] = '@call.outer',
						},
					},
				},
			})
		end,
	},
	{
		'chrisgrieser/nvim-various-textobjs',
		lazy = false,
		opts = { keymaps = { useDefaults = true } },
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		opts = { max_lines = 3 },
	},
}
