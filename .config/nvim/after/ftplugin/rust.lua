local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>ca",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { desc = '[C]ode [A]ction', silent = true, buffer = bufnr }
)

vim.keymap.set(
    'n',
    '<leader>rd',
    function () vim.cmd.RustLsp(
        'debuggables'
    ) end,
    { desc = 'Show [d]ebug menu' }
)
