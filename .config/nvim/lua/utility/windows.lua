local M = {}

local function is_iron_open()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- Check if buffer is loaded and valid
		if vim.api.nvim_buf_is_loaded(buf) then
			local bufname = vim.api.nvim_buf_get_name(buf)
			return true
		end
	end
	return false
end
function M.hide_windows()
	require('overseer').close()
	require('neo-tree').close_all()
	require('trouble').close()
	require('avante').close_sidebar()
	require('dapui').close()
	if is_iron_open() then
		require('iron.core').hide_repl()
	end
end

return M
