return {
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        config = function(plugin)
            require('kanagawa').setup({
                theme = 'dark'
            })
            vim.opt.termguicolors = true
            vim.cmd.colorscheme('kanagawa')
        end

    },
}
