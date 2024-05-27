return {
    -- Lists all problems
    'folke/trouble.nvim',
    branch = 'dev',
    opts = {},
    keys = {
        {
            '<leader>to',
            '<cmd>Trouble diagnostics toggle<cr>'
        }

    }

    -- config = function ()
    --     local actions = require("telescope.actions")
    --     local trouble = require("trouble.providers.telescope")
    --     local telescope = require("telescope")
    --     telescope.setup {
    --         defaults = {
    --             mappings = {
    --                 i = { ["<c-t>"] = trouble.open_with_trouble },
    --                 n = { ["<c-t>"] = trouble.open_with_trouble },
    --             },
    --         },
    --     }
    -- end,

}
