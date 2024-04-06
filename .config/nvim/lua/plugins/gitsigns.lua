return {
    'lewis6991/gitsigns.nvim',
    opts = {
        signs = {
            add         = { text = '▐' },
            change      = { text = '▐' },
        }
    },
    keys = {
        {
            ']c',
            '<cmd>Gitsigns next_hunk<CR>',
            desc = 'Next diff hunk'
        },
        {
            '[c',
            '<cmd>Gitsigns prev_hunk<CR>',
            desc = 'Next diff hunk'
        }
    }
}
