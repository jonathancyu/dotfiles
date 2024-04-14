return {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function()
        require('kanagawa').load('wave')
        vim.opt.termguicolors = true
    end

}
