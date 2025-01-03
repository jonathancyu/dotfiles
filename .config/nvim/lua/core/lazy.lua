require('lazy').setup({
	spec = {
		{ import = 'plugins.appearance' },
		{ import = 'plugins.editor' },
		{ import = 'plugins.extra' },
		{ import = 'plugins.git' },
		{ import = 'plugins.lsp' },
		{ import = 'plugins.navigation' },
		{ import = 'plugins.run' },
	},
	change_detection = { notify = false },
})
