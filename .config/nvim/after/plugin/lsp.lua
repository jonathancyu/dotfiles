-- lsp-zero config
local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- Initialize mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    automatic_installation = true
})

-- Add lua lsp config
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


-- Completion setup, must go after lsp-zero
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

vim.lsp.set_log_level('debug')
