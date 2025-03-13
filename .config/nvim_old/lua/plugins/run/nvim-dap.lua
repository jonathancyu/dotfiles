return {
	'mfussenegger/nvim-dap',
	dependencies = {
		-- Creates a beautiful debugger UI
		'rcarriga/nvim-dap-ui',
		-- Inline variable value
		'theHamsta/nvim-dap-virtual-text',
		-- Required dependency for nvim-dap-ui
		'nvim-neotest/nvim-nio',
		-- Installs the debug adapters for you
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',
		-- Add your own debuggers here
		'mfussenegger/nvim-dap-python',
		'stevearc/overseer.nvim',
	},
	config = function()
		local dap = require('dap')
		dap.adapters = {
			['codelldb'] = {
				type = 'server',
				host = 'localhost',
				port = '${port}',
				executable = {
					command = 'codelldb',
					args = {
						'--port',
						'${port}',
					},
				},
			},
		}

		for _, lang in ipairs({ 'c', 'cpp' }) do
			dap.configurations[lang] = {
				{
					type = 'codelldb',
					request = 'launch',
					name = 'Launch file',
					program = function()
						return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = '${workspaceFolder}',
				},
				{
					type = 'codelldb',
					request = 'attach',
					name = 'Attach to process',
					pid = require('dap.utils').pick_process,
					cwd = '${workspaceFolder}',
				},
			}
		end

		-- TODO: get ensure_installed from adapters table
		require('mason-nvim-dap').setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				'codelldb',
			},
		})

		vim.keymap.set('n', '<F9>', dap.continue, { desc = 'Start/Continue' })
		vim.keymap.set('n', '<F8>', dap.step_over, { desc = 'Step Over' })
		vim.keymap.set('n', '<F7>', dap.step_into, { desc = 'Step Into' })
		vim.keymap.set('n', '<F6>', dap.step_out, { desc = 'Step Out' })

		vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[B]reakpoint' })
		vim.keymap.set('n', '<leader>dc', function()
			dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
		end, { desc = '[C]onditional Breakpoint' })

		-- DapUI
		local dapui = require('dapui')
		dapui.setup({})
		vim.keymap.set('n', '<F10>', dapui.toggle, { desc = 'See last session result.' })
		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		-- DAP virtual text
		require('nvim-dap-virtual-text').setup({})
		vim.fn.sign_define('DapBreakpoint', { text = '● ', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
		vim.fn.sign_define(
			'DapBreakpointCondition',
			{ text = '● ', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' }
		)

		-- Add overseer support
		require('overseer').enable_dap()
	end,
	keys = {
		{
			'<leader>dt',
			function()
				require('dapui').toggle()
			end,
			desc = '[D]ap [T]oggle UI',
		},
	},
}
