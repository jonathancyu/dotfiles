return {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",

    -- File navigation
    {
        'theprimeagen/harpoon', 
        config = function(plugin)
            require('config/harpoon')
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
            require('config/telescope')
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
