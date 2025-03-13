vim.opt.colorcolumn = '88' -- https://black.readthedocs.io/en/stable/the_black_code_style/current_style.html#line-length
vim.g.disable_autoformat = false

-- Snippets
--[[
]]
local ls = require('luasnip')
local c = ls.choice_node
local i = ls.insert_node
local l = require('luasnip.extras').lambda
local fmt = require('luasnip.extras.fmt').fmt
local tsp = require('luasnip.extras.treesitter_postfix').treesitter_postfix
local for_query = [[
(for_statement
  left: (identifier) @lhs
  right: [(identifier)
          (attribute)
          (call function: [(identifier) (attribute)])
          ] @rhs
  body: (block) @body
  ) @prefix
]]
ls.add_snippets('python', {
	tsp(
		{
			matchTSNode = {
				query = for_query,
				query_lang = 'python',
				reparseBuffer = 'copy',
				wordTrig = false,
			},
			trig = '.enum',
		},

		c(1, {
			fmt('for {}, {} in enumerate({}):\n\t{}', {
				i(1, 'i'),
				l(l.LS_TSCAPTURE_LHS),
				l(l.LS_TSCAPTURE_RHS),
				l(l.LS_TSCAPTURE_BODY),
			}),
		})
	),
})
