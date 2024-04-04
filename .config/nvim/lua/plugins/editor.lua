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
    {'tpope/vim-fugitive'},

    -- Undoing
    {'mbbill/undotree'},

}
