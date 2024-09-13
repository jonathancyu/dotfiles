local keys = {
	{
		'<leader>ch',
		function()
			require('harpoon'):list():add()
		end,
		desc = 'Add to [h]arpoon',
	},
	{
		'<C-e>',
		function()
			local harpoon = require('harpoon')
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = 'Show harpoon',
	},
}

for i, key in ipairs({ '1', '2', '3', '4' }) do
	local mapping = {
		string.format('<C-%s>', key),
		function()
			require('harpoon'):list():select(i)
		end,
	}
	table.insert(keys, mapping)
end

return {
	{
		'theprimeagen/harpoon',
		branch = 'harpoon2',
		keys = keys,
		opts = {},
		lazy = false,
	},
	{
		'letieu/harpoon-lualine',
		dependencies = { 'theprimeagen/harpoon', 'nvim-lualine/lualine.nvim' },
		lazy = false,
	},
}
