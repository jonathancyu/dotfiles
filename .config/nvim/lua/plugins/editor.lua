return {
    -- Praise folke
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    { 'folke/neodev.nvim', opts = {}},

    -- Debugging
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons'},
        opts = {}
    },


    -- File navigation
    {
        'theprimeagen/harpoon',
        config = function()
            local mark = require('harpoon.mark')
            local ui = require('harpoon.ui')

            vim.keymap.set('n', '<leader>a', mark.add_file)
            vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)


            vim.keymap.set('n', '<C-J>', function() ui.nav_file(1) end)
            vim.keymap.set('n', '<C-K>', function() ui.nav_file(2) end)
            vim.keymap.set('n', '<C-L>', function() ui.nav_file(3) end)
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
        config = function()
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
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {} },

    -- Undoing
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },

    -- Bracket stuff
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {}
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {}
    }
}
