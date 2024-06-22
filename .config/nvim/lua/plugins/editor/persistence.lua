return {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
        { "<leader>ps", function() require("persistence").load() end, desc = "Restore [S]ession" },
        { "<leader>pl", function() require("persistence").load({ last = true }) end, desc = "Restore [L]ast Session" },
        { "<leader>pd", function() require("persistence").stop() end, desc = "[D]on't Save Current Session" },
    },
}
