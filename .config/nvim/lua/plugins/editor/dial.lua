return {
	'monaqa/dial.nvim',
	keys = {
		{
			'ga',
			mode = { 'n' },
			function()
				require('dial.map').manipulate('increment', 'normal')
			end,
			desc = 'Increment text',
		},
		{
			'gb',
			mode = { 'n' },
			function()
				require('dial.map').manipulate('decrement', 'normal')
			end,
			desc = 'Decrement text',
		},
		{
			'ga',
			mode = { 'n' },
			function()
				require('dial.map').manipulate('increment', 'gnormal')
			end,
			desc = 'Increment text',
		},
		{
			'gb',
			mode = { 'n' },
			function()
				require('dial.map').manipulate('decrement', 'gnormal')
			end,
			desc = 'Decrement text',
		},
		{
			'ga',
			mode = { 'v' },
			function()
				require('dial.map').manipulate('increment', 'visual')
			end,
			desc = 'Increment text',
		},
		{
			'gb',
			mode = { 'v' },
			function()
				require('dial.map').manipulate('decrement', 'visual')
			end,
			desc = 'Decrement text',
		},
		{
			'ga',
			mode = { 'v' },
			function()
				require('dial.map').manipulate('increment', 'gvisual')
			end,
			desc = 'Increment text',
		},
		{
			'gb',
			mode = { 'v' },
			function()
				require('dial.map').manipulate('decrement', 'gvisual')
			end,
			desc = 'Decrement text',
		},
	},
	config = function()
		local augend = require('dial.augend')
		require('dial.config').augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias['%Y/%m/%d'],
				augend.constant.new({
					elements = { 'true', 'false' },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { 'True', 'False' },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { 'and', 'or' },
					word = true,
					cyclic = true,
				}),
				augend.constant.new({
					elements = { '&&', '||' },
					word = false,
					cyclic = true,
				}),
			},
		})
	end,
}
