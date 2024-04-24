return {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 100,
    config = function()
        local kanagawa = require('kanagawa')
        kanagawa.setup({
            -- transparent = true, -- this breaks JDTLS appearance
            theme = "wave"
        })
        vim.opt.termguicolors = true
        kanagawa.load('wave')
    end

}
