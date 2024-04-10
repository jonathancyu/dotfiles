return {
    'mbbill/undotree',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = {
        { '<leader>u', vim.cmd.UndoTreeToggle, desc = 'Toggle undotree' }
    }
}
