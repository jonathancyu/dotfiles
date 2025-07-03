return {
	'okuuva/auto-save.nvim',
	dependencies = {
		'stevearc/conform.nvim',
	},
	enabled = true,
	event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
	opts = {
		dir = vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/'), -- directory where session files are saved
		options = { 'buffers', 'curdir', 'tabpages', 'winsize' }, -- sessionoptions used for saving
		debounce = 100,
		condition = function(buffer)
			local fn = vim.fn
			local utils = require('auto-save.utils.data')

			if
				fn.getbufvar(buffer, '&modifiable') == 1
				-- change here is adding harpoon file type to exclusion list
				and utils.not_in(fn.getbufvar(buffer, '&filetype'), { 'harpoon', 'OverseerForm' })
			then
				return true
			end
			return false
		end,
	},
	keys = {},
}
