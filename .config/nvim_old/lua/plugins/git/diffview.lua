return {
	'sindrets/diffview.nvim',
	keys = {
		{
			'<leader>gi',
			function ()
				if next(require("diffview.lib").views) == nil then
					vim.api.nvim_feedkeys(":DiffviewOpen", "n", false)
					require("cmp").complete()
				else
					vim.cmd("DiffviewClose")
				end
			end,
			desc = '[G]it diffv[i]ew',
		},
	},
	opts = {},
}
