return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	event = 'VeryLazy',
	keys = {

		-- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		-- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		-- { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		-- { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		-- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		-- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		-- { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		-- { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	},
	opts = {
		options = {
			mode = 'tabs',
			separator_style = 'thick',
			diagnostics = 'nvim_lsp',
			always_show_bufferline = false,
			offsets = {
				{
					filetype = 'neo-tree',
					text = 'Neo-tree',
					highlight = 'Directory',
					text_align = 'left',
				},
			},
		},
	},
}