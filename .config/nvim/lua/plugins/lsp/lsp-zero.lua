return {
    -- lsp
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'folke/neoconf.nvim' },
        { 'folke/neodev.nvim' },
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim', opts = {}},
        {
            'williamboman/mason-lspconfig.nvim',
            opts = {
                ensure_installed = {
                    'pyright', 'lua_ls', 'bashls', 'rust_analyzer'
                },
                automatic_installation = true,
                inlay_hints = {
                    enabled = true
                }
            }
        },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
    },
    config = function()
        local lsp = require('lsp-zero').preset('recommended')

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({buffer = bufnr})
        end)

        -- These must go before lspconfig
        require('neodev').setup({
            'nvim-dap', 'nvim-dap-ui',
            'neotest', 'neotest-python', 'neotest-java' -- TODO: can this be put in separate files?
        })
        require('neoconf').setup({})
        -- require('java').setup() -- TODO: this is broken


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
        local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
        default_capabilities.handlers = {
            ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
            ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
        }
        local lspconfig = require('lspconfig')
        local servers = {
            {name = 'bashls', capabilities = {}},
            {name = 'lua_ls', capabilities = {}},
            {name = 'pyright', capabilities = {}},
            {name = 'jdtls', capabilities = {
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                name = '21.0.1-amzn',
                                path = '$HOME/.sdkman/candidates/java/current',
                                default = true
                            }
                        }
                    }
                }
            }},
        }
        for _, server in ipairs(servers) do
            local capabilities = server.capabilities or default_capabilities
            for key, value in pairs(default_capabilities) do
                if capabilities[key] == nil then
                    capabilities[key] = value
                end
            end
            lspconfig[server.name].setup(capabilities)
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
}
