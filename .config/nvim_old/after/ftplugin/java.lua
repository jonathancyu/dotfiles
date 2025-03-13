vim.keymap.set('n', '<leader>tc', function()
	vim.cmd('JavaTestRunCurrentClass')
end, { desc = 'Run tests in [C]lass' })

vim.keymap.set('n', '<leader>td', function()
	vim.cmd('JavaTestRunCurrentMethod')
end, { desc = '[D]ebug nearest test' })

vim.keymap.set('n', '<leader>tr', function()
	vim.cmd('JavaTestRunCurrentMethod')
end, { desc = '[R]un nearest test' })

vim.keymap.set('n', '<leader>ts', function()
	vim.cmd('JavaTestViewLastReport')
end, { desc = '[T]est [S]ummary' })

vim.g.disable_autoformat = true
