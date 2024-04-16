return {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 100,
    config = function()
        require('kanagawa').load('wave')
        vim.opt.termguicolors = true
    end

}
