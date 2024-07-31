local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>a', function()
	vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = '[A]ction', silent = true, buffer = bufnr })

vim.keymap.set('n', '<leader>cx', function()
	vim.cmd.RustLsp('explainError') -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = 'E[x]plain error', silent = true, buffer = bufnr })

vim.keymap.set('n', '<leader>rd', function()
	vim.cmd.RustLsp('debuggables')
end, { desc = 'Show [d]ebug menu' })

local function starts_with(str, start)
	return str:sub(1, #start) == start
end
-- Go to test
local function goto_test()
	local root_path = vim.fn.getcwd()
	vim.notify('root: ' .. root_path)
	local absolute_file_path = vim.api.nvim_buf_get_name(0)
	vim.notify('abs: ' .. absolute_file_path)

	local file_path = string.sub(absolute_file_path, #root_path + 2, #absolute_file_path)
	vim.notify('fp: ' .. file_path)
	local target = nil

	if starts_with(file_path, 'src') then
		target = 'test' .. file_path:sub(#'src' + 1)
	elseif starts_with(file_path, 'test') then
		target = 'src' .. file_path:sub(#'test' + 1)
	end
	vim.notify('target: ' .. target)

	if target ~= nil then
		vim.cmd('edit ' .. target)
	end
end

vim.keymap.set('n', '<leader>gt', goto_test, { desc = '[G]oto [Test]' })
