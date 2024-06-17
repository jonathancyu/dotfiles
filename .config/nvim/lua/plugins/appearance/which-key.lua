return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').register {
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>p'] = { name = '[P]ersist', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]un', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
            ['<leader>x'] = { name = 'Trouble', _ = 'which_key_ignore' },
        }
        -- visual mode
        require('which-key').register({
            ['<leader>h'] = { 'Git [H]unk' },
        }, { mode = 'v' })
    end
}
