return {
    'nvim-neotest/neotest',
    dependencies = {
        -- Dependencies
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        -- Kanagawa should be loaded as well
        'rebelot/kanagawa.nvim',
        -- Adapters
        'nvim-neotest/neotest-python',
        'rcasia/neotest-java',
        'rouge8/neotest-rust'
    },
    lazy = false,
    keys = {
        {'<leader>tr', function() require('neotest').run.run() end, desc = '[r]un nearest test'},
        {'<leader>td', function() require('neotest').run.run({strategy = 'dap'}) end, desc = '[d]ebug nearest test'},
        {'<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run all tests in [f]ile'},
        {'<leader>ts', function() require('neotest').run.stop() end, desc = '[s]top nearest test'},
        {'<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end, desc = 'Run [a]ll tests'},
        {'<leader>tm', function() require('neotest').summary.toggle() end, desc = 'Toggle test su[m]mary'},
    },
    config = function()
        require('neotest').setup({
            adapters = {
                require('neotest-python')({
                    python = 'venv/bin/python',

                    pytest_discover_instances = true
                }),
                require('neotest-rust'),
                require('neotest-java'){
                    ignore_wrapper = false
                }
            }
        })
        -- Fix colors
        local colors = require('plugins.appearance.colorscheme').colors
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
    end
}
