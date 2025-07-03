return {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	opts = { options = vim.opt.sessionoptions:get() },
	config = function(...)
		require('persistence').setup()

		-- Create the autocommand group first
		vim.api.nvim_create_autocmd('User', {
			pattern = 'PersistenceSavePre',
			group = vim.api.nvim_create_augroup('Persistence', { clear = true }),
			callback = function()
				require('utility.windows').hide_windows()
			end,
		})
	end,
}
