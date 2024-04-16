return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/lsp-status.nvim',
    },
    opts = {
        options = {
            ignore_focus = {'neo-tree', 'fugitive'}
        },
    }
}
