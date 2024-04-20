return {
    'sindrets/winshift.nvim',
    opts = {},
    lazy = true,
    keys = {
        { '<leader>wm', '<cmd>WinShift<cr>', desc = 'Move window' },
        { '<leader>ws', '<cmd>WinShift swap<cr>', desc = 'Move window' }
    }
}
