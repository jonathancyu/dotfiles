return {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function()
        require('kanagawa').setup({
            theme = 'dark'
        })
        vim.opt.termguicolors = true
        vim.cmd.colorscheme('kanagawa')
    end

}
