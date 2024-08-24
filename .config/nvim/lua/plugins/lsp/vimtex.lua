return {
	{
		'lervag/vimtex',
		init = function()
			-- Can't be lazy loaded, so need to use init
			vim.g.tex_flavor = 'latex'
			vim.g.vimtex_view_method = 'zathura'
			vim.g.vimtex_compiler_method = 'tectonic'
			vim.g.vimtex_syntax_enabled = 0
		end,
	},
	{
		'micangl/cmp-vimtex',
		dependencies = { 'nvim-cmp' },
		filetype = 'tex',
		config = function()
			-- Vimtex
			require('cmp').setup.filetype('tex', {
				sources = {
					{ name = 'vimtex' },
					{ name = 'buffer' },
				},
			})
		end,
	},
}
