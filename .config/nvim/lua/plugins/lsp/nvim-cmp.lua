return {
    'hrsh7th/nvim-cmp',
    event = {'InsertEnter', 'CmdlineEnter'},
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'Dosx001/cmp-commit',
        'windwp/nvim-autopairs',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            sources = cmp.config.sources({
                {name = 'luasnip'},
                {name = 'nvim_lsp'},
                {name = 'path'}
            }, {
                    {name = 'buffer'},
                }),
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({select = false}),
                ['<Tab>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })
        -- Insert ( after selecting function/method
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        -- Show git completions in commmit window
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                {name = 'commit'},
            })
        })

        -- Copmletion for / and ?
        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                name = {'buffer'}
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                    { name = 'cmdline' }
                }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end
}
