return {
	'NvChad/nvim-colorizer.lua',
	opts = {
		filetypes = {
			'lua',
			'html',
			'typescriptreact',
			cmp_docs = { always_update = true },
		},
		user_default_options = {
			tailwind = true,
			mode = 'virtualtext',
			virtualtext_inline = true,
		},
	},
}
