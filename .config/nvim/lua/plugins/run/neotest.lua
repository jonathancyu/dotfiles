return {
	'nvim-neotest/neotest',
	dependencies = {
		-- Dependencies
		'nvim-neotest/nvim-nio',
		'nvim-lua/plenary.nvim',
		'antoinemadec/FixCursorHold.nvim',
		'nvim-treesitter/nvim-treesitter',
		-- Kanagawa should be loaded as well
		'jonathancyu/kanagawa.nvim',
		-- Adapters
		'alfaix/neotest-gtest',
		'nvim-neotest/neotest-python',
		'rcasia/neotest-java',
		'mrcjkb/rustaceanvim',
	},
	lazy = false,
	keys = {
		{
			'<leader>tr',
			function()
				require('neotest').run.run()
			end,
			desc = '[R]un nearest test',
		},
		{
			'<leader>to',
			function()
				require('neotest').output.open()
			end,
			desc = '[T]est [Output]',
		},
		{
			'<leader>td',
			function()
				require('neotest').run.run({ strategy = 'dap' })
			end,
			desc = '[D]ebug nearest test',
		},
		{
			'<leader>tf',
			function()
				require('neotest').run.run(vim.fn.expand('%'))
			end,
			desc = '[T]est [F]ile',
		},
		{
			'<leader>tS',
			function()
				require('neotest').run.stop()
			end,
			desc = '[S]top nearest test',
		},
		{
			'<leader>ta',
			function()
				require('neotest').run.run(vim.fn.getcwd())
			end,
			desc = 'Run [A]ll tests',
		},
		{
			'<leader>ts',
			function()
				require('neotest').summary.toggle()
			end,
			desc = '[T]est [S]ummary',
		},
		{
			'<leader>tw',
			function()
				require('neotest').run.attach()
			end,
			desc = '[W]atch test',
		},
		{
			'<leader>tp',
			function()
				require('neotest').run.run_last()
			end,
			desc = '[P]revious test',
		},
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-python')({
					python = 'venv/bin/python',
					args = { '-s' },
					pytest_discover_instances = true,
				}),
				require('rustaceanvim.neotest'),
				require('neotest-java')({
					ignore_wrapper = false,
				}),
				require('neotest-gtest').setup({}),
			},
		})
		-- Fix colors
		local colors = require('kanagawa.palette')
		vim.api.nvim_set_hl(0, 'NeotestBorder', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestIndent', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestExpandMarker', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestDir', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestFile', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestFailed', { fg = colors.samuraiRed })
		vim.api.nvim_set_hl(0, 'NeotestPassed', { fg = colors.springGreen })
		vim.api.nvim_set_hl(0, 'NeotestSkipped', { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, 'NeotestRunning', { fg = colors.carpYellow })
		vim.api.nvim_set_hl(0, 'NeotestNamespace', { fg = colors.crystalBlue })
		vim.api.nvim_set_hl(0, 'NeotestAdapterName', { fg = colors.oniViolet })
	end,
}
