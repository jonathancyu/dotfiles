return {
    'stevearc/conform.nvim',

    ---@type conform.FormatterConfig
    opts = {
        formatters_by_ft = {
            lua = { 'stylua'},
            rust = { 'rustfmt' }
        }
    },
}
