return {
    'stevearc/conform.nvim',
    keys = {
        {
            "<leader>f",
            mode = { "n" },
            function () require("conform").format({ async = true, lsp_format = "fallback" }) end,
            desc = "[F]ormat",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            rust = { 'rustfmt' },
        },
    },
}
