return {
    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {
                'folke/neoconf.nvim',
                cmd = 'Neoconf',
                config = false,
                dependencies = {'nvim-lspconfig'}
            },
            {'folke/neodev.nvim'},
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim', opts = {}},
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    ensure_installed = {},
                    automatic_installation = true
                }
            },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                dependencies = {
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path'
                },
                config = function()
                    local cmp = require('cmp')
                    cmp.setup({
                        sources = {
                            {name = 'nvim_lsp'},
                        },
                        mapping = cmp.mapping.preset.insert({
                            -- Enter key confirms completion item
                            ['<CR>'] = cmp.mapping.confirm({select = false}),
                            ['<Tab>'] = cmp.mapping.confirm({select = true}),

                            -- Ctrl + space triggers completion menu
                            ['<C-Space>'] = cmp.mapping.complete(),
                        }),
                        snippet = {
                            expand = function(args)
                                require('luasnip').lsp_expand(args.body)
                            end,
                        },
                    })
                end
            },
            {'hrsh7th/cmp-nvim-lsp'},
            -- TODO: what does this do
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            local lsp = require('lsp-zero').preset('recommended')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- Neodev must go before lspconfig
            require('neodev').setup({})
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})


        end
    },
}
