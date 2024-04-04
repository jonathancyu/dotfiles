return {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    -- File navigation
    {
        'theprimeagen/harpoon', 
        config = function(plugin)
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)


            vim.keymap.set('n', '<C-j>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<C-k>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<C-l>', function() ui.nav_file(3) end)
            vim.keymap.set('n', '<C-;>', function() ui.nav_file(4) end)
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim"
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function(plugin)
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },

    -- Git
    {
        'tpope/vim-fugitive', 
        config = function(plugin)
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },

    -- Undoing
    {
        'mbbill/undotree',
        config = function(plugin) 
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },

    -- Automatic closing
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    }
}
