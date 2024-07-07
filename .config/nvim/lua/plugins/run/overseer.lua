return {
	'stevearc/overseer.nvim',
	dependencies = {
		'mfussenegger/nvim-dap',
	},
	opts = {
		templates = {
			'builtin',
		},
	},
	keys = {
		{
			'<leader>rl',
			'<cmd>OverseerRun<cr>',
			desc = '[L]ist run configs',
		},
		{
			'<leader>ro',
			'<cmd>OverseerOpen<cr>',
			desc = '[O]pen runs',
		},
		{
			'<leader>rp',
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
