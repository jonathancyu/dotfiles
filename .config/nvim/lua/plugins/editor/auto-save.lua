return {
	'okuuva/auto-save.nvim',
	dependencies = {
		'stevearc/conform.nvim',
	},
	enabled = true,
	event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
	opts = {
		execution_message = {
			enabled = false,
		},
		dir = vim.fn.expand(vim.fn.stdpath('state') .. '/sessions/'), -- directory where session files are saved
		options = { 'buffers', 'curdir', 'tabpages', 'winsize' }, -- sessionoptions used for saving
		debounce = 135,
		-- noautocmd = true, -- avoid triggering formatting -- BREAKS rustfmt
		-- condition = function(buffer)
		-- 	local fn = vim.fn
		-- 	-- TODO: this should be a set lookup in a blacklist
		-- 	if vim.bo[buffer].filetype == 'harpoon' then
		-- 		return false
		-- 	end
		--
		-- 	local filepath = fn.expand('%:p') -- Get the full path of the current buffer
		--
		-- 	-- Check if the file is located in the ~/dotfiles/.config/nvim directory
		-- 	if string.find(filepath, '^' .. fn.expand('~/dotfiles/.config/nvim')) == 1 then
		-- 		return false -- Don't save files in ~/dotfiles/.config/nvim
		-- 	end
		-- end,
	},
}
