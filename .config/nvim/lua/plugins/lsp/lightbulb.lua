return {
	-- 'kosayoda/nvim-lightbulb',
	'lvim-tech/nvim-lightbulb',
	opts = {
		autocmd = { enabled = true },
		-- Modes
		sign = { enabled = false },
		virtual_text = {
			enabled = true,
			text = '',
		},
		float = { enabled = false }, -- this is quite ugly
	},
}
