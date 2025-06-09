local resize_amount = 10
return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
	-- stylua: ignore
	keys = {
		{ '<A-h>', function() require('smart-splits').resize_left(resize_amount) end, { 'n' } },
		{ '<A-j>', function() require('smart-splits').resize_down(resize_amount) end, { 'n' } },
		{ '<A-k>', function()
			require('smart-splits').resize_up(resize_amount)
		end, { 'n' } },
		{ '<A-l>', function() require('smart-splits').resize_right(resize_amount) end, { 'n' } },
		{ '<C-h>', function() require('smart-splits').move_cursor_left() end, { 'n' } },
		{ '<C-j>', function() require('smart-splits').move_cursor_down() end, { 'n' } },
		{ '<C-k>', function() require('smart-splits').move_cursor_up() end, { 'n' } },
		{ '<C-l>', function() require('smart-splits').move_cursor_right() end, { 'n' } },
	},
  setup = function()
    require("smart-splits").setup()
  end,
}
