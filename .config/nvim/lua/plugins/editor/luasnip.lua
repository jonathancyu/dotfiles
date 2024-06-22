return {
	{
		'L3MON4D3/LuaSnip',
		dependencies = { 'rafamadriz/friendly-snippets' },
		-- Mappings defined in cmp
		config = function()
			local ls = require('luasnip')
			-- TODO: add java class snippet
			vim.keymap.set({ 'i' }, '<C-K>', function()
				ls.expand()
			end, { silent = true })
			vim.keymap.set({ 'i', 's' }, '<C-L>', function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ 'i', 's' }, '<C-H>', function()
				ls.jump(-1)
			end, { silent = true })
			vim.keymap.set({ 'i', 's' }, '<C-E>', function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })
		end,
	},
	{
		'rafamadriz/friendly-snippets',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
			local ls = require('luasnip')
			ls.filetype_extend('java', { 'java-tests', 'java', 'javadoc' })
		end,
	},
}
