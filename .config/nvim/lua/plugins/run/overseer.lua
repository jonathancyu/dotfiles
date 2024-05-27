return {
    'stevearc/overseer.nvim',
    opts = {
        templates = {
            "builtin", "user.run_python"
        }
    },
    keys = {
        {
            '<leader>rl', '<cmd>OverseerRun<cr>',
            desc = 'List run configs'
        },
        {
            '<leader>ro', '<cmd>OverseerOpen<cr>',
            desc = 'Open runs'
        },
        {
            '<leader>rp', function ()
                local overseer = require("overseer")
                local tasks = overseer.list_tasks({ recent_first = true })
                if vim.tbl_isempty(tasks) then
                    vim.notify("No tasks found", vim.log.levels.WARN)
                else
                    overseer.run_action(tasks[1], "restart")
                end
            end,
            desc = 'Run previous'
        }
    }
}
