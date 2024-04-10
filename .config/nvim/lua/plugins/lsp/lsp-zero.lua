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
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset('recommended')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- These must go before lspconfig
            require('neodev').setup({
                'nvim-dap', 'nvim-dap-ui',
                'neotest', 'neotest-python', 'neotest-java' -- TODO: can this be put in separate files?
            })
            require('java').setup()


            -- Lsp Config
            local border = {
                {"╭", "FloatBorder"},
                {"─", "FloatBorder"},
                {"╮", "FloatBorder"},
                {"│", "FloatBorder"},
                {"╯", "FloatBorder"},
                {"─", "FloatBorder"},
                {"╰", "FloatBorder"},
                {"│", "FloatBorder"},
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            capabilities.handlers = {
                ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
                ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
            }
            local lspconfig = require('lspconfig')
            local servers = {'lua_ls', 'pyright', 'jdtls'}
            for _, server in ipairs(servers) do
                lspconfig[server].setup(capabilities)
            end

            -- Highlight line number instead of having icons in sign column
            for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
                vim.fn.sign_define("DiagnosticSign" .. diag, {
                    text = "",
                    texthl = "DiagnosticSign" .. diag,
                    linehl = "",
                    numhl = "DiagnosticSign" .. diag,
                })
            end


            local desc = function(text, opts)
                opts = opts or {}
                opts.desc = text
                return opts
            end
            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, desc('Open diagnostic'))
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, desc('Prev diagnostic'))
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, desc('Next diagnostic'))
            -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist) -- Don't need this b/c trouble.nvim

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- TODO: these don't show up in whichkey
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, desc('Go to declaration', opts))
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc('Go to definition', opts))
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, desc('Show documentation', opts))
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, desc('Go to implementation', opts))
                    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, desc('Signature help', opts))
                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
                        desc('Add workspace folder', opts))
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
                        desc('Remove workspace folder', opts))
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                        end, desc('List workspace folders', opts))
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
                        desc('Go to type definition', opts))
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,
                        desc('Rename', opts))
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
                        desc('Code action', opts))
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc('Show references', opts))
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                        end, desc('Format buffer', opts))
                end,
            })

        end
    },
}
