vim.g.disable_autoformat = false
require('which-key').add({
	mode = { 'n', 'x' },
	'<CR>',
	function(self)
		local buf = vim.api.nvim_get_current_buf()
		local bufname = vim.api.nvim_buf_get_name(buf)
		Snacks.debug.run({ buf = buf, name = bufname })
	end,
	desc = 'Source buffer',
})
