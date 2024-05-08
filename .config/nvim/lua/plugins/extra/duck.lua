return {
    "tamton-aquib/duck.nvim",

    keys = {
        { '<C-q>',
            function()
                require("duck").hatch('🐄')
            end,
            desc = 'Spawn Moo'
        },
        { '<leader>dk',
            function()
                require("duck").cook()
            end,
            desc = 'Kill moo'
        },
        { '<leader>da',
            function()
                require("duck").cook_all()
            end,
            desc = 'Kill all moos'
        }
    },
}
