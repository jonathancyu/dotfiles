return {
    'nvim-neotest/neotest',
    dependencies = {
        -- Dependencies
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',

        -- Adapters
        'nvim-neotest/neotest-python',
        'rcasia/neotest-java'
    },
    lazy = false,
    keys = {
        {'<leader>tr', function() require('neotest').run.run() end, desc = 'Run nearest test'},
        {'<leader>td', function() require('neotest').run.run({strategy = 'dap'}) end, desc = 'Run nearest test'},
        {'<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run all tests in file'},
        {'<leader>ts', function() require('neotest').run.stop() end, desc = 'Stop nearest test'},
        {'<leader>ta', function() require('neotest').run.attach() end, desc = 'Attach to nearest test'},
        {'<leader>tm', function() require('neotest').summary.toggle() end, desc = 'Toggle test summary'},
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-python')({
                    python = 'venv/bin/python',

                    pytest_discover_instances = true
                }),

                require('neotest-java'){
                    ignore_wrapper = false
                }
            }
        })
    end
}
