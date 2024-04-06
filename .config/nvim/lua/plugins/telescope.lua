return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
        { '<leader>pf',
            function()
                require('telescope.builtin').find_files()
            end,
            desc = 'Find in project' },
        { '<C-p>',
            function()
                require('telescope.builtin').git_files()
            end,
            desc = 'Find in Git files' },
        { '<leader>ps',
            function()
                require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
            end,
            desc = 'Grep in project' }
    }
}
