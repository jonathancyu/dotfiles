return {
    {
        'run-configs.nvim',
        dir = '~/workspace/projects/run-configs.nvim',

        dependencies = {
            "grapp-dev/nui-components.nvim",
            dependencies = {
                "MunifTanjim/nui.nvim"
            },
        },

        opts = {},
        config = function()
            print("test)")
            -- require('run-configs').setup()
        end,
        keys = {
            {
                '<leader>ro',
                function()
                    require('run-configs').open()
                end,
                desc = 'Show run configs'
            }
        }
    }
}
