return {
	'stevearc/overseer.nvim',
	dependencies = {
		'mfussenegger/nvim-dap',
	},
	cmd = 'Overseer',
	opts = {
		templates = {
			'builtin',
			'user.run_script',
		},
		task_list = {
			bindings = {
				[']'] = 'IncreaseDetail',
				['['] = 'DecreaseDetail',
				['L'] = 'IncreaseAllDetail',
				['H'] = 'DecreaseAllDetail',
				['<C-u>'] = 'ScrollOutputUp',
				['<C-d>'] = 'ScrollOutputDown',
				['<C-h>'] = false,
				['<C-l>'] = false,
				['<C-j>'] = false,
				['<C-k>'] = false,
			},
		},
	},
	keys = {
		{
			'<leader>ol',
			'<cmd>OverseerRun<cr>',
			desc = '[L]ist run configs',
		},
		{
			'<leader>ot',
			function()
				vim.cmd('OverseerToggle')
			end,
			desc = '[T]oggle',
		},
		{
			'<leader>op',
			function()
				local overseer = require('overseer')
				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
					vim.notify('No tasks found', vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], 'restart')
				end
			end,
			desc = 'Run [p]revious',
		},
	},
}
