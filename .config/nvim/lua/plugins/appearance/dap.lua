return {
    {
        'mfussenegger/nvim-dap',

    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        keys = {
            {
                '<leader>dp',
                function() require('dap.ui.widgets').hover() end,
                desc = 'DAP Widgets hover'
            },
            {
                '<leader>db',
                function() require('dap').continue() end,
                desc = 'Toggle breakpoint'
            },
            {
                '<leader>dc',
                function() require('dap').continue() end,
                desc = 'Debug continue'
            },
            {
                '<leader>dr',
                function() require('dap').continue() end,
                desc = 'Open REPL'
            },
        },
        config = function()
            -- Auto-open dapui
            local dap, dapui = require('dap'), require('dapui')
            dap.listeners.before.attach.dapui_config = dapui.open
            dap.listeners.before.launch.dapui_config = dapui.open
            dap.listeners.before.event_terminated.dapui_config = dapui.close
            dap.listeners.before.event_exited.dapui_config = dapui.close
        end
    },

    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

            local dap = require('dap')
            table.insert(dap.configurations.python, {
                name = 'Perturb tc3-theia',
                type = 'python',
                request = 'launch',
                module = 'src.cli.perturb',
                args = {
                    '-i', '../data/benign_graphs/tc3-theia/firefox/nd',
                    '-o', 'output/tc3-theia/data2/benign',
                    '--epsilon1', '1',
                    '--alpha', '0.5',
                    '--beta', '0.5',
                    '--gamma', '0',
                    '--num_epochs', '100',
                    '--prediction_batch_size', '5',
                    '-N', '25',
                }
            })
        end,
        keys = {
            {
                '<leader>dn',
                function()
                    require('dap-python').test_method()
                end,
                silent = true,
                desc = 'Test method'
            },
            {
                '<leader>df',
                function()
                    require('dap-python').test_class()
                end,
                silent = true,
                desc = 'Test class'
            },
            {
                '<leader>ds',
                function()
                    require('dap-python').debug_selection()
                end,
                silent = true,
                desc = 'Debug selection'
            },
        }
    }
}
